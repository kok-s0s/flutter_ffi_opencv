import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_opencv/flutter_opencv.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';

void main() {
  gaussianBlur();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterOpencvPlugin = FlutterOpencv();

  var controller;

  @override
  void initState() {
    init();
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {});
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flutterOpencvPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            Text('Plugin Version:  ${getVersion()}'),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('name = ${getPersonName().cast<Utf8>().toDartString()}\n'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      var tempName = "";
                      tempName += controller.text;
                      setPersonName(tempName.toNativeUtf8().cast<Int8>());
                    });
                  },
                  child: const Text("New Name"),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('age = ${getPersonAge()}\n'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      setPersonAge(getPersonAge() + 1);
                    });
                  },
                  child: const Text("Add Age"),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('weight = ${getPersonWeight()}\n'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      setPersonWeight(getPersonWeight() + 1.5);
                    });
                  },
                  child: const Text("Add Weight"),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('height = ${getPersonHeight()}\n'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      setPersonHeight(getPersonHeight() + 1.5);
                    });
                  },
                  child: const Text("Add Height"),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}


import 'flutter_opencv_platform_interface.dart';

import 'dart:ffi';
import 'dart:io';

class FlutterOpencv {
  Future<String?> getPlatformVersion() {
    return FlutterOpencvPlatform.instance.getPlatformVersion();
  }
}

final DynamicLibrary oceanUltraLib = Platform.isAndroid
    ? DynamicLibrary.open("libcvPlugin.so")
    : DynamicLibrary.process();

final int Function() getVersion = oceanUltraLib
    .lookup<NativeFunction<Int Function()>>("getVersion")
    .asFunction();
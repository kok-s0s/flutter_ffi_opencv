
import 'flutter_opencv_platform_interface.dart';

import 'dart:ffi';
import 'dart:io';

class FlutterOpencv {
  Future<String?> getPlatformVersion() {
    return FlutterOpencvPlatform.instance.getPlatformVersion();
  }
}

final DynamicLibrary _opencvLib = Platform.isAndroid
    ? DynamicLibrary.open("libcvPlugin.so")
    : DynamicLibrary.process();

final int Function() getVersion = _opencvLib
    .lookup<NativeFunction<Int Function()>>("getVersion")
    .asFunction();
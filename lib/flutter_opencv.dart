
import 'package:ffi/ffi.dart';

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

final void Function() gaussianBlur = _opencvLib
    .lookup<NativeFunction<Void Function()>>("gaussianBlur")
    .asFunction();

// final void Function(Pointer<Utf8>, Pointer<Utf8>) gaussianBlur = _opencvLib
//     .lookup<NativeFunction<Void Function(Pointer<Utf8> inputPath, Pointer<Utf8> outputPath)>>("gaussianBlur")
//     .asFunction();

final int Function() getVersion = _opencvLib
    .lookup<NativeFunction<Int Function()>>("getVersion")
    .asFunction();
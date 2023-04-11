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

final int Function() getVersion = _opencvLib
    .lookup<NativeFunction<Int Function()>>("getVersion")
    .asFunction();

class Person extends Struct {
  external Pointer<Int8> name;

  @Int32()
  external int age;

  @Double()
  external double weight;

  @Double()
  external double height;
}

final Pointer<Person> Function() init = _opencvLib
    .lookup<NativeFunction<Pointer<Person> Function()>>("init")
    .asFunction();

final void Function(Pointer<Int8> name) setPersonName = _opencvLib
    .lookup<NativeFunction<Void Function(Pointer<Int8> name)>>("setPersonName")
    .asFunction();

final Pointer<Int8> Function() getPersonName = _opencvLib
    .lookup<NativeFunction<Pointer<Int8> Function()>>("getPersonName")
    .asFunction();

final void Function(int age) setPersonAge = _opencvLib
    .lookup<NativeFunction<Void Function(Int32 age)>>("setPersonAge")
    .asFunction();

final int Function() getPersonAge = _opencvLib
    .lookup<NativeFunction<Int Function()>>("getPersonAge")
    .asFunction();

final void Function(double weight) setPersonWeight = _opencvLib
    .lookup<NativeFunction<Void Function(Double weight)>>("setPersonWeight")
    .asFunction();

final double Function() getPersonWeight = _opencvLib
    .lookup<NativeFunction<Double Function()>>("getPersonWeight")
    .asFunction();

final void Function(double height) setPersonHeight = _opencvLib
    .lookup<NativeFunction<Void Function(Double weight)>>("setPersonHeight")
    .asFunction();

final double Function() getPersonHeight = _opencvLib
    .lookup<NativeFunction<Double Function()>>("getPersonHeight")
    .asFunction();

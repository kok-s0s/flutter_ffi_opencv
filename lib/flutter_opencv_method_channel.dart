import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_opencv_platform_interface.dart';

/// An implementation of [FlutterOpencvPlatform] that uses method channels.
class MethodChannelFlutterOpencv extends FlutterOpencvPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_opencv');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_opencv_method_channel.dart';

abstract class FlutterOpencvPlatform extends PlatformInterface {
  /// Constructs a FlutterOpencvPlatform.
  FlutterOpencvPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterOpencvPlatform _instance = MethodChannelFlutterOpencv();

  /// The default instance of [FlutterOpencvPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterOpencv].
  static FlutterOpencvPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterOpencvPlatform] when
  /// they register themselves.
  static set instance(FlutterOpencvPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

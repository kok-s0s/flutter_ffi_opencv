import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_opencv/flutter_opencv.dart';
import 'package:flutter_opencv/flutter_opencv_platform_interface.dart';
import 'package:flutter_opencv/flutter_opencv_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterOpencvPlatform
    with MockPlatformInterfaceMixin
    implements FlutterOpencvPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterOpencvPlatform initialPlatform = FlutterOpencvPlatform.instance;

  test('$MethodChannelFlutterOpencv is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterOpencv>());
  });

  test('getPlatformVersion', () async {
    FlutterOpencv flutterOpencvPlugin = FlutterOpencv();
    MockFlutterOpencvPlatform fakePlatform = MockFlutterOpencvPlatform();
    FlutterOpencvPlatform.instance = fakePlatform;

    expect(await flutterOpencvPlugin.getPlatformVersion(), '42');
  });
}


import 'flutter_opencv_platform_interface.dart';

class FlutterOpencv {
  Future<String?> getPlatformVersion() {
    return FlutterOpencvPlatform.instance.getPlatformVersion();
  }
}

#include "include/flutter_opencv/flutter_opencv_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_opencv_plugin.h"

void FlutterOpencvPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_opencv::FlutterOpencvPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

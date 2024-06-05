
import 'healthkit_plugin_platform_interface.dart';

class HealthkitPlugin {
  Future<String?> getPlatformVersion() {
    return HealthkitPluginPlatform.instance.getPlatformVersion();
  }
}

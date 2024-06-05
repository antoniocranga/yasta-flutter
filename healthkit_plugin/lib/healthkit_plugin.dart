import 'healthkit_plugin_platform_interface.dart';

class HealthkitPlugin {
  Future<String?> getPlatformVersion() {
    return HealthkitPluginPlatform.instance.getPlatformVersion();
  }

  Future<Map<String, String>?> querySteps({required int pastDays}) {
    return HealthkitPluginPlatform.instance.querySteps(pastDays: pastDays);
  }

  Future<bool?> requestAuthorization() {
    return HealthkitPluginPlatform.instance.requestAuthorization();
  }
}

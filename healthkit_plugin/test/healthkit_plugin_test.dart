import 'package:flutter_test/flutter_test.dart';
import 'package:healthkit_plugin/healthkit_plugin.dart';
import 'package:healthkit_plugin/healthkit_plugin_platform_interface.dart';
import 'package:healthkit_plugin/healthkit_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHealthkitPluginPlatform
    with MockPlatformInterfaceMixin
    implements HealthkitPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HealthkitPluginPlatform initialPlatform = HealthkitPluginPlatform.instance;

  test('$MethodChannelHealthkitPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHealthkitPlugin>());
  });

  test('getPlatformVersion', () async {
    HealthkitPlugin healthkitPlugin = HealthkitPlugin();
    MockHealthkitPluginPlatform fakePlatform = MockHealthkitPluginPlatform();
    HealthkitPluginPlatform.instance = fakePlatform;

    expect(await healthkitPlugin.getPlatformVersion(), '42');
  });
}

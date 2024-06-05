import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'healthkit_plugin_method_channel.dart';

abstract class HealthkitPluginPlatform extends PlatformInterface {
  /// Constructs a HealthkitPluginPlatform.
  HealthkitPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static HealthkitPluginPlatform _instance = MethodChannelHealthkitPlugin();

  /// The default instance of [HealthkitPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelHealthkitPlugin].
  static HealthkitPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HealthkitPluginPlatform] when
  /// they register themselves.
  static set instance(HealthkitPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map<String, String>?> querySteps({required int pastDays}) {
    throw UnimplementedError('querySteps() has not been implemented.');
  }

  Future<bool?> requestAuthorization() {
    throw UnimplementedError('requestAuthorization() has not been implemented.');
  }
}

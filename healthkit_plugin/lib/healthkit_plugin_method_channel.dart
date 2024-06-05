import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'healthkit_plugin_platform_interface.dart';

/// An implementation of [HealthkitPluginPlatform] that uses method channels.
class MethodChannelHealthkitPlugin extends HealthkitPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('healthkit_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

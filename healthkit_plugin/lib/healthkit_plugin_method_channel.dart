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

  @override
  Future<List<Object?>> querySteps({required int pastDays}) async {
    final steps = await methodChannel.invokeMethod<List<Object?>>('querySteps', {'pastDays': pastDays}) ?? [];
    return steps;
  }

  @override
  Future<bool?> requestAuthorization() async {
    try {
      final isAuthorized = await methodChannel.invokeMethod<bool?>('requestAuthorization');
      return isAuthorized;
    } on PlatformException catch (e) {
      debugPrint("Failed to authorize HealthKit: '${e.message}'");
      return false;
    }
  }

  @override
  Future<bool?> isHealthKitAvailable() async {
    try {
      final isAvailable = await methodChannel.invokeMethod<bool?>('isHealthKitAvailable');
      return isAvailable;
    } on PlatformException catch (e) {
      debugPrint("Failed to authorize HealthKit: '${e.message}'");
      return false;
    }
  }
}

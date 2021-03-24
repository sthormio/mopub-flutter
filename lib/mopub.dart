import 'dart:async';

import 'mopub_constants.dart';
import 'package:flutter/services.dart';

class MoPub {
  static const MethodChannel _channel = const MethodChannel(MAIN_CHANNEL);

  static Future<bool> init(String adUnitId, {bool testMode = false}) async {
    Map<String, dynamic> initValues = {
      "testMode": testMode,
      "adUnitId": adUnitId,
    };

    try {
      final result = await _channel.invokeMethod(INIT_METHOD, initValues);
      return result;
    } on PlatformException {
      throw PlatformException(
        message:
            "Platform expection: This plugin is available only for Android and iOS",
      );
    }
  }

  static Future<void> dispose() async {
    try {
      await _channel.invokeMethod(DISPOSE_METHOD);
    } on PlatformException {
      return;
    }
  }
}

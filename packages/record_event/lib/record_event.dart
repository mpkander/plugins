
import 'dart:async';

import 'package:flutter/services.dart';

class RecordEvent {
  static const MethodChannel _channel =
      const MethodChannel('record_event');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

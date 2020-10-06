import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:record_event/record_event.dart';

void main() {
  const MethodChannel channel = MethodChannel('record_event');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await RecordEvent.platformVersion, '42');
  });
}

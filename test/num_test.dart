import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/quickly.dart';

void main() {
  group('NumExtension', () {
    test('suffix() - returns 5th', () {
      expect(5.suffix(), equals('5th'));
    });
    test('suffix("%") - returns 5%', () {
      expect(5.suffix('%'), equals('5%'));
    });
    test('seconds - returns Duration: 00:00:05.000000', () {
      expect(5.seconds, equals(const Duration(seconds: 5)));
    });
    test('milliseconds - returns Duration: 0:00:00.005000', () {
      expect(5.milliseconds, equals(const Duration(milliseconds: 5)));
    });
    test('microseconds - returns Duration: 0:00:00.000005', () {
      expect(5.microseconds, equals(const Duration(microseconds: 5)));
    });
    test('minutes - returns Duration: 0:05:00.000000', () {
      expect(5.minutes, equals(const Duration(minutes: 5)));
    });
    test('hours - returns Duration: 5:00:00.000000', () {
      expect(5.hours, equals(const Duration(hours: 5)));
    });
    test('days - returns Duration: 120:00:00.000000', () {
      expect(5.days, equals(const Duration(days: 5)));
    });
  });
}

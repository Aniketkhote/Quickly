import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/src/dart/extensions/int_extension.dart';

void main() {
  group('IntExtension', () {
    test('getMonthName() - returns January', () {
      expect(1.getMonthName(), equals('January'));
    });
    test('getMonthName(true) - returns Jan', () {
      expect(1.getMonthName(isShort: true), equals('Jan'));
    });
    test('getMonthName(invalid number) - returns Invalid number of month', () {
      expect(13.getMonthName(), equals('Invalid number of month'));
    });
    test('getWeekName() - returns Monday', () {
      expect(1.getWeekName(), equals('Monday'));
    });
    test('getWeekName(true) - returns Mon', () {
      expect(1.getWeekName(isShort: true), equals('Mon'));
    });
    test('getWeekName(invalid number) - returns Invalid number of week', () {
      expect(8.getWeekName(), equals('Invalid number of week'));
    });
    test('getWeekName(invalid number) - returns Sunday', () {
      expect(7.getWeekName(), equals('Sunday'));
    });
    test('getMonthName() - returns December', () {
      expect(12.getMonthName(), equals('December'));
    });
    test('getMonthName(true) - returns Dec', () {
      expect(12.getMonthName(isShort: true), equals('Dec'));
    });
  });
}

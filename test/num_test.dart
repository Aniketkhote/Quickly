import "package:flutter_test/flutter_test.dart";
import "package:quickly/quickly.dart";

void main() {
  group("NumExtension", () {
    test("suffix() should return the correct ordinal suffix", () {
      expect(1.suffix(), equals("1st"));
      expect(2.suffix(), equals("2nd"));
      expect(3.suffix(), equals("3rd"));
      expect(4.suffix(), equals("4th"));
      expect(11.suffix(), equals("11th"));
      expect(21.suffix(), equals("21st"));
      expect(102.suffix(), equals("102nd"));
    });

    test("suffix(String) should append the given string to the number", () {
      expect(5.suffix("foo"), equals("5foo"));
      expect(5.suffix(), equals("5th"));
    });

    test(
        "seconds should return a Duration object representing the number of seconds",
        () {
      expect(5.seconds, equals(const Duration(seconds: 5)));
    });

    test(
        "milliseconds should return a Duration object representing the number of milliseconds",
        () {
      expect(5.milliseconds, equals(const Duration(milliseconds: 5)));
    });

    test(
        "microseconds should return a Duration object representing the number of microseconds",
        () {
      expect(5.microseconds, equals(const Duration(microseconds: 5)));
    });

    test(
        "minutes should return a Duration object representing the number of minutes",
        () {
      expect(5.minutes, equals(const Duration(minutes: 5)));
    });

    test(
        "hours should return a Duration object representing the number of hours",
        () {
      expect(5.hours, equals(const Duration(hours: 5)));
    });

    test("days should return a Duration object representing the number of days",
        () {
      expect(5.days, equals(const Duration(days: 5)));
    });
  });
}

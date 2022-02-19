import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/quickly.dart';

void main() {
  group('num Extensions', () {
    group('.suffix', () {
      test('.suffix() - return string with suffix 1st',
          () => expect(1.suffix(), equals('1st')));
      test('.suffix() - return string with suffix 3rd',
          () => expect(3.suffix(), equals('3rd')));
      test('.suffix() - return string with suffix 20th',
          () => expect(20.suffix(), equals('20th')));
      test('.suffix() - return string with suffix 10\$',
          () => expect(10.suffix('\$'), equals('10\$')));
    });
    group('duration', () {
      test('.seconds - return duration in seconds',
          () => expect(1.seconds, equals(Duration(seconds: 1))));
      test('.milliseconds - return duration in milliseconds',
          () => expect(1.milliseconds, equals(Duration(milliseconds: 1))));
      test('.milliseconds - return duration in milliseconds',
          () => expect(1.milliseconds, equals(Duration(milliseconds: 1))));
      test('.minutes - return duration in minutes',
          () => expect(1.minutes, equals(Duration(minutes: 1))));
      test('.hours - return duration in hours',
          () => expect(1.hours, equals(Duration(hours: 1))));
      test('.days - return duration in days',
          () => expect(1.days, equals(Duration(days: 1))));
    });
  });
}

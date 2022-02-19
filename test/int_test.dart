import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/quickly.dart';

void main() {
  group('int Extensions', () {
    test('.getMonthName() - return month name January',
        () => expect(1.getMonthName(), equals('January')));
    test('.getMonthName(true) - return month name Jan',
        () => expect(1.getMonthName(true), equals('Jan')));
    test('.getWeekName() - return month name Monday',
        () => expect(1.getWeekName(), equals('Monday')));
    test('.getWeekName(true) - return month name Mon',
        () => expect(1.getWeekName(true), equals('Mon')));
  });
}

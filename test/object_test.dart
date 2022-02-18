import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/quickly.dart';

void main() {
  group('Object Extensions', () {
    Map<int, String> map = <int, String>{1: 'One', 2: 'Two'};

    test('.match() - condition match return value',
        () => expect(2.match(map), equals('Two')));
    test('.match() - condtion dose not match return default value',
        () => expect(12.match(map), equals('Invalid input')));
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/quickly.dart';

void main() {
  group('Map Extensions', () {
    Map<String, dynamic> input1 = <String, dynamic>{};
    Map<String, dynamic> input2 = <String, dynamic>{
      'name': 'P 1',
      'price': 49,
      'qty': 10
    };
    Map<String, dynamic> input3 = <String, dynamic>{
      'id': 1,
      'name': 'P 1',
      'price': 49,
      'stock': true,
    };

    group('.getId', () {
      test('.getId - map is empty so return 0',
          () => expect(input1.getId, equals(0)));
      test('.getId - map does not have given key return 0',
          () => expect(input2.getId, equals(0)));
      test('.getId - map have given key so return value of key which is 1',
          () => expect(input3.getId, equals(1)));
    });

    group('.getBool(key)', () {
      test('.getBool() - map is empty so return false',
          () => expect(input1.getBool('stock'), equals(false)));
      test('.getBool() - map does not have given key return false',
          () => expect(input2.getBool('color'), equals(false)));
      test('.getBool() - map have given key but not bool type return false',
          () => expect(input3.getBool('name'), equals(false)));
      test(
          '.getBool() - map have given key so return value of key which is true',
          () => expect(input3.getBool('stock'), equals(true)));
    });

    group('.getString(key)', () {
      test('.getString() - map is empty so return empty string',
          () => expect(input1.getString('stock'), equals('')));
      test('.getString() - map does not have given key return empty string',
          () => expect(input2.getString('color'), equals('')));
      test(
          '.getString() - map have given key but not String type return empty string',
          () => expect(input3.getString('price'), equals('')));
      test(
          '.getString() - map have given key so return value of key which is 49',
          () => expect(input3.getString('name'), equals('P 1')));
    });

    group('map1.diffKeys(map2)', () {
      test(
          '.diffKeys() - return all entries of input1 according to keys which is not in input2',
          () => expect(
              input2.diffKeys(input3), equals(<dynamic, dynamic>{'qty': 10})));
    });
    group('map1.diffValues(map2)', () {
      test(
          '.diffValues() - return all entries of input1 according to values which is not in input2',
          () => expect(input2.diffValues(input3),
              equals(<dynamic, dynamic>{'qty': 10})));
    });

    group('.methodName(key, value)', () {
      test('.has(key, value) - return true key/value present in map',
          () => expect(input3.has('price', 49), equals(true)));
      test('.has(key, value) - return false value not present in map',
          () => expect(input2.has('price', 'red'), equals(false)));
      test('.has(key, value) - return false key & value not present in map',
          () => expect(input2.has('color', 'red'), equals(false)));
      test('.doesntHave(key, value) - return true key/value not present in map',
          () => expect(input2.doesntHave('price', 'red'), equals(true)));
      test(
          '.doesntHave(key, value) - return false key/value not present in map',
          () => expect(input2.doesntHave('qty', 10), equals(false)));
    });

    group('.match()', () {
      Map<int, String> map = <int, String>{1: 'One', 2: 'Two'};

      test('.match() - condition match return value',
          () => expect(map.match(2), equals('Two')));
      test('.match() - condtion dose not match return default value',
          () => expect(map.match(12), equals('Invalid input')));
    });

    test('Test retainKeys()', () {
      Map<String, dynamic> map = <String, dynamic>{
        "id": 1,
        "name": "John",
        "age": 30,
        "gender": "male"
      };
      Map<dynamic, dynamic> newMap = map.retainKeys(<String>["id", "name"]);
      expect(newMap, <dynamic, dynamic>{"id": 1, "name": "John"});
    });
  });
}

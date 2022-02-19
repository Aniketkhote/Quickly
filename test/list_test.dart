import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/quickly.dart';

void main() {
  group('List Extensions', () {
    test('.sum - sum of [1, 3, 4, 2, 5] is 15',
        () => expect(<dynamic>[1, 3, 4, 2, 5].sum, equals(15)));
    test('.avg - avg of [1, 3, 4, 2, 5] is 3',
        () => expect(<dynamic>[1, 3, 4, 2, 5].avg, equals(3)));
    test('.min - min of [1, 3, 4, 2, 5] is 1',
        () => expect(<dynamic>[1, 3, 4, 2, 5].min, equals(1)));
    test('.max - max of [1, 3, 4, 2, 5] is 5',
        () => expect(<dynamic>[1, 3, 4, 2, 5].max, equals(5)));
    test(
        '.sorted() - sorted of [1, 3, 4, 2, 5] is [1,2,3,4,5]',
        () => expect(<dynamic>[1, 3, 4, 2, 5].sorted(),
            equals(<dynamic>[1, 2, 3, 4, 5])));
    test(
        '.sorted(true) - descending sorted list of [1, 3, 4, 2, 5] is [5,4,3,2,1]',
        () => expect(<dynamic>[1, 3, 4, 2, 5].sorted(true),
            equals(<dynamic>[5, 4, 3, 2, 1])));
    test(
        '.sortedDesc() - descending sorted list of [1, 3, 4, 2, 5] is [5,4,3,2,1]',
        () => expect(<dynamic>[1, 3, 4, 2, 5].sortedDesc,
            equals(<dynamic>[5, 4, 3, 2, 1])));
    test(
        '.chunk(2) - chunk this list [1, 2, 3, 4, 5] into [[1,2], [3,4], [4]]',
        () => expect(
            <dynamic>[1, 2, 3, 4, 5].chunk(2),
            equals(<dynamic>[
              <dynamic>[1, 2],
              <dynamic>[3, 4],
              <dynamic>[5]
            ])));
    test(
        '.split(2) - split this list [1, 2, 3, 4, 5] into [[1,2,3] ,[4,5]]',
        () => expect(
            <dynamic>[1, 2, 3, 4, 5].split(2),
            equals(<dynamic>[
              <dynamic>[1, 2, 3],
              <dynamic>[4, 5]
            ])));
  });

  group('List extensions on List of maps', () {
    List<dynamic> input = <dynamic>[
      <dynamic, dynamic>{'price': 100},
      <dynamic, dynamic>{'price': 45},
      <dynamic, dynamic>{'price': 89},
    ];

    test('.sortBy() - sorted list according to key', () {
      List<dynamic> output = <dynamic>[
        <dynamic, dynamic>{'price': 45},
        <dynamic, dynamic>{'price': 89},
        <dynamic, dynamic>{'price': 100},
      ];
      expect(input.sortBy('price'), equals(output));
    });
    test('.sortByDesc() - sorted list by descending according to key', () {
      List<dynamic> output = <dynamic>[
        <dynamic, dynamic>{'price': 100},
        <dynamic, dynamic>{'price': 89},
        <dynamic, dynamic>{'price': 45},
      ];
      expect(input.sortByDesc('price'), equals(output));
    });
    test('.sortByDesc() - return [] list when given list is empty', () {
      List<dynamic> output = <dynamic>[];
      expect(<dynamic>[].sortByDesc('price'), equals(output));
    });
    test('.sortByDesc() - return [] list when given list is doesn\\t have map',
        () {
      List<dynamic> output = <dynamic>[];
      expect(<dynamic>[1, 2, 3, 4, 5].sortByDesc('price'), equals(output));
    });
    test(
        '.sortByDesc() - return [] list when given list is does not contains this key',
        () {
      List<dynamic> output = <dynamic>[];
      expect(input.sortByDesc('name'), equals(output));
    });

    group('has', () {
      List<dynamic> list = <dynamic>[
        <dynamic, dynamic>{
          'id': 1,
          'name': 'P 1',
          'price': 49,
          'stock': true,
        },
        <dynamic, dynamic>{
          'id': 1,
          'name': 'P 1',
          'price': 49,
          'stock': true,
        },
      ];

      test('.hasKey() - return true list have this key',
          () => expect(list.hasKey('name'), equals(true)));

      test('.hasKey() - return false list dosen\\t have this key',
          () => expect(list.hasKey('unit'), equals(false)));

      test('.hasValue() - return true list have this Value',
          () => expect(list.hasValue(49), equals(true)));

      test('.hasValue() - return false list dosen\\t have this Value',
          () => expect(list.hasValue('49'), equals(false)));

      test('.hasKeyValue() - return true list have this Key/Value',
          () => expect(list.hasKeyValue('price', 49), equals(true)));

      test('.hasKeyValue() - return false list dosen\\t have this Key/Value',
          () => expect(list.hasKeyValue('price', 50), equals(false)));
    });
  });
}

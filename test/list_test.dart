import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/quickly.dart';

void main() {
  group('List Extensions', () {
    List<int> list = <int>[1, 3, 4, 2, 5];
    test('.sum - sum of [1, 3, 4, 2, 5] is 15',
        () => expect(list.sum, equals(15)));
    test('.avg - avg of [1, 3, 4, 2, 5] is 3',
        () => expect(list.avg, equals(3)));
    test('.min - min of [1, 3, 4, 2, 5] is 1',
        () => expect(list.min, equals(1)));
    test('.max - max of [1, 3, 4, 2, 5] is 5',
        () => expect(list.max, equals(5)));
    test('.sorted() - sorted of [1, 3, 4, 2, 5] is [1,2,3,4,5]',
        () => expect(list.sorted(), equals(<dynamic>[1, 2, 3, 4, 5])));
    test(
        '.sorted(true) - descending sorted list of [1, 3, 4, 2, 5] is [5,4,3,2,1]',
        () => expect(list.sorted(true), equals(<dynamic>[5, 4, 3, 2, 1])));
    test(
        '.sortedDesc() - descending sorted list of [1, 3, 4, 2, 5] is [5,4,3,2,1]',
        () => expect(list.sortedDesc, equals(<dynamic>[5, 4, 3, 2, 1])));
    test(
      '.chunk(2) - chunk this list [1, 2, 3, 4, 5] into [[1,2], [3,4], [4]]',
      () => expect(
        <dynamic>[1, 2, 3, 4, 5].chunk(2),
        equals(
          <dynamic>[
            <dynamic>[1, 2],
            <dynamic>[3, 4],
            <dynamic>[5]
          ],
        ),
      ),
    );
    test(
      '.split(2) - split this list [1, 2, 3, 4, 5] into [[1,2,3] ,[4,5]]',
      () => expect(
        <dynamic>[1, 2, 3, 4, 5].split(2),
        equals(
          <dynamic>[
            <dynamic>[1, 2, 3],
            <dynamic>[4, 5]
          ],
        ),
      ),
    );
    test(
      '.flatten - flatten this list [[1,2,3] ,[4,5]] into [1, 2, 3, 4, 5]',
      () => expect(
        <dynamic>[
          <dynamic>[1, 2, 3],
          <dynamic>[4, 5]
        ].flatten,
        equals(<dynamic>[1, 2, 3, 4, 5]),
      ),
    );
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
    test('.sortDescBy() - sorted list by descending according to key', () {
      List<dynamic> output = <dynamic>[
        <dynamic, dynamic>{'price': 100},
        <dynamic, dynamic>{'price': 89},
        <dynamic, dynamic>{'price': 45},
      ];
      expect(input.sortDescBy('price'), equals(output));
    });
    test('.sortDescBy() - return [] list when given list is empty', () {
      List<dynamic> output = <dynamic>[];
      expect(<dynamic>[].sortDescBy('price'), equals(output));
    });
    test('.sortDescBy() - return [] list when given list is doesn\\t have map',
        () {
      List<dynamic> output = <dynamic>[];
      expect(<dynamic>[1, 2, 3, 4, 5].sortDescBy('price'), equals(output));
    });
    test(
        '.sortDescBy() - return [] list when given list is does not contains this key',
        () {
      List<dynamic> output = <dynamic>[];
      expect(input.sortDescBy('name'), equals(output));
    });

    group('Lists of maps', () {
      List<dynamic> list = <dynamic>[
        <String, dynamic>{
          'id': 1,
          'name': 'P 1',
          'price': 49,
          'stock': true,
        },
        <String, dynamic>{
          'id': 2,
          'name': 'P 2',
          'price': 49,
          'stock': true,
        },
      ];

      test('.hasKey() - return true if list have this key',
          () => expect(list.hasKey('name'), equals(true)));

      test('.hasKey() - return false if list dosen\\t have this key',
          () => expect(list.hasKey('unit'), equals(false)));

      test('.hasValue() - return true if list have this Value',
          () => expect(list.hasValue(49), equals(true)));

      test('.hasValue() - return false if list dosen\\t have this Value',
          () => expect(list.hasValue('49'), equals(false)));

      test('.hasKeyValue() - return true if list have this Key/Value',
          () => expect(list.hasKeyValue('price', 49), equals(true)));

      test('.hasKeyValue() - return false if list dosen\\t have this Key/Value',
          () => expect(list.hasKeyValue('price', 50), equals(false)));

      test('.pluck() - return list of Values by key',
          () => expect(list.pluck('name'), equals(<String>['P 1', 'P 2'])));

      test('.pluck() - return null if Key list dosen\\t have this Key',
          () => expect(list.pluck('qty'), equals(<dynamic>[])));

      Map<dynamic, List<dynamic>> map = <dynamic, List<dynamic>>{
        "P 1": <dynamic>[
          <dynamic, dynamic>{"id": 1, "name": "P 1", "price": 49, "stock": true}
        ],
        "P 2": <dynamic>[
          <dynamic, dynamic>{"id": 2, "name": "P 2", "price": 49, "stock": true}
        ]
      };
      test('.groupBy() - Group the objects according to function',
          () => expect(list.groupBy((dynamic v) => v['name']), equals(map)));
      test('.groupByKey() - Group the objects according to function',
          () => expect(list.groupByKey('name'), equals(map)));

      test(
        '.latestFirst() - Group the objects according to function',
        () => expect(
          list.latestFirst(),
          equals(
            <String, dynamic>{
              'id': 2,
              'name': 'P 2',
              'price': 49,
              'stock': true,
            },
          ),
        ),
      );
      test(
        '.oldestFirst() - Group the objects according to function',
        () => expect(
          list.oldestFirst('name'),
          equals(
            <String, dynamic>{
              'id': 1,
              'name': 'P 1',
              'price': 49,
              'stock': true,
            },
          ),
        ),
      );
    });
  });
}

import "package:flutter_test/flutter_test.dart";
import "package:quickly/quickly.dart";

void main() {
  group("MapExtension", () {
    late Map<String, dynamic> map;
    setUp(() {
      map = <String, Object>{
        "id": 1,
        "name": "John",
        "age": 30,
        "isAdmin": true,
        "balance": 120.5,
      };
    });

    test("has", () {
      expect(map.has("id", 1), isTrue);
      expect(map.has("name", "John"), isTrue);
      expect(map.has("isAdmin", true), isTrue);
      expect(map.has("balance", 120.5), isTrue);
      expect(map.has("age", 20), isFalse);
      expect(map.has("gender", "male"), isFalse);
    });

    test("doesntHave", () {
      expect(map.doesntHave("id", 1), isFalse);
      expect(map.doesntHave("name", "John"), isFalse);
      expect(map.doesntHave("isAdmin", true), isFalse);
      expect(map.doesntHave("balance", 120.5), isFalse);
      expect(map.doesntHave("age", 20), isTrue);
      expect(map.doesntHave("gender", "male"), isTrue);
      expect(map.doesntHave("gender", null), isTrue);
    });

    test("retainKeys", () {
      final Map<dynamic, dynamic> newMap =
          map.retainKeys(<String>["id", "name", "balance"]);
      expect(
        newMap,
        equals(
          <dynamic, dynamic>{"id": 1, "name": "John", "balance": 120.5},
        ),
      );
    });

    test("getId", () {
      expect(map.getId(), equals(1));

      final Map<String, String> map2 = <String, String>{"name": "Chair"};
      expect(map2.getId(), equals(null));
    });

    test("diffKeys", () {
      final Map<String, Object> map2 = <String, Object>{
        "id": 1,
        "name": "John",
        "age": 20,
        "email": "john@example.com",
      };
      final Map<dynamic, dynamic> diff = map.diffKeys(map2);
      expect(diff, equals(<String, Object>{"isAdmin": true, "balance": 120.5}));
    });

    test("diffValues", () {
      final Map<String, Object> map2 = <String, Object>{
        "id": 2,
        "name": "Jane",
        "age": 30,
        "isAdmin": true,
        "balance": 120.5,
      };
      final Map<dynamic, dynamic> diff = map.diffValues(map2);
      expect(diff, equals(<String, Object>{"name": "John", "id": 1}));
    });

    test("getBool", () {
      expect(map.getBool("isAdmin"), isTrue);
      expect(map.getBool("isActive"), isFalse);
      expect(map.getBool("age"), isFalse);
    });

    test("getInt", () {
      expect(map.getInt("id"), equals(1));
      expect(map.getInt("balance"), isNull);
      expect(map.getInt("age"), equals(30));
      expect(map.getInt("email"), isNull);
    });

    test("getDouble", () {
      expect(map.getDouble("balance"), equals(120.5));
      expect(map.getDouble("email"), isNull);
      expect(map.getDouble("age"), 30.0);
    });

    test("getList", () {
      final Map<String, dynamic> map = <String, dynamic>{
        "a": 1,
        "b": <int>[2, 4],
        "c": <String>["a", "b"],
        "d": <dynamic>["a", 2],
      };
      expect(map.getList("a"), equals(<int>[]));
      expect(map.getList("b"), equals(<int>[2, 4]));
      expect(map.getList("c"), equals(<String>["a", "b"]));
      expect(map.getList("d"), equals(<dynamic>["a", 2]));
    });
  });
}

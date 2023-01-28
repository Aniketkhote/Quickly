/// Map extension to extend Map functionality
///
/// This extension allows you to perform various operations on a `Map<T, T>` such as checking if a key/value pair exists,
/// getting the value of a specific key and casting it to a certain type, removing key-value pairs from the map based
/// on their keys or values, and getting a list from the map.
extension MapExtension<T> on Map<T, T> {
  ///Whether this map contains the given [key]/[value] pair.
  ///
  ///This method checks if the key exists in the map and the value of the key is equal to the value passed to the method.
  ///
  ///Example:
  ///```dart
  ///Map<String, dynamic> map = {'id': 1, 'name': 'Desk', 'price': 200};
  ///print(map.has("id", 1)); // true
  ///print(map.has("id", 2)); // false
  ///```
  bool has(String key, dynamic value) => containsKey(key) && this[key] == value;

  ///If this map does not contains the given [key]/[value] pair.
  ///
  ///
  ///Example:
  ///```dart
  /// Map<String, dynamic> map = {"name": "John", "age": 30};
  ///
  /// print(map.doesntHave("gender", "male")); // true
  ///
  /// print(map.doesntHave("gender", null)); // true
  ///```
  bool doesntHave(String key, T value) => !has(key, value);

  /// Removes the key/value pairs from the map whose keys are not present in the given [keys] list.
  ///
  /// Returns a new map containing only the key/value pairs whose keys are present in the given [keys] list.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {"id": 1, "name": "John", "age": 30};
  /// var newMap = map.retainKeys(["id", "name"]);
  /// print(newMap); // {"id": 1, "name": "John"}
  /// ```
  Map<T, T> retainKeys(List<T> keys) {
    removeWhere((T key, T value) => !keys.contains(key));
    return this;
  }

  ///Returns the ID of the object if exists otherwise return 0;
  ///
  ///Example:
  ///```dart
  /// Map<String, dynamic> map = {'id': 111, 'name': 'Desk'};
  /// int id = map.getId;
  /// print(id); // Output: 111
  ///
  /// Map<String, dynamic> map2 = {'name': 'Chair'};
  /// int id2 = map2.getId;
  /// print(id2); // Output: 0
  ///```
  int get getId =>
      (containsKey('id') && this['id'] != null) ? this['id'] as int : 0;

  ///Returns all entries of this map according to keys.
  ///
  ///which is not in second map.
  ///
  ///Example:
  ///```dart
  ///map.diffKeys(map2)
  ///```
  Map<T, T> diffKeys<K, V>(Map<K, V> map) {
    removeWhere((T key, T value) => map.containsKey(key));
    return this;
  }

  ///Returns all entries of this map according to values.
  ///
  ///which is not in second map.
  ///
  ///Example:
  ///```dart
  ///map.diffValues(map2)
  ///```
  Map<T, T> diffValues(Map<T, T> map) {
    removeWhere((T key, T value) => map.containsValue(value));
    return this;
  }

  /// Reads a [key] value of [bool] type from [Map].
  ///
  /// If the key is not present in the map or the value of the key is not of type bool,
  /// the method will return the default value of `false`.
  ///
  /// Example:
  ///```dart
  /// Map<String, dynamic> map = {'isAdmin': true, 'isActive': false};
  /// print(map.getBool('isAdmin'));  // Output: true
  /// print(map.getBool('isActive'));  // Output: false
  /// print(map.getBool('isDeleted'));  // Output: false
  ///```
  bool getBool(String key) =>
      (containsKey(key) && this[key] is bool) ? this[key] as bool : false;

  /// Reads a [key] value of [int] type from [Map].
  ///
  /// If the key is not present in the map or the value of the key is not of type int, it will return null.
  ///
  /// Example:
  ///```dart
  /// Map<String, dynamic> map = {'id': 11, 'name': 'John Doe', 'age': 30};
  /// print(map.getInt('id')); // 11
  /// print(map.getInt('age')); // 30
  /// print(map.getInt('address')); // null
  ///```
  int? getInt(String key) =>
      containsKey(key) ? int.tryParse('${this[key]}') : 0;

  /// Reads a [key] value of [double] type from [Map].
  ///
  /// If the map contains the key and the value of that key is a double, it will return the value as a double.
  /// Otherwise, it will return null.
  ///
  /// Example:
  ///```dart
  ///Map<String, dynamic> map = {'price': 27.32, 'qty': '27.32', 'inStock': true};
  ///
  ///print(map.getDouble("price")); // 27.32
  ///print(map.getDouble("qty")); // 27.32
  ///print(map.getDouble("isStock")); // null
  ///print(map.getDouble("size")); // null
  ///```
  double? getDouble(String key) =>
      containsKey(key) ? double.tryParse('${this[key]}') : 0.0;

  /// Reads a [key] value of [String] type from [Map].
  ///
  /// If value/map is NULL or not [String] type return empty string
  ///
  /// Example:
  ///```dart
  /// Map<String, dynamic> map = {'username': 'thor', 'age': 35};
  ///
  /// String username = map.getString('username');
  /// print(username); // Output: thor
  ///
  /// String email = map.getString('email', 'not_provided@example.com');
  /// print(email); // Output: not_provided@example.com
  ///```
  String getString(String key, [String defaultString = '']) =>
      this[key] is String ? this[key] as String : defaultString;

  /// This method retrieves the list associated with the given key from the map.
  /// If the key is not present or the value associated with the key is not a list,
  /// it returns an empty list of the generic type T.
  ///
  /// @param key - a string key of the list you want to retrieve from the map
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {'items': [1, 2, 3, 4], 'prices': [20.0, 30.0, 40.0]};
  ///
  /// map.getList<int>('items') // returns [1, 2, 3, 4]
  /// map.getList<double>('prices') // returns [20.0, 30.0, 40.0]
  /// map.getList<int>('invalidKey') // returns []
  /// ```
  List<T> getList<T>(String key) =>
      containsKey(key) && this[key] is List<T> ? this[key] as List<T> : <T>[];

  /// The match() function also works similarly to switch
  ///
  /// i.e, it finds the matching case according to the condition passed in it.
  ///
  /// Map<String, dynamic> map = {
  /// 'apple': 'red',
  /// 'banana': 'yellow',
  /// 'orange': 'orange'
  /// };

  /// print(map.match('apple')); // returns 'red'
  /// print(map.match('pear'));  // returns 'Invalid input'
  dynamic match(T condition, [String? byDefault = 'Invalid input']) =>
      containsKey(condition) ? this[condition] : byDefault;
}

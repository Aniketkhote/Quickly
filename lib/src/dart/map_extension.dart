///Map extension to extend Map functionality
extension MapExtension<T> on Map<T, T> {
  ///Whether this map contains the given [key]/[value] pair.
  ///
  ///Returns true if any of the key / value pair in the map are equal.
  ///
  ///Example:
  ///```dart
  ///map.has("key","value") // true
  ///```
  bool has(String key, T value) {
    return entries.any(
        (MapEntry<T, T> entry) => entry.key == key && entry.value == value);
  }

  ///If this map does not contains the given [key]/[value] pair.
  ///
  ///
  ///Example:
  ///```dart
  ///map.doesntHave("key","value") // true
  ///```
  bool doesntHave(String key, T value) => !has(key, value);

  ///Returns the ID of the object if exists otherwise return 0;
  ///
  ///Example:
  ///```dart
  ///map.getId // 111
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
  Map<T, T> diffKeys(Map<T, T> map) {
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
  /// If value/map is NULL or not [bool] type return default value [false]
  ///
  /// Example:
  ///```dart
  ///map.getBool("isAdmin") // true
  ///```
  bool getBool(String key) =>
      (containsKey(key) && this[key] is bool) ? this[key] as bool : false;

  /// Reads a [key] value of [int] type from [Map].
  ///
  /// If value/map is NULL or not [int] type return null
  ///
  /// Example:
  ///```dart
  ///map.getInt("id") // 11
  ///```
  int? getInt(String key) =>
      containsKey(key) ? int.tryParse('${this[key]}') : 0;

  /// Reads a [key] value of [double] type from [Map].
  ///
  /// If value/map is NULL or not [double] type return null
  ///
  /// Example:
  ///```dart
  ///map.getDouble("price") // 27.32
  ///```
  double? getDouble(String key) =>
      containsKey(key) ? double.tryParse('${this[key]}') : 0.0;

  /// Reads a [key] value of [String] type from [Map].
  ///
  /// If value/map is NULL or not [String] type return empty string
  ///
  /// Example:
  ///```dart
  ///map.getString("username") // thor
  ///```
  String getString(String key, [String defaultString = '']) =>
      this[key] is String ? this[key] as String : defaultString;

  /// Reads a [key] value of [List] type from [Map].
  ///
  /// If value/map is NULL or not [List] type return empty list
  ///
  /// Example:
  ///```dart
  ///map.getList(productList) // return list if exists otherwise return empty list
  ///```
  List<T> getList<T>(String key) =>
      this[key] is List<T> ? this[key] as List<T> : <T>[];

  /// The match() function also works similarly to switch
  ///
  /// i.e, it finds the matching case according to the condition passed in it.
  dynamic match(T condition, [String? byDefault = 'Invalid input']) =>
      containsKey(condition) ? this[condition] : byDefault;
}

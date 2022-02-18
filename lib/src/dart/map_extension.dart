///Map extension to extend Map functionality
extension MapExtensions on Map<dynamic, dynamic> {
  ///Whether this map contains the given [key]/[value] pair.
  ///
  ///Returns true if any of the key / value pair in the map are equal.
  ///
  ///Example:
  ///```dart
  ///map.contains("key","value") // true
  ///```
  bool contains(String key, dynamic value) {
    bool _isContain = false;

    forEach((dynamic k, dynamic v) {
      if (k == key && v == value) _isContain = true;
    });
    return _isContain;
  }

  ///Returns the ID of the object if exists otherwise return 0;
  ///
  ///Example:
  ///```dart
  ///map.getId // 111
  ///```
  dynamic get getId =>
      (containsKey('id') && this['id'] != null) ? this['id'] : 0;

  ///Returns all entries of this map according to keys.
  ///
  ///which is not in second map.
  ///
  ///Example:
  ///```dart
  ///map.diffKeys(map2)
  ///```
  Map<dynamic, dynamic> diffKeys(Map<dynamic, dynamic> map) {
    removeWhere((dynamic key, dynamic value) => map.containsKey(key));
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
  Map<dynamic, dynamic> diffValues(Map<dynamic, dynamic> map) {
    removeWhere((dynamic key, dynamic value) => map.containsValue(value));
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
      (containsKey(key) && this[key] is bool) ? this[key] : false;

  /// Reads a [key] value of [int] type from [Map].
  ///
  /// If value/map  is NULL or not [int] type return default value [0]
  ///
  /// Example:
  ///```dart
  ///map.getInt("id") // 11
  ///```
  int getInt(String key) => containsKey(key) ? this[key].toInt : 0;

  /// Reads a [key] value of [double] type from [Map].
  ///
  /// If value/map  is NULL or not [double] type return default value [0.0]
  ///
  /// Example:
  ///```dart
  ///map.getDouble("price") // 27.32
  ///```
  double getDouble(String key) => containsKey(key) ? this[key].toDouble : 0.0;

  /// Reads a [key] value of [String] type from [Map].
  ///
  /// If value/map  is NULL or not [String] type return default value ['']
  ///
  /// Example:
  ///```dart
  ///map.getString("username") // thor
  ///```
  String getString(String key, [String defaultString = '']) =>
      (containsKey(key) && this[key] is String) ? this[key] : defaultString;

  /// Reads a [key] value of [List] type from [Map].
  ///
  /// If value/map is NULL or not [List] type return empty list
  ///
  /// Example:
  ///```dart
  ///map.getList(productList) // return list if exists otherwise return empty list
  ///```
  List<T> getList<T>(String key) =>
      (containsKey(key) && this[key] is List<T>) ? this[key] : <T>[];
}

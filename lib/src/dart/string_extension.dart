import 'dart:io';

///String extensions to get basic functionality on strings
extension StringExtension on String {
  ///match string with regex pattern
  bool regex(String source) => RegExp(source).hasMatch(this);

  ///Checks [string] is letter or not and return [bool]
  bool get isAlphabet => regex(r'^[a-zA-Z]+$');

  ///Checks [string] is Number or not and return [bool]
  bool get isNumber => regex(r'^[0-9]+$');

  ///Checks [string] is Alpha Numerical or not and return [bool]
  bool get isAlphaNumeric => regex(r'^[a-zA-z0-9]+$');

  ///Checks [string] is valid email or not and return [bool]
  bool get isEmail => regex(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  ///Checks [string] is valid mobile number or not and return [bool]
  ///
  ///eg. 7xxxxxxxxxx, 8xxxxxxxxxx, 9xxxxxxxxxx
  bool get isINDMobile => regex("^([789]{1}[0-9]{9})");

  ///Check this string min length, if satisfied condition then return true
  bool minLen(int min) => length >= min;

  ///Check this string max length, if satisfied condition then return true
  bool maxLen(int max) => length <= max;

  ///Check this string length between [minLen] & [maxLen], if satisfied condition then return true
  bool range(int min, int max) => length >= min && length <= max;

  ///Remove first element of [string]
  String removeFirst([int? upto]) =>
      minLen(2) ? substring(upto ?? 1, length) : "";

  ///Remove last element of [string]
  String removeLast([int? upto]) =>
      minLen(2) ? substring(0, length - upto!) : "";

  ///Removes all whitespace
  String get removeWhitespace => replaceAll(' ', '');

  ///Concatenate [string] with whitespace
  String concat(String concat) => '$this $concat';

  ///Replaces all but the last num runes of a string with the specified mask.
  String mask({int upto = 4, String mask = '*'}) =>
      substring(length - upto).padLeft(length, mask);

  ///Counts the number of occurrences of string
  Map<String, int> get count {
    String _str = removeWhitespace;

    Map<String, int> map = <String, int>{};

    for (int i = 0; i < _str.length; i++) {
      int count = map[_str[i]] ?? 0;
      map[_str[i]] = count + 1;
    }
    return map;
  }

  ///Counts the number of occurrences of value.
  int get occurrence => isEmpty ? 0 : allMatches(this).length;

  ///Counts the number of words in
  int get countWord {
    final List<String> _l = split(' ');
    return _l.length;
  }

  ///Get default value if string is empty.
  String withDefault([String value = 'default']) => isEmpty ? value : this;

  ///Convert string to [int]
  int get toInt => isEmpty ? int.parse('$this') : 0;

  ///Convert string to [double]
  double get toDouble => isEmpty ? double.parse('$this') : 0.0;

  ///Get file name from this
  String get fileName => split(Platform.pathSeparator).last;

  ///Get file extension from this
  String get fileExt => fileName.split('.').last;

  ///Get file path without file name from this
  String get filePath => removeLast(fileName.length);

  ///Convert [string] into slug
  String get toSlug => trim().toLowerCase().replaceAll(" ", "-");

  ///Converts all characters in this string to capital case.
  String get toCapitalCase => this[0].toUpperCase() + substring(1);

  ///Converts all first characters in this string to capital case and rest to the lower case.
  String get toTitleCase => replaceAllMapped(
          RegExp(
              r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
          (Match m) =>
              "${m[0]![0].toUpperCase()}${m[0]!.substring(1).toLowerCase()}")
      .replaceAll(RegExp(r'(_|-)+'), ' ');

  ///Capitalize first letter of String and convert rest of string into lower case
  String get toSentenceCase =>
      this[0].toUpperCase() + substring(1).toLowerCase();

  ///check string is in Sentence case or not
  bool get isSentence => this == toSentenceCase ? true : false;

  ///check string is in Title case or not
  bool get isTitle => this == toTitleCase ? true : false;

  ///check string is in capital case or not
  bool get isCapital => this == toCapitalCase ? true : false;

  ///check string is in lower case or not
  bool get isLower => this == toLowerCase() ? true : false;

  ///check string is in upper case or not
  bool get isUpper => this == toUpperCase() ? true : false;

  ///Check image is svg or not
  bool get isSvg => toLowerCase().endsWith(".svg");

  ///Check image is png or not
  bool get isPng => toLowerCase().endsWith(".png");

  ///Check image is jpg or jpeg or not
  bool get isJpg =>
      toLowerCase().endsWith(".jpg") || toLowerCase().endsWith(".jpeg");

  ///Check file is pdf or not
  bool get isPDF => toLowerCase().endsWith(".pdf");

  ///Check file is csv or not
  bool get isCsv => toLowerCase().endsWith(".csv");

  ///Check file is text or not
  bool get isTxt => toLowerCase().endsWith(".txt");

  ///check string is image
  bool get isImage {
    String _ext = toLowerCase();
    return _ext.isJpg || _ext.isPng || _ext.isSvg;
  }

  ///check string is video
  bool get isVideo {
    String _ext = toLowerCase();
    return _ext.endsWith(".mp4") ||
        _ext.endsWith(".avi") ||
        _ext.endsWith(".mpeg") ||
        _ext.endsWith(".WEBM");
  }

  ///check string is audio
  bool get isAudio {
    String _ext = toLowerCase();
    return _ext.endsWith(".mp3") ||
        _ext.endsWith(".wav") ||
        _ext.endsWith(".aac") ||
        _ext.endsWith(".wma");
  }
}

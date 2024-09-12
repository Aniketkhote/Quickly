import 'dart:convert';

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

  /// Checks if string is URL.
  bool get isURL => regex(
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,7}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
      );

  /// Checks if string is email.
  bool get isEmail => regex(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );

  /// Checks if the string is a valid phone number.
  bool get isPhone => regex(r'^\+?[0-9]{10,15}$');

  /// Checks if the string is a valid hexadecimal color code.
  bool get isHexColor => regex(r'^#(?:[0-9a-fA-F]{3}){1,2}$');

  /// Checks if the string is a valid credit card number using a basic regex.
  bool get isCreditCard => regex(r'^[0-9]{13,19}$');

  /// Checks if the string is a valid JSON format.
  bool get isJson {
    try {
      json.decode(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Checks if the string is a valid UUID.
  bool get isUUID => regex(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$');

  /// Checks if the string contains HTML.
  bool get isHtml => regex(r'<[^>]*>');

  /// Checks if the string is a valid date in 'YYYY-MM-DD' format.
  bool get isDate => regex(r'^\d{4}-\d{2}-\d{2}$');

  /// Checks if the string is a valid time in 'HH:MM' format.
  bool get isTime => regex(r'^([01]\d|2[0-3]):([0-5]\d)$');

  /// Checks if the string is a valid IPv4 address.
  bool get isIPv4 => regex(
      r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');

  /// Checks if the string is a valid IPv6 address.
  bool get isIPv6 => regex(r'^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$');

  /// Reverses the entire string.
  String get reverse => split('').reversed.join('');

  /// Removes all digits from the string.
  String get removeDigits => replaceAll(RegExp(r'\d+'), '');

  /// Removes all special characters, leaving only alphanumeric values.
  String get removeSpecialChars => replaceAll(RegExp(r'[^\w\s]+'), '');

  /// Toggles the case of each character in the string.
  String get toggleCase => split('').map((char) {
        return char == char.toUpperCase()
            ? char.toLowerCase()
            : char.toUpperCase();
      }).join('');

  /// Extracts all valid email addresses from the string.
  List<String> extractEmails() {
    final emailRegex = RegExp(r'[\w\.-]+@[\w\.-]+\.\w+');
    return emailRegex.allMatches(this).map((match) => match.group(0)!).toList();
  }

  /// Extracts all valid URLs from the string.
  List<String> extractUrls() {
    final urlRegex = RegExp(r'https?://[^\s/$.?#].[^\s]*');
    return urlRegex.allMatches(this).map((match) => match.group(0)!).toList();
  }

  /// Removes all HTML tags from the string.
  String get removeHtmlTags => replaceAll(RegExp(r'<[^>]*>'), '');

  /// Checks if string is boolean.
  static bool isBool(String value) {
    return value == "true" || value == "false";
  }

  ///Check this string min length, if satisfied condition then return true
  bool minLen(int min) => length >= min;

  ///Check this string max length, if satisfied condition then return true
  bool maxLen(int max) => length <= max;

  ///Check this string length between [minLen] & [maxLen], if satisfied condition then return true
  bool inRange(int min, int max) => length >= min && length <= max;

  ///Remove first element of [string]
  String removeFirst([int? upto]) =>
      minLen(2) ? substring(upto ?? 1, length) : '';

  ///Remove last element of [string]
  String removeLast([int upto = 1]) =>
      minLen(2) ? substring(0, length - upto) : '';

  ///Removes all whitespace
  String get removeWhitespace => replaceAll(' ', '');

  ///Concatenate [string] with whitespace
  String concat(String concat) => '$this $concat';

  ///append to start [string]
  String append(String string) => this + string;

  ///prepend to start [string]
  String prepend(String string) => string + this;

  ///Replaces all but the last num runes of a string with the specified mask.
  String? mask({int upto = 4, String mask = '*', bool atEnd = false}) {
    if (length <= 1 || upto < 1 || length < upto) {
      return this;
    }

    return atEnd
        ? substring(0, length - upto) + mask * upto
        : mask * upto + substring(upto);
  }

  ///Counts the number of occurrences of string
  Map<String, int> get occurrences {
    final String str = removeWhitespace;
    return str.split('').fold(<String, int>{},
        (Map<String, int> map, String char) {
      map[char] = (map[char] ?? 0) + 1;
      return map;
    });
  }

  ///Counts the number of occurrences of value.
  int countOccurrence(String string) =>
      isEmpty ? 0 : RegExp(string).allMatches(this).length;

  ///Counts the number of words in
  int get countWord => split(' ').length;

  ///Get default value if string is empty.
  String ifEmpty([String value = 'null']) => trim().isEmpty ? value : this;

  ///Convert string to [int]
  int? get toInt {
    try {
      return double.tryParse(this)?.toInt();
    } catch (e) {
      return null;
    }
  }

  ///Convert string to [double]
  double? get toDouble {
    try {
      return double.tryParse(this);
    } catch (e) {
      return null;
    }
  }

  ///Convert [string] into slug
  String get toSlug => trim().toLowerCase().replaceAll(' ', '-');

  ///Converts all characters in this string to capital case.
  String get toCapitalCase => split(' ')
      .map(
        (String word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '',
      )
      .join(' ');

  ///Converts all first characters in this string to capital case and rest to the lower case.
  String get toTitleCase => split(' ')
      .map(
        (String word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '',
      )
      .join(' ');

  ///Capitalize first letter of String and convert rest of string into lower case
  String get toSentenceCase =>
      isNotEmpty ? this[0].toUpperCase() + substring(1).toLowerCase() : '';

  ///check string is in Sentence case or not
  bool get isSentence => this == toSentenceCase;

  ///check string is in Title case or not
  bool get isTitle => this == toTitleCase;

  ///check string is in capital case or not
  bool get isCapital => this == toCapitalCase;

  ///check string is in lower case or not
  bool get isLower => this == toLowerCase();

  ///check string is in upper case or not
  bool get isUpper => this == toUpperCase();

  ///Check image is svg or not
  bool get isSvg => _endsWith('.svg');

  ///Check image is png or not
  bool get isPng => _endsWith('.png');

  ///Check image is jpg or jpeg or not
  bool get isJpg => _endsWith('.jpg') || _endsWith('.jpeg');

  ///Check file is pdf or not
  bool get isPDF => _endsWith('.pdf');

  ///Check file is csv or not
  bool get isCsv => _endsWith('.csv');

  ///Check file is text or not
  bool get isTxt => _endsWith('.txt');

  ///check string is image
  bool get isImage => isJpg || isPng || isSvg;

  ///check string is video
  bool get isVideo =>
      _endsWith('.mp4') ||
      _endsWith('.avi') ||
      _endsWith('.mov') ||
      _endsWith('.mkv');

  ///check string is audio
  bool get isAudio =>
      _endsWith('.mp3') ||
      _endsWith('.wav') ||
      _endsWith('.aac') ||
      _endsWith('.m4a');

  bool _endsWith(String pattern) => toLowerCase().endsWith(pattern);
}

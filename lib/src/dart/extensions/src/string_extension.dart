import 'dart:convert';

/// Extension on [String] to provide additional functionality and utility methods.
///
/// This extension enhances the capabilities of [String] by adding methods for:
/// - Validating string formats (e.g., email, URL, phone number)
/// - Manipulating string content (e.g., reversing, removing characters)
/// - Extracting information from strings
/// - Converting string formats
/// - Checking string properties
extension StringExtension on String {
  /// Checks if the string matches the given regex pattern.
  ///
  /// @param source The regex pattern to match against.
  /// @return True if the string matches the pattern, false otherwise.
  bool regex(String source) => RegExp(source).hasMatch(this);

  /// Checks if the string contains only alphabetic characters.
  bool get isAlphabet => regex(r'^[a-zA-Z]+$');

  /// Checks if the string contains only numeric characters.
  bool get isNumber => regex(r'^[0-9]+$');

  /// Checks if the string contains only alphanumeric characters.
  bool get isAlphaNumeric => regex(r'^[a-zA-z0-9]+$');

  /// Checks if the string is a valid URL.
  bool get isURL => regex(
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,7}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
      );

  /// Checks if the string is a valid email address.
  bool get isEmail => regex(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );

  /// Checks if the string is a valid phone number.
  ///
  /// Validates phone numbers with optional country code and 10-15 digits.
  bool get isPhone => regex(r'^\+?[0-9]{10,15}$');

  /// Checks if the string is a valid hexadecimal color code.
  bool get isHexColor => regex(r'^#(?:[0-9a-fA-F]{3}){1,2}$');

  /// Checks if the string is a valid credit card number.
  ///
  /// Uses a basic regex to validate numbers between 13 and 19 digits.
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

  /// Checks if the string contains HTML tags.
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

  /// Removes all special characters, leaving only alphanumeric values and spaces.
  String get removeSpecialChars => replaceAll(RegExp(r'[^\w\s]+'), '');

  /// Toggles the case of each character in the string.
  String get toggleCase => split('').map((char) {
        return char == char.toUpperCase()
            ? char.toLowerCase()
            : char.toUpperCase();
      }).join('');

  /// Extracts all valid email addresses from the string.
  ///
  /// @return A list of extracted email addresses.
  List<String> extractEmails() {
    final emailRegex = RegExp(r'[\w\.-]+@[\w\.-]+\.\w+');
    return emailRegex.allMatches(this).map((match) => match.group(0)!).toList();
  }

  /// Extracts all valid URLs from the string.
  ///
  /// @return A list of extracted URLs.
  List<String> extractUrls() {
    final urlRegex = RegExp(r'https?://[^\s/$.?#].[^\s]*');
    return urlRegex.allMatches(this).map((match) => match.group(0)!).toList();
  }

  /// Removes all HTML tags from the string.
  String get removeHtmlTags => replaceAll(RegExp(r'<[^>]*>'), '');

  /// Checks if the string represents a boolean value.
  ///
  /// @param value The string to check.
  /// @return True if the string is "true" or "false", case-sensitive.
  static bool isBool(String value) {
    return value == "true" || value == "false";
  }

  /// Checks if the string's length is greater than or equal to the specified minimum.
  ///
  /// @param min The minimum length to check against.
  /// @return True if the string's length is at least [min], false otherwise.
  bool minLen(int min) => length >= min;

  /// Checks if the string's length is less than or equal to the specified maximum.
  ///
  /// @param max The maximum length to check against.
  /// @return True if the string's length is at most [max], false otherwise.
  bool maxLen(int max) => length <= max;

  /// Checks if the string's length is within the specified range.
  ///
  /// @param min The minimum length of the range.
  /// @param max The maximum length of the range.
  /// @return True if the string's length is between [min] and [max], inclusive.
  bool inRange(int min, int max) => length >= min && length <= max;

  /// Removes the first [upto] characters from the string.
  ///
  /// @param upto The number of characters to remove from the start. Defaults to 1.
  /// @return The string with the first [upto] characters removed, or an empty string if the result would be empty.
  String removeFirst([int? upto]) =>
      minLen(2) ? substring(upto ?? 1, length) : '';

  /// Removes the last [upto] characters from the string.
  ///
  /// @param upto The number of characters to remove from the end. Defaults to 1.
  /// @return The string with the last [upto] characters removed, or an empty string if the result would be empty.
  String removeLast([int upto = 1]) =>
      minLen(2) ? substring(0, length - upto) : '';

  /// Removes all whitespace from the string.
  String get removeWhitespace => replaceAll(' ', '');

  /// Concatenates the given string to this string, separated by a space.
  ///
  /// @param concat The string to concatenate.
  /// @return The concatenated string with a space in between.
  String concat(String concat) => '$this $concat';

  /// Appends the given string to the end of this string.
  ///
  /// @param string The string to append.
  /// @return The resulting string after appending.
  String append(String string) => this + string;

  /// Prepends the given string to the start of this string.
  ///
  /// @param string The string to prepend.
  /// @return The resulting string after prepending.
  String prepend(String string) => string + this;

  /// Masks a portion of the string with the specified character.
  ///
  /// @param upto The number of characters to mask (or leave unmasked if [atEnd] is true).
  /// @param mask The character to use for masking. Defaults to '*'.
  /// @param atEnd If true, masks the end of the string; otherwise, masks the beginning.
  /// @return The masked string, or the original string if masking is not possible.
  String? mask({int upto = 4, String mask = '*', bool atEnd = false}) {
    if (length <= 1 || upto < 1 || length < upto) {
      return this;
    }

    return atEnd
        ? substring(0, length - upto) + mask * upto
        : mask * upto + substring(upto);
  }

  /// Counts the occurrences of each character in the string.
  ///
  /// @return A map where keys are characters and values are their occurrence counts.
  Map<String, int> get occurrences {
    final String str = removeWhitespace;
    return str.split('').fold(<String, int>{},
        (Map<String, int> map, String char) {
      map[char] = (map[char] ?? 0) + 1;
      return map;
    });
  }

  /// Counts the number of occurrences of a substring within this string.
  ///
  /// @param string The substring to count.
  /// @return The number of occurrences of the substring.
  int countOccurrence(String string) =>
      isEmpty ? 0 : RegExp(string).allMatches(this).length;

  /// Counts the number of words in the string.
  ///
  /// Words are considered to be separated by spaces.
  int get countWord => split(' ').length;

  /// Returns a default value if the string is empty.
  ///
  /// @param value The default value to return if the string is empty. Defaults to 'null'.
  /// @return The original string if not empty, otherwise the default value.
  String ifEmpty([String value = 'null']) => trim().isEmpty ? value : this;

  /// Converts the string to an integer.
  ///
  /// @return The integer value of the string, or null if conversion is not possible.
  int? get toInt {
    try {
      return double.tryParse(this)?.toInt();
    } catch (e) {
      return null;
    }
  }

  /// Converts the string to a double.
  ///
  /// @return The double value of the string, or null if conversion is not possible.
  double? get toDouble {
    try {
      return double.tryParse(this);
    } catch (e) {
      return null;
    }
  }

  /// Converts the string to a URL-friendly slug.
  String get toSlug => trim().toLowerCase().replaceAll(' ', '-');

  /// Converts the string to capital case (first letter of each word capitalized).
  String get toCapitalCase => split(' ')
      .map(
        (String word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '',
      )
      .join(' ');

  /// Converts the string to title case (first letter of each word capitalized, rest lowercase).
  String get toTitleCase => split(' ')
      .map(
        (String word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '',
      )
      .join(' ');

  /// Converts the string to sentence case (first letter capitalized, rest lowercase).
  String get toSentenceCase =>
      isNotEmpty ? this[0].toUpperCase() + substring(1).toLowerCase() : '';

  /// Checks if the string is in sentence case.
  bool get isSentence => this == toSentenceCase;

  /// Checks if the string is in title case.
  bool get isTitle => this == toTitleCase;

  /// Checks if the string is in capital case.
  bool get isCapital => this == toCapitalCase;

  /// Checks if the string is in lowercase.
  bool get isLower => this == toLowerCase();

  /// Checks if the string is in uppercase.
  bool get isUpper => this == toUpperCase();

  /// Checks if the string represents an SVG file path.
  bool get isSvg => _endsWith('.svg');

  /// Checks if the string represents a PNG file path.
  bool get isPng => _endsWith('.png');

  /// Checks if the string represents a JPG or JPEG file path.
  bool get isJpg => _endsWith('.jpg') || _endsWith('.jpeg');

  /// Checks if the string represents a PDF file path.
  bool get isPDF => _endsWith('.pdf');

  /// Checks if the string represents a CSV file path.
  bool get isCsv => _endsWith('.csv');

  /// Checks if the string represents a TXT file path.
  bool get isTxt => _endsWith('.txt');

  /// Checks if the string represents an image file path (SVG, PNG, JPG, or JPEG).
  bool get isImage => isJpg || isPng || isSvg;

  /// Checks if the string represents a video file path (MP4, AVI, MOV, or MKV).
  bool get isVideo =>
      _endsWith('.mp4') ||
      _endsWith('.avi') ||
      _endsWith('.mov') ||
      _endsWith('.mkv');

  /// Checks if the string represents an audio file path (MP3, WAV, AAC, or M4A).
  bool get isAudio =>
      _endsWith('.mp3') ||
      _endsWith('.wav') ||
      _endsWith('.aac') ||
      _endsWith('.m4a');

  /// Helper method to check if the string ends with a specific pattern, case-insensitive.
  bool _endsWith(String pattern) => toLowerCase().endsWith(pattern);
}

/// An extension on the [DateTime] class that provides a method for formatting
/// the difference between a given date and the current date in human-readable
/// format.
extension DateTimeExtensions on DateTime {
  /// Returns a human-readable string representation of the difference between
  /// this date and the current date.
  ///
  /// Examples:
  /// ```dart
  /// DateTime dateTime = DateTime(2023, 5, 10, 15, 30);
  /// print(dateTime.diffForHumans()); // Output: 2 days ago
  ///
  /// DateTime pastDateTime = DateTime(2022, 10, 1);
  /// print(pastDateTime.diffForHumans()); // Output: 7 months ago
  /// ```
  String get diffForHumans {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(this);
    final int seconds = difference.inSeconds;
    final int minutes = difference.inMinutes;
    final int hours = difference.inHours;
    final int days = difference.inDays;

    if (seconds < 5) {
      return 'just now';
    } else if (seconds < 60) {
      return '$seconds seconds ago';
    } else if (minutes < 60) {
      return '$minutes minutes ago';
    } else if (hours < 24) {
      return '${_pluralize(hours, "hour")} ago';
    } else if (days < 30) {
      return '${_pluralize(days, "day")} ago';
    } else if (days < 365) {
      final int months = _calculateMonths(now, this);
      return '${_pluralize(months, "month")} ago';
    } else {
      final int years = days ~/ 365;
      return '${_pluralize(years, "year")} ago';
    }
  }

  /// Returns a string representing the given [count] of units, using the
  /// singular form of the unit if the count is 1, and the plural form otherwise.
  String _pluralize(int count, String unit) {
    if (count == 1) {
      return '1 $unit';
    } else {
      return '$count ${unit}s';
    }
  }

  /// Calculates the number of months between this date and the given [dateTime].
  int _calculateMonths(DateTime now, DateTime dateTime) {
    return (now.year - dateTime.year) * 12 + now.month - dateTime.month;
  }
}

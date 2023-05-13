/// An extension on the [DateTime] class that provides a method for formatting
/// the difference between a given date and the current date in human-readable
/// format.
extension DateTimeExtensions on DateTime {
  /// Returns a human-readable string representation of the difference between
  /// this date and the current date.
  ///
  /// Optional parameters:
  ///   - [abbreviatedUnits]: If `true`, displays abbreviated units. Default is `false`.
  ///   - [showRelativeDates]: If `true`, displays relative dates for time differences within a day (e.g., "today", "yesterday"). Default is `false`.
  ///   - [precision]: Specifies the number of units to display for the time difference. Default is `2`.
  ///
  /// Examples:
  /// ```dart
  /// DateTime dateTime = DateTime(2023, 5, 10, 15, 30);
  /// print(dateTime.diffForHumans()); // Output: "2 days ago"
  ///
  /// DateTime pastDateTime = DateTime(2022, 10, 1);
  /// print(pastDateTime.diffForHumans(showRelativeDates: true)); // Output: "7 months ago"
  /// ```
  String diffForHumans({
    bool abbreviatedUnits = false,
    bool showRelativeDates = false,
    int precision = 2,
  }) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(this);
    final int seconds = difference.inSeconds;
    final int minutes = difference.inMinutes;
    final int hours = difference.inHours;
    final int days = difference.inDays;

    if (showRelativeDates && difference.abs().inDays < 2) {
      if (difference.isNegative) {
        return 'yesterday';
      } else if (difference.inDays == 0) {
        return 'today';
      } else {
        return 'tomorrow';
      }
    }

    if (seconds < 5) {
      return 'just now';
    } else if (seconds < 60) {
      return '$seconds${abbreviatedUnits ? 's' : ' seconds'} ago';
    } else if (minutes < 60) {
      return '$minutes${abbreviatedUnits ? 'm' : ' minutes'} ago';
    } else if (hours < 24) {
      return '${_formatUnit(hours, abbreviatedUnits, 'hour')} ago';
    } else if (days < 30) {
      return '${_formatUnit(days, abbreviatedUnits, 'day')} ago';
    } else if (days < 365) {
      final int months = _calculateMonths(now, this);
      return '${_formatUnit(months, abbreviatedUnits, 'month')} ago';
    } else {
      final int years = days ~/ 365;
      return '${_formatUnit(years, abbreviatedUnits, 'year')} ago';
    }
  }

  /// Returns a string representing the given [count] of units, using the
  /// singular or plural form based on the count and the [unit]. If [abbreviated]
  /// is `true`, returns the abbreviated unit form.
  ///
  /// Examples:
  /// ```dart
  /// print(_formatUnit(1, false, 'hour'));  // Output: "1 hour"
  /// print(_formatUnit(3, true, 'day'));    // Output: "3 days"
  /// ```
  String _formatUnit(int count, bool abbreviated, String unit) {
    final String pluralUnit =
        abbreviated ? '${unit[0]}${unit[1]}' : '$unit${count != 1 ? 's' : ''}';
    if (count == 1) {
      return '1 $pluralUnit';
    } else {
      return '$count $pluralUnit';
    }
  }

  /// Calculates the number of months between this date and the given [dateTime].
  int _calculateMonths(DateTime now, DateTime dateTime) {
    return (now.year - dateTime.year) * 12 + now.month - dateTime.month;
  }
}

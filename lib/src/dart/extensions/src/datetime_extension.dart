/// An extension on the [DateTime] class that provides a method for formatting
/// the difference between a given date and the current date in human-readable
/// format.
extension DateTimeExtension on DateTime {
  /// Formats the DateTime object as a string based on the provided [format].
  ///
  /// Supported format tokens:
  /// - 'dd': Day of the month (01-31)
  /// - 'MM': Month (01-12)
  /// - 'MMM': Short month name (Jan-Dec)
  /// - 'MMMM': Full month name (January-December)
  /// - 'yyyy': Year
  /// - 'HH': Hour (00-23)
  /// - 'hh': Hour (01-12)
  /// - 'mm': Minute (00-59)
  /// - 'ss': Second (00-59)
  /// - 'a': AM/PM marker
  /// - 'EEE': Short day name (Mon-Sun)
  /// - 'EEEE': Full day name (Monday-Sunday)
  ///
  /// Example usage:
  /// DateTime now = DateTime.now();
  /// String formattedDate = now.format('dd/MM/yyyy', monthFormat: 'MMM');
  String format(String format, {String? monthFormat, String? dayFormat}) {
    Map<int, String> monthsShort = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };
    Map<int, String> monthsFull = {
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December'
    };
    Map<int, String> daysShort = {
      1: 'Mon',
      2: 'Tue',
      3: 'Wed',
      4: 'Thu',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun'
    };
    Map<int, String> daysFull = {
      1: 'Monday',
      2: 'Tuesday',
      3: 'Wednesday',
      4: 'Thursday',
      5: 'Friday',
      6: 'Saturday',
      7: 'Sunday'
    };
    String result = format.replaceAllMapped(
        RegExp(r'(dd|MM|MMM|MMMM|yyyy|HH|hh|mm|ss|a|EEE|EEEE)'), (Match m) {
      switch (m.group(0)) {
        case 'dd':
          return this.day.toString().padLeft(2, '0');
        case 'MM':
          return monthFormat == 'MMM'
              ? monthsShort[this.month]! // Short month name: Jan-Dec
              : this.month.toString().padLeft(2, '0'); // Numeric month: 01-12
        case 'MMM':
          return monthsShort[this.month]!; // Short month name: Jan-Dec
        case 'MMMM':
          return monthsFull[this.month]!; // Full month name: January-December
        case 'yyyy':
          return this.year.toString();
        case 'HH':
          return this.hour.toString().padLeft(2, '0');
        case 'hh':
          int hour = this.hour > 12 ? this.hour - 12 : this.hour;
          return hour.toString().padLeft(2, '0');
        case 'mm':
          return this.minute.toString().padLeft(2, '0');
        case 'ss':
          return this.second.toString().padLeft(2, '0');
        case 'a':
          return this.hour < 12 ? 'AM' : 'PM';
        case 'EEE':
          return dayFormat == 'EEE'
              ? daysShort[this.weekday]! // Short day name: Mon-Sun
              : daysFull[this.weekday]!; // Full day name: Monday-Sunday
        case 'EEEE':
          return daysFull[this.weekday]!; // Full day name: Monday-Sunday
        default:
          return m.group(0)!;
      }
    });
    return result;
  }

  /// Returns true if the DateTime object represents a date in the past.
  bool isPast() {
    return this.isBefore(DateTime.now());
  }

  /// Returns true if the DateTime object represents a date in the future.
  bool isFuture() {
    return this.isAfter(DateTime.now());
  }

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
  String timeAgo({
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
  int _calculateMonths(DateTime now, DateTime dateTime) =>
      (now.year - dateTime.year) * 12 + now.month - dateTime.month;
}

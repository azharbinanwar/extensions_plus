part of '../../extensions_plus.dart';

extension DateTimeExtension on DateTime {
  /// Format date with custom pattern and optional locale
  ///
  /// [format] Date format pattern (default: 'dd-MM-yyyy')
  /// [locale] Optional locale for formatting
  /// [Returns] Formatted date string
  String format({String format = 'dd-MM-yyyy', String? locale}) =>
      intl.DateFormat(format, locale).format(this);

  /// Check if the date is today
  ///
  /// [Returns] true if the date is today
  bool get isToday => isSameDay(DateTime.now());

  /// Check if the date is tomorrow
  ///
  /// [Returns] true if the date is tomorrow
  bool get isTomorrow => isSameDay(DateTime.now().add(Duration(days: 1)));

  /// Check if the date is yesterday
  ///
  /// [Returns] true if the date is yesterday
  bool get isYesterday => isSameDay(DateTime.now().subtract(Duration(days: 1)));

  /// Check if two dates are on the same day
  ///
  /// [time] Date to compare
  /// [Returns] true if dates are on the same day
  bool isSameDay(DateTime? time) =>
      year == time?.year && month == time?.month && day == time?.day;

  /// Check if two dates are in the same month
  ///
  /// [time] Date to compare
  /// [Returns] true if dates are in the same month
  bool isSameMonth(DateTime? time) =>
      year == time?.year && month == time?.month;

  /// Calculate human-readable time difference
  ///
  /// [Returns] Relative time string (e.g., "2 h", "3 d", "1 w")
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    return difference.isNegative
        ? _futureTimeString(difference.abs())
        : _pastTimeString(difference);
  }

  /// Generate a string for past time differences
  ///
  /// [difference] Duration of the time difference
  /// [Returns] Human-readable past time string
  String _pastTimeString(Duration difference) {
    if (difference.inSeconds < 60) return 'Just Now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} m';
    if (difference.inHours < 24) return '${difference.inHours} h';
    if (difference.inDays < 7) return '${difference.inDays} d';
    if (difference.inDays < 30) return '${(difference.inDays / 7).floor()} w';
    if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} mo';
    }
    return '${(difference.inDays / 365).floor()} y';
  }

  /// Generate a string for future time differences
  ///
  /// [difference] Duration of the time difference
  /// [Returns] Human-readable future time string
  String _futureTimeString(Duration difference) {
    if (difference.inSeconds < 60) return 'In a moment';
    if (difference.inMinutes < 60) return 'In ${difference.inMinutes} m';
    if (difference.inHours < 24) return 'In ${difference.inHours} h';
    if (difference.inDays < 7) return 'In ${difference.inDays} d';
    if (difference.inDays < 30) {
      return 'In ${(difference.inDays / 7).floor()} w';
    }
    if (difference.inDays < 365) {
      return 'In ${(difference.inDays / 30).floor()} mo';
    }
    return 'In ${(difference.inDays / 365).floor()} y';
  }

  /// Get start of the day
  ///
  /// [Returns] DateTime object representing the start of the day
  DateTime get startOfDay => DateTime(year, month, day);

  /// Get end of the day
  ///
  /// [Returns] DateTime object representing the end of the day
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// Check if date is in the past
  ///
  /// [Returns] true if the date is in the past
  bool get isPast => isBefore(DateTime.now());

  /// Check if date is in the future
  ///
  /// [Returns] true if the date is in the future
  bool get isFuture => isAfter(DateTime.now());

  /// Calculate age based on current date
  ///
  /// [Returns] Age in years
  int get age {
    final now = DateTime.now();
    int age = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }
    return age;
  }

  /// Get day name
  ///
  /// [locale] Optional locale for formatting
  /// [Returns] Day name string
  String dayName({String? locale}) =>
      intl.DateFormat('EEEE', locale).format(this);

  /// Get month name
  ///
  /// [locale] Optional locale for formatting
  /// [Returns] Month name string
  String monthName({String? locale}) =>
      intl.DateFormat('MMMM', locale).format(this);

  /// Midnight on the Monday of this date's week.
  DateTime get startOfWeek => startOfDay.subtract(Duration(days: weekday - 1));

  /// Midnight on the first day of this month.
  DateTime get startOfMonth => DateTime(year, month);

  /// Last millisecond of the last day of this month.
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999);

  /// Adds [months], clamping the day so Jan 31 + 1 month is Feb 28/29, not Mar 3.
  DateTime addMonths(int months) {
    final target = DateTime(year, month + months);
    final lastDay = DateTime(target.year, target.month + 1, 0).day;
    return DateTime(
      target.year,
      target.month,
      day > lastDay ? lastDay : day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// True on Saturday or Sunday.
  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  /// Returns a copy with the given fields replaced.
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    final ctor = isUtc ? DateTime.utc : DateTime.new;
    return ctor(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}

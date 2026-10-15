import 'package:flutter_test/flutter_test.dart';
import 'package:extensions_plus/extensions_plus.dart';

void main() {
  group('DateTimeExtension', () {
    final d = DateTime(2024, 3, 15, 10, 30, 45, 500);

    test('format and names', () {
      expect(d.format(), '15-03-2024');
      expect(d.format(format: 'yyyy/MM/dd'), '2024/03/15');
      expect(d.dayName(), 'Friday');
      expect(d.monthName(), 'March');
    });

    test('relative day checks', () {
      final now = DateTime.now();
      expect(now.isToday, isTrue);
      expect(now.add(const Duration(days: 1)).isTomorrow, isTrue);
      expect(now.subtract(const Duration(days: 1)).isYesterday, isTrue);
      expect(now.subtract(const Duration(minutes: 1)).isPast, isTrue);
      expect(now.add(const Duration(minutes: 1)).isFuture, isTrue);
      expect(d.isSameDay(DateTime(2024, 3, 15)), isTrue);
      expect(d.isSameDay(null), isFalse);
      expect(d.isSameMonth(DateTime(2024, 3, 1)), isTrue);
    });

    test('timeAgo', () {
      final now = DateTime.now();
      expect(now.timeAgo(), 'Just Now');
      expect(now.subtract(const Duration(minutes: 5)).timeAgo(), '5 m');
      expect(now.subtract(const Duration(hours: 2)).timeAgo(), '2 h');
      expect(now.subtract(const Duration(days: 3)).timeAgo(), '3 d');
      expect(now.subtract(const Duration(days: 14)).timeAgo(), '2 w');
      expect(now.subtract(const Duration(days: 60)).timeAgo(), '2 mo');
      expect(now.subtract(const Duration(days: 800)).timeAgo(), '2 y');
      expect(now.add(const Duration(days: 2, hours: 1)).timeAgo(), 'In 2 d');
    });

    test('boundaries', () {
      expect(d.startOfDay, DateTime(2024, 3, 15));
      expect(d.endOfDay, DateTime(2024, 3, 15, 23, 59, 59, 999));
      expect(d.startOfWeek, DateTime(2024, 3, 11));
      expect(DateTime(2024, 3, 11).startOfWeek, DateTime(2024, 3, 11));
      expect(DateTime(2024, 3, 17).startOfWeek, DateTime(2024, 3, 11));
      expect(d.startOfMonth, DateTime(2024, 3));
      expect(d.endOfMonth, DateTime(2024, 3, 31, 23, 59, 59, 999));
      expect(DateTime(2024, 2, 10).endOfMonth.day, 29);
      expect(DateTime(2023, 2, 10).endOfMonth.day, 28);
    });

    test('addMonths clamps day', () {
      expect(DateTime(2024, 1, 31).addMonths(1), DateTime(2024, 2, 29));
      expect(DateTime(2023, 1, 31).addMonths(1), DateTime(2023, 2, 28));
      expect(DateTime(2024, 11, 15).addMonths(3), DateTime(2025, 2, 15));
      expect(DateTime(2024, 3, 31).addMonths(-1), DateTime(2024, 2, 29));
      expect(d.addMonths(1).hour, 10);
    });

    test('weekend, age, copyWith', () {
      expect(DateTime(2024, 3, 16).isWeekend, isTrue);
      expect(DateTime(2024, 3, 17).isWeekend, isTrue);
      expect(DateTime(2024, 3, 15).isWeekend, isFalse);
      final birthday = DateTime.now().subtract(
        const Duration(days: 365 * 20 + 10),
      );
      expect(birthday.age, 20);
      expect(
        d.copyWith(year: 2000, minute: 0),
        DateTime(2000, 3, 15, 10, 0, 45, 500),
      );
      expect(DateTime.utc(2024, 1, 1).copyWith(day: 2).isUtc, isTrue);
    });
  });

  group('DurationExtension', () {
    test('format', () {
      expect(const Duration(minutes: 4, seconds: 5).format(), '04:05');
      expect(
        const Duration(hours: 1, minutes: 2, seconds: 3).format(),
        '1:02:03',
      );
      expect(const Duration(seconds: 9).format(forceHours: true), '0:00:09');
      expect(Duration.zero.format(), '00:00');
    });

    test('toHumanReadable', () {
      expect(const Duration(hours: 2, minutes: 15).toHumanReadable(), '2h 15m');
      expect(const Duration(seconds: 45).toHumanReadable(), '45s');
      expect(
        const Duration(days: 1, hours: 3, minutes: 7).toHumanReadable(),
        '1d 3h',
      );
      expect(const Duration(minutes: 1).toHumanReadable(), '1m');
      expect(Duration.zero.toHumanReadable(), '0s');
    });
  });
}

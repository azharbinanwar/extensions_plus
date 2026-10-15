import 'package:flutter_test/flutter_test.dart';
import 'package:extensions_plus/extensions_plus.dart';

void main() {
  group('NumericExtension', () {
    test('formatting', () {
      expect(3.14159.toFixed(2), '3.14');
      expect(0.256.toPercent(1), '25.6%');
      expect(1500000.toCompact(), '1.5M');
      expect(2500000000.toCompact(), '2.5B');
      expect(1500.toCompact(decimals: 0), '2K');
      expect(999.toCompact(), '999');
      expect(19.99.toCurrency(), '\$19.99');
      expect(5.toCurrency(symbol: '€', decimals: 0), '€5');
      expect(1500.toMetric(), '1.5k');
      expect((-1500).toMetric(), '-1.5k');
      expect(1536.toFileSize(), '1.5KB');
      expect(1048576.toFileSize(decimals: 0), '1MB');
      expect(1234567.format(), '1,234,567');
      expect(
        1234.5.format(
          decimals: 1,
          decimalSeparator: ',',
          thousandSeparator: '.',
        ),
        '1.234,5',
      );
    });

    test('ordinal', () {
      expect(1.toOrdinal(), '1st');
      expect(2.toOrdinal(), '2nd');
      expect(3.toOrdinal(), '3rd');
      expect(4.toOrdinal(), '4th');
      expect(11.toOrdinal(), '11th');
      expect(12.toOrdinal(), '12th');
      expect(13.toOrdinal(), '13th');
      expect(21.toOrdinal(), '21st');
      expect(112.toOrdinal(), '112th');
    });

    test('math', () {
      expect(5.isBetween(1, 10), isTrue);
      expect(10.isBetween(1, 10), isTrue);
      expect(11.isBetween(1, 10), isFalse);
      expect(7.roundToNearest(5), 5);
      expect(8.roundToNearest(5), 10);
    });
  });

  group('IntDurationExtension', () {
    test('builds durations', () {
      expect(300.ms, const Duration(milliseconds: 300));
      expect(300.milliseconds, const Duration(milliseconds: 300));
      expect(5.seconds, const Duration(seconds: 5));
      expect(2.minutes, const Duration(minutes: 2));
      expect(1.hours, const Duration(hours: 1));
      expect(7.days, const Duration(days: 7));
    });
  });
}

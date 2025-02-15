part of '../../extensions_plus.dart';

/// Extension on [num] to provide utility methods for numeric operations and formatting.
extension NumericExtension on num {
  static const _k = 1000;
  static const _million = 1000000;
  static const _billion = 1000000000;

  /// Formats number with specified decimal places.
  ///
  /// Input:
  /// 3.14159.toFixed(2)
  /// -123.456789.toFixed(3)
  /// Output:
  /// "3.14"
  /// "-123.457"
  String toFixed(int decimals) => toStringAsFixed(decimals);

  /// Formats number as percentage with optional decimal places.
  ///
  /// Input:
  /// 0.1234.toPercent()
  /// 0.1234.toPercent(2)
  /// Output:
  /// "12%"
  /// "12.34%"
  String toPercent([int decimals = 0]) =>
      '${(this * 100).toStringAsFixed(decimals)}%';

  /// Formats number in compact notation (K, M, B).
  ///
  /// Input:
  /// 1234567.toCompact()
  /// 1234567890.toCompact(decimals: 2)
  /// Output:
  /// "1.2M"
  /// "1.23B"
  String toCompact({int decimals = 1}) {
    if (this >= _billion) {
      return '${(this / _billion).toStringAsFixed(decimals)}B';
    }
    if (this >= _million) {
      return '${(this / _million).toStringAsFixed(decimals)}M';
    }
    if (this >= _k) return '${(this / _k).toStringAsFixed(decimals)}K';
    return toString();
  }

  /// Formats number as currency with optional symbol and decimal places.
  ///
  /// Input:
  /// 1234.56.toCurrency()
  /// 1234.56.toCurrency(symbol: '€', decimals: 1)
  /// Output:
  /// "$1234.56"
  /// "€1234.6"
  String toCurrency({String symbol = '\$', int decimals = 2}) =>
      '$symbol${toStringAsFixed(decimals)}';

  /// Converts number to ordinal string.
  ///
  /// Input:
  /// 1.toOrdinal()
  /// 22.toOrdinal()
  /// 123.toOrdinal()
  /// Output:
  /// "1st"
  /// "22nd"
  /// "123rd"
  String toOrdinal() {
    if (this >= 11 && this <= 13) return '${this}th';
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }

  /// Clamps value between minimum and maximum.
  ///
  /// Input:
  /// 5.clamp(0, 10)
  /// 15.clamp(0, 10)
  /// -5.clamp(0, 10)
  /// Output:
  /// 5
  /// 10
  /// 0
  num clamp(num min, num max) => this < min ? min : (this > max ? max : this);

  /// Checks if number is between two values (inclusive).
  ///
  /// Input:
  /// 5.isBetween(0, 10)
  /// 15.isBetween(0, 10)
  /// Output:
  /// true
  /// false
  bool isBetween(num from, num to) => from <= this && this <= to;

  /// Rounds number to nearest multiple.
  ///
  /// Input:
  /// 14.roundToNearest(5)
  /// 27.roundToNearest(10)
  /// Output:
  /// 15
  /// 30
  num roundToNearest(num multiple) => (this / multiple).round() * multiple;

  /// Formats number with metric prefix.
  ///
  /// Input:
  /// 1234.toMetric()
  /// 1234567.toMetric(decimals: 2)
  /// Output:
  /// "1.2k"
  /// "1.23M"
  String toMetric({int decimals = 1}) {
    const prefixes = ['', 'k', 'M', 'G', 'T', 'P'];
    var scale = 0;
    var value = this;
    var sign = value < 0 ? '-' : '';
    value = value.abs();

    while (value >= 1000 && scale < prefixes.length - 1) {
      value /= 1000;
      scale++;
    }

    return '$sign${value.toStringAsFixed(decimals)}${prefixes[scale]}';
  }

  /// Formats a number representing bytes into human-readable file size.
  ///
  /// The input should be the size in bytes. The method automatically converts to
  /// the appropriate unit (B, KB, MB, GB, TB).
  ///
  /// Input examples (in bytes):
  /// 900.toFileSize()                // bytes
  /// 1024.toFileSize()              // 1 KB
  /// (1024 * 1024).toFileSize()     // 1 MB
  /// (1024 * 1024 * 1024).toFileSize() // 1 GB
  /// Output examples:
  /// "900B"
  /// "1.0KB"
  /// "1.0MB"
  /// "1.0GB"
  /// Common file size references:
  /// - 1 KB = 1,024 bytes
  /// - 1 MB = 1,048,576 bytes
  /// - 1 GB = 1,073,741,824 bytes
  /// - 1 TB = 1,099,511,627,776 bytes
  String toFileSize({int decimals = 1}) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var scale = 0;
    var value = abs();

    while (value >= 1024 && scale < suffixes.length - 1) {
      value /= 1024;
      scale++;
    }

    return '${value.toStringAsFixed(decimals)}${suffixes[scale]}';
  }

  /// Formats number with custom separators.
  ///
  /// Input:
  /// 1234567.89.format()
  /// 1234567.89.format(decimals: 2, thousandSeparator: ' ')
  /// Output:
  /// "1,234,568"
  /// "1 234 567.89"
  String format({
    String decimalSeparator = '.',
    String thousandSeparator = ',',
    int decimals = 0,
  }) {
    var parts = toStringAsFixed(decimals).split('.');
    parts[0] = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}$thousandSeparator',
    );
    return parts.join(decimalSeparator);
  }
}

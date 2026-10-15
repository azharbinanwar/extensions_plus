part of '../../extensions_plus.dart';

/// Formatting helpers for [Duration].
extension DurationExtension on Duration {
  /// Clock-style string. Hours are shown only when non-zero unless [forceHours].
  ///
  /// `Duration(minutes: 4, seconds: 5).format()`            // 04:05
  /// `Duration(hours: 1, minutes: 2, seconds: 3).format()`  // 1:02:03
  String format({bool forceHours = false}) {
    final h = inHours;
    final m = inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = inSeconds.remainder(60).toString().padLeft(2, '0');
    return (h > 0 || forceHours) ? '$h:$m:$s' : '$m:$s';
  }

  /// Compact human text, largest two units only.
  ///
  /// `Duration(hours: 2, minutes: 15).toHumanReadable()` // 2h 15m
  /// `Duration(seconds: 45).toHumanReadable()`           // 45s
  /// `Duration.zero.toHumanReadable()`                   // 0s
  String toHumanReadable() {
    final parts = <String>[];
    if (inDays > 0) parts.add('${inDays}d');
    if (inHours.remainder(24) > 0) parts.add('${inHours.remainder(24)}h');
    if (inMinutes.remainder(60) > 0) parts.add('${inMinutes.remainder(60)}m');
    if (inSeconds.remainder(60) > 0) parts.add('${inSeconds.remainder(60)}s');
    if (parts.isEmpty) return '0s';
    return parts.take(2).join(' ');
  }
}

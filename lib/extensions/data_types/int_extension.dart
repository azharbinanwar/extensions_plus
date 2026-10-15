part of '../../extensions_plus.dart';

/// Turns a bare integer into a [Duration]: `5.seconds`, `300.ms`, `2.days`.
extension IntDurationExtension on int {
  /// `300.ms` == `Duration(milliseconds: 300)`
  Duration get ms => Duration(milliseconds: this);

  /// `300.milliseconds` == `Duration(milliseconds: 300)`
  Duration get milliseconds => Duration(milliseconds: this);

  /// `5.seconds` == `Duration(seconds: 5)`
  Duration get seconds => Duration(seconds: this);

  /// `2.minutes` == `Duration(minutes: 2)`
  Duration get minutes => Duration(minutes: this);

  /// `1.hours` == `Duration(hours: 1)`
  Duration get hours => Duration(hours: this);

  /// `7.days` == `Duration(days: 7)`
  Duration get days => Duration(days: this);
}

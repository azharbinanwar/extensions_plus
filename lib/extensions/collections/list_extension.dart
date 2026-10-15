part of '../../extensions_plus.dart';

extension ListExtension<T> on List<T> {
  /// Returns a new shuffled copy, leaving this list untouched.
  ///
  /// [1, 2, 3].shuffled() // e.g. [3, 1, 2]
  List<T> shuffled([Random? random]) => List.of(this)..shuffle(random);
}

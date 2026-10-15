part of '../../extensions_plus.dart';

/// Null-and-empty checks for `String?`.
extension NullableStringExtension on String? {
  /// True when null or `''`.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// True when non-null and non-empty.
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// True when null, empty, or whitespace only.
  bool get isNullOrBlank => this == null || this!.trim().isEmpty;

  /// The string, or `''` when null.
  String get orEmpty => this ?? '';
}

/// Null-and-empty checks for `Iterable<T>?`.
extension NullableIterableExtension<T> on Iterable<T>? {
  /// True when null or has no elements.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// True when non-null and has at least one element.
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// The iterable, or an empty one when null.
  Iterable<T> get orEmpty => this ?? const Iterable.empty();
}

/// Null-and-empty checks for `Map<K, V>?`.
extension NullableMapExtension<K, V> on Map<K, V>? {
  /// True when null or has no entries.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// True when non-null and has at least one entry.
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// The map, or an empty one when null.
  Map<K, V> get orEmpty => this ?? const {};
}

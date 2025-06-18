part of '../../extensions_plus.dart';

extension ListExtension<T> on List<T> {
  /// Remove duplicates based on a selector function
  ///
  /// [selector] Function to determine unique elements
  /// [Returns] List with unique elements
  List<T> distinctBy<R>(R Function(T) selector) {
    final List<T> distinctList = [];
    final List<R> keys = [];
    for (final item in this) {
      final key = selector(item);
      if (!keys.contains(key)) {
        keys.add(key);
        distinctList.add(item);
      }
    }
    return distinctList;
  }

  /// Safely get first element matching predicate
  ///
  /// [predicate] Condition to match
  /// [Returns] First matching element or null
  T? findFirst(bool Function(T) predicate) {
    for (final element in this) {
      if (predicate(element)) {
        return element;
      }
    }
    return null;
  }

  /// Group list elements by a key
  ///
  /// [selector] Function to determine grouping key
  /// [Returns] Map of grouped elements
  Map<R, List<T>> groupBy<R>(R Function(T) selector) {
    return fold<Map<R, List<T>>>({}, (map, element) {
      final key = selector(element);
      (map[key] ??= []).add(element);
      return map;
    });
  }

  /// Partition list into two lists based on a predicate
  ///
  /// [predicate] Condition for separation
  /// [Returns] List with two sublists: matched and unmatched
  List<List<T>> partition(bool Function(T) predicate) {
    final matched = <T>[];
    final unmatched = <T>[];

    for (final item in this) {
      predicate(item) ? matched.add(item) : unmatched.add(item);
    }

    return [matched, unmatched];
  }

  /// Create chunks of specified size
  ///
  /// [size] Size of each chunk
  /// [Returns] List of sublists
  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, min(i + size, length)));
    }
    return chunks;
  }

  /// Safely get element at index
  ///
  /// [index] Index to access
  /// [Returns] Element at index or null
  T? getAt(int index) {
    return (index >= 0 && index < length) ? this[index] : null;
  }

  /// Shuffle list and return a new list
  ///
  /// [Returns] New shuffled list
  List<T> shuffled() {
    final List<T> list = List.from(this);
    list.shuffle();
    return list;
  }
}

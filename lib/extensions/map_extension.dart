extension MapExtension<K, V> on Map<K, V> {
  /// Groups the values in the map by multiple keys.
  ///
  /// The [keySelector] function takes an individual value and returns a list of keys to group that value by.
  ///
  /// Example:
  /// ```dart
  /// final data = [
  ///   {'name': 'John', 'age': 30, 'city': 'New York'},
  ///   {'name': 'Jane', 'age': 25, 'city': 'London'},
  ///   {'name': 'Bob', 'age': 35, 'city': 'New York'},
  /// ];
  /// final groupedData = data.asMap().groupByMultiple((item) => [item['city'], item['age']]);
  /// // groupedData = {
  /// //   'New York': [
  /// //     {'name': 'John', 'age': 30, 'city': 'New York'},
  /// //     {'name': 'Bob', 'age': 35, 'city': 'New York'}
  /// //   ],
  /// //   'London': [
  /// //     {'name': 'Jane', 'age': 25, 'city': 'London'}
  /// //   ]
  /// // }
  /// ```
  Map<K, List<V>> groupByMultiple(List<K> Function(V) keySelector) {
    final result = <K, List<V>>{};
    forEach((_, value) {
      final keys = keySelector(value);
      for (var key in keys) {
        result.putIfAbsent(key, () => []).add(value);
      }
    });
    return result;
  }

  /// Updates a nested value in the map.
  ///
  /// [path] is a list of keys that descend into the nested structure.
  /// [update] is a function that takes the current value at the end of the path and returns the new value.
  ///
  /// Example:
  /// ```dart
  /// final data = {
  ///   'user': {
  ///     'name': 'John',
  ///     'address': {
  ///       'city': 'New York',
  ///       'state': 'NY'
  ///     }
  ///   }
  /// };
  /// final updatedData = data.updateNested(['user', 'address', 'city'], (city) => 'Los Angeles');
  /// // updatedData = {
  /// //   'user': {
  /// //     'name': 'John',
  /// //     'address': {
  /// //       'city': 'Los Angeles',
  /// //       'state': 'NY'
  /// //     }
  /// //   }
  /// // }
  /// ```
  Map<K, V> updateNested(List<K> path, V Function(V?) update) {
    Map<K, V> result = Map.from(this);
    dynamic current = result;

    for (int i = 0; i < path.length - 1; i++) {
      if (current[path[i]] is! Map) {
        current[path[i]] = {};
      }
      current = current[path[i]];
    }

    current[path.last] = update(current[path.last]);
    return result;
  }

  /// Serializes the map to a query parameter string.
  ///
  /// The keys and values are URI encoded before being joined by '=' and '&'.
  ///
  /// Example:
  /// ```dart
  /// final params = {'name': 'John', 'age': 30};
  /// final queryParams = params.toQueryParams(); // 'name=John&age=30'
  /// ```
  String toQueryParams() {
    return entries.map((entry) => '${Uri.encodeComponent(entry.key.toString())}=${Uri.encodeComponent(entry.value.toString())}').join('&');
  }
}

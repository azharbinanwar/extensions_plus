import 'package:flutter_test/flutter_test.dart';
import 'package:extensions_plus/extensions_plus.dart';

void main() {
  group('IterableExtension', () {
    final users = [
      {'name': 'John', 'age': 25},
      {'name': 'Jane', 'age': 25},
      {'name': 'Bob', 'age': 30},
    ];

    test('grouping and dedupe', () {
      final byAge = users.groupBy((u) => u['age']);
      expect(byAge.keys, [25, 30]);
      expect(byAge[25]!.length, 2);
      expect(users.distinctBy((u) => u['age']).length, 2);
    });

    test('chunk and partition', () {
      expect([1, 2, 3, 4, 5].chunk(2).toList(), [
        [1, 2],
        [3, 4],
        [5],
      ]);
      expect(() => [1].chunk(0).toList(), throwsArgumentError);
      final (even, odd) = [1, 2, 3, 4].partition((n) => n.isEven);
      expect(even, [2, 4]);
      expect(odd, [1, 3]);
    });

    test('safe access', () {
      expect([1, 2, 3].getAt(1), 2);
      expect([1, 2, 3].getAt(5), isNull);
      expect([1, 2, 3].getAt(-1), isNull);
      expect([1, 2, 3].findFirst((n) => n > 1), 2);
      expect([1, 2, 3].findFirst((n) => n > 5), isNull);
    });

    test('index helpers', () {
      expect(['a', 'b'].toIndexMap(), {0: 'a', 1: 'b'});
      expect(['a', 'b'].enumerate().toList(), [(0, 'a'), (1, 'b')]);
    });

    test('math', () {
      expect([1, 2, 3].sum(), 6);
      expect(users.sum((u) => u['age'] as num), 80);
      expect([2, 4].average(), 3.0);
      expect(<int>[].average(), 0);
      expect(users.maxBy((u) => u['age'] as int)!['name'], 'Bob');
      expect(users.minBy((u) => u['name'] as String)!['name'], 'Bob');
      expect(<int>[].maxBy((n) => n), isNull);
      expect([1, 1].allEqual(), isTrue);
      expect([1, 2].allEqual(), isFalse);
      expect(<int>[].allEqual(), isTrue);
    });

    test('orderBy, takeLast, intersperse', () {
      expect(users.orderBy((u) => u['name'] as String).map((u) => u['name']), [
        'Bob',
        'Jane',
        'John',
      ]);
      expect(
        users.orderBy((u) => u['age'] as int, descending: true).first['name'],
        'Bob',
      );
      expect([1, 2, 3, 4].takeLast(2).toList(), [3, 4]);
      expect([1, 2].takeLast(5).toList(), [1, 2]);
      expect([1, 2].takeLast(0).toList(), isEmpty);
      expect(['a', 'b', 'c'].intersperse('-').join(), 'a-b-c');
      expect(<String>[].intersperse('-').toList(), isEmpty);
    });
  });

  group('ListExtension', () {
    test('shuffled returns new list with same elements', () {
      final original = [1, 2, 3, 4, 5];
      final s = original.shuffled();
      expect(s, isNot(same(original)));
      expect(s..sort(), original);
    });
  });

  group('MapExtension', () {
    test('groupByMultiple', () {
      final data = {
        1: {'city': 'NY', 'age': 30},
        2: {'city': 'LA', 'age': 30},
      };
      final g = data.groupByMultiple((v) => [v['city'], v['age']]);
      expect(g['NY']!.length, 1);
      expect(g['30']!.length, 2);
    });

    test('updateNested', () {
      final data = <String, dynamic>{
        'user': {'name': 'John'},
      };
      final out = data.updateNested(['user', 'name'], (_) => 'Jane');
      expect(out['user']['name'], 'Jane');
      final created = <String, dynamic>{}.updateNested(['a', 'b'], (_) => 1);
      expect(created['a']['b'], 1);
    });

    test('toQueryParams encodes', () {
      expect({'q': 'a b', 'n': 1}.toQueryParams(), 'q=a%20b&n=1');
    });

    test('getOrDefault, filterKeys, mapKeys', () {
      final m = {'a': 1, 'b': 2};
      expect(m.getOrDefault('a', 0), 1);
      expect(m.getOrDefault('z', 0), 0);
      expect(m.filterKeys((k) => k == 'a'), {'a': 1});
      expect(m.mapKeys((k) => k.toUpperCase()), {'A': 1, 'B': 2});
    });

    test('toPrettyJson', () {
      expect({'a': 1}.toPrettyJson(), '{\n  "a": 1\n}');
      expect({'d': DateTime(2024)}.toPrettyJson(), contains('2024-01-01'));
    });
  });

  group('Nullable collections', () {
    test('iterable and map', () {
      List<int>? l;
      Map<String, int>? m;
      expect(l.isNullOrEmpty, isTrue);
      expect(<int>[].isNullOrEmpty, isTrue);
      expect([1].isNotNullOrEmpty, isTrue);
      expect(l.orEmpty, isEmpty);
      expect(m.isNullOrEmpty, isTrue);
      expect({'a': 1}.isNotNullOrEmpty, isTrue);
      expect(m.orEmpty, isEmpty);
    });
  });
}

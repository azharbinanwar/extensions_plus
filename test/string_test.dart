import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:extensions_plus/extensions_plus.dart';

void main() {
  group('StringExtension', () {
    test('case helpers', () {
      expect('hello world'.capitalize(), 'Hello world');
      expect('hello world'.toTitleCase(), 'Hello World');
      expect('hello_world'.toCamelCase(), 'helloWorld');
      expect('helloWorld'.toSnakeCase(), 'hello_world');
      expect(''.capitalize(), '');
    });

    test('initials', () {
      expect('John Smith'.initials, 'JS');
      expect('Madonna'.initials, 'MA');
      expect(''.initials, '');
    });

    test('validation', () {
      expect('a@b.com'.isValidEmail, isTrue);
      expect('nope'.isValidEmail, isFalse);
      expect('123'.isNumeric(), isTrue);
      expect('12a'.isNumeric(), isFalse);
      expect('Abcdef1!'.isStrongPassword(), isTrue);
      expect('abc'.isStrongPassword(), isFalse);
      expect('  '.isBlank, isTrue);
      expect(' x '.isBlank, isFalse);
      expect('https://example.com/path'.isUrl, isTrue);
      expect('example.com'.isUrl, isFalse);
      expect('+1 (555) 123-4567'.isPhone, isTrue);
      expect('12'.isPhone, isFalse);
    });

    test('transform', () {
      expect('HeLLo'.containsIgnoreCase('hello'), isTrue);
      expect('abc'.reverse, 'cba');
      expect('a b\tc'.removeWhitespace, 'abc');
      expect('a-b!c'.trimSpecialCharacters(), 'abc');
      expect('one two  three'.getWordCount(), 3);
      expect('long text'.truncate(4), 'long...');
      expect('ok'.truncate(4), 'ok');
      expect('4111111111111111'.mask(), '************1111');
      expect('secret'.mask(visibleStart: 1, visibleEnd: 1), 's****t');
      expect('ab'.mask(), 'ab');
      expect('hi'.toBase64().fromBase64(), 'hi');
    });

    test('parse', () {
      expect('1.5'.parseToDouble(), 1.5);
      expect('x'.parseToDouble(), isNull);
      expect('3'.parseInt(), 3);
      expect('3'.toInt(), 3);
      expect('x'.toInt(defaultValue: -1), -1);
    });

    test('toColor', () {
      expect('#F44336'.toColor(), const Color(0xFFF44336));
      expect('f44336'.toColor(), const Color(0xFFF44336));
      expect('#80F44336'.toColor(), const Color(0x80F44336));
      expect('#abc'.toColor(), const Color(0xFFAABBCC));
      expect('zz'.toColor(), isNull);
    });
  });

  group('NullableStringExtension', () {
    test('null and empty checks', () {
      String? n;
      expect(n.isNullOrEmpty, isTrue);
      expect(''.isNullOrEmpty, isTrue);
      expect('a'.isNullOrEmpty, isFalse);
      expect('a'.isNotNullOrEmpty, isTrue);
      expect(' '.isNullOrBlank, isTrue);
      expect(n.orEmpty, '');
      expect('a'.orEmpty, 'a');
    });
  });
}

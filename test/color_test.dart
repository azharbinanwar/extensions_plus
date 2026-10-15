import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:extensions_plus/extensions_plus.dart';

void main() {
  group('ColorExtension', () {
    const red = Color(0xFFF44336);

    test('hex', () {
      expect(red.hex, '#f44336');
      expect(red.hexWithAlpha, '#FFF44336');
      expect(const Color(0x80000000).hexWithAlpha, '#80000000');
    });

    test('contrast', () {
      expect(Colors.white.onIt, Colors.black);
      expect(Colors.black.onIt, Colors.white);
    });

    test('lightness changes', () {
      expect(
        HSLColor.fromColor(red.darken(0.2)).lightness,
        lessThan(HSLColor.fromColor(red).lightness),
      );
      expect(
        HSLColor.fromColor(red.lighten(0.2)).lightness,
        greaterThan(HSLColor.fromColor(red).lightness),
      );
      expect(Colors.black.darken(), Colors.black);
      expect(Colors.white.lighten(), Colors.white);
      expect(
        HSLColor.fromColor(red.brightness(0.5)).lightness,
        closeTo(HSLColor.fromColor(red).lightness * 0.5, 0.01),
      );
    });

    test('shades', () {
      expect(red.shades.length, 10);
      expect(red.shade50, red.shades[0]);
      expect(red.shade900, red.shades[9]);
      expect(
        HSLColor.fromColor(red.shade50).lightness,
        greaterThan(HSLColor.fromColor(red.shade900).lightness),
      );
    });

    test('withOpacityValue', () {
      expect(red.withOpacityValue(0.5).a, closeTo(0.5, 0.01));
      expect(red.withOpacityValue(2).a, 1.0);
      expect(red.withOpacityValue(-1).a, 0.0);
    });
  });
}

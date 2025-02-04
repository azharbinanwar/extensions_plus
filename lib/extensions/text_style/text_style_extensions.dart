part of '../../extensions_plus.dart';

/// Extension on [TextStyle] to provide advanced text style manipulation methods
extension TextStyleExtensions on TextStyle {
  /// Color Variations

  /// Returns a new [TextStyle] with the specified [color].
  ///
  /// Example:
  /// ```dart
  /// TextStyle newStyle = oldStyle.withColor(Colors.red);
  /// ```
  TextStyle withColor(Color color) => copyWith(color: color);

  /// Returns a new [TextStyle] with transparent color.
  ///
  /// Example:
  /// ```dart
  /// TextStyle transparentStyle = oldStyle.transparent;
  /// ```
  TextStyle get transparent => copyWith(color: Colors.transparent);

  /// Returns a new [TextStyle] with the original color.
  ///
  /// Example:
  /// ```dart
  /// TextStyle opaqueStyle = oldStyle.opaque;
  /// ```
  TextStyle get opaque => copyWith(color: color);

  /// Size Variations

  /// Returns a new [TextStyle] with the specified [size].
  ///
  /// Example:
  /// ```dart
  /// TextStyle newSizeStyle = oldStyle.withSize(18.0);
  /// ```
  TextStyle withSize(double size) => copyWith(fontSize: size);

  /// Returns a new [TextStyle] with a smaller font size.
  ///
  /// Example:
  /// ```dart
  /// TextStyle smallStyle = oldStyle.small;
  /// ```
  TextStyle get small => copyWith(fontSize: (fontSize ?? 14) - 2);

  /// Returns a new [TextStyle] with a larger font size.
  ///
  /// Example:
  /// ```dart
  /// TextStyle largeStyle = oldStyle.large;
  /// ```
  TextStyle get large => copyWith(fontSize: (fontSize ?? 14) + 2);

  /// Returns a new [TextStyle] with an extra large font size.
  ///
  /// Example:
  /// ```dart
  /// TextStyle extraLargeStyle = oldStyle.extraLarge;
  /// ```
  TextStyle get extraLarge => copyWith(fontSize: (fontSize ?? 14) + 4);

  /// Weight Variations

  /// Returns a new [TextStyle] with bold font weight.
  ///
  /// Example:
  /// ```dart
  /// TextStyle boldStyle = oldStyle.bold;
  /// ```
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  /// Returns a new [TextStyle] with semi-bold font weight.
  ///
  /// Example:
  /// ```dart
  /// TextStyle semiBoldStyle = oldStyle.semiBold;
  /// ```
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Returns a new [TextStyle] with light font weight.
  ///
  /// Example:
  /// ```dart
  /// TextStyle lightStyle = oldStyle.light;
  /// ```
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Returns a new [TextStyle] with thin font weight.
  ///
  /// Example:
  /// ```dart
  /// TextStyle thinStyle = oldStyle.thin;
  /// ```
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);

  /// Returns a new [TextStyle] with medium font weight.
  ///
  /// Example:
  /// ```dart
  /// TextStyle mediumStyle = oldStyle.medium;
  /// ```
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Decoration

  /// Returns a new [TextStyle] with underline decoration.
  ///
  /// Example:
  /// ```dart
  /// TextStyle underlineStyle = oldStyle.underline;
  /// ```
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// Returns a new [TextStyle] with line-through decoration.
  ///
  /// Example:
  /// ```dart
  /// TextStyle lineThroughStyle = oldStyle.lineThrough;
  /// ```
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  /// Returns a new [TextStyle] with overline decoration.
  ///
  /// Example:
  /// ```dart
  /// TextStyle overlineStyle = oldStyle.overline;
  /// ```
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// Returns a new [TextStyle] with the specified [decorationColor].
  ///
  /// Example:
  /// ```dart
  /// TextStyle decorationColorStyle = oldStyle.decorationColor(Colors.red);
  /// ```
  TextStyle decorationColor(Color color) => copyWith(decorationColor: color);

  /// Returns a new [TextStyle] with the specified [decorationStyle].
  ///
  /// Example:
  /// ```dart
  /// TextStyle decorationStyleStyle = oldStyle.decorationStyle(TextDecorationStyle.dotted);
  /// ```
  TextStyle decorationStyle(TextDecorationStyle style) =>
      copyWith(decorationStyle: style);

  /// Returns a new [TextStyle] with the specified [decorationThickness].
  ///
  /// Example:
  /// ```dart
  /// TextStyle decorationThicknessStyle = oldStyle.decorationThickness(2.0);
  /// ```
  TextStyle decorationThickness(double thickness) =>
      copyWith(decorationThickness: thickness);

  /// Style Modifications

  /// Returns a new [TextStyle] with the specified [letterSpacing].
  ///
  /// Example:
  /// ```dart
  /// TextStyle letterSpacingStyle = oldStyle.withLetterSpacing(1.5);
  /// ```
  TextStyle withLetterSpacing(double spacing) =>
      copyWith(letterSpacing: spacing);

  /// Returns a new [TextStyle] with the specified [height].
  ///
  /// Example:
  /// ```dart
  /// TextStyle heightStyle = oldStyle.withHeight(1.5);
  /// ```
  TextStyle withHeight(double height) => copyWith(height: height);

  /// Returns a new [TextStyle] with the specified [wordSpacing].
  ///
  /// Example:
  /// ```dart
  /// TextStyle wordSpacingStyle = oldStyle.withWordSpacing(2.0);
  /// ```
  TextStyle withWordSpacing(double spacing) => copyWith(wordSpacing: spacing);

  /// Font Family and Style

  /// Returns a new [TextStyle] with the specified [fontFamily].
  ///
  /// Example:
  /// ```dart
  /// TextStyle fontFamilyStyle = oldStyle.withFamily('Roboto');
  /// ```
  TextStyle withFamily(String fontFamily) => copyWith(fontFamily: fontFamily);

  /// Returns a new [TextStyle] with italic font style.
  ///
  /// Example:
  /// ```dart
  /// TextStyle italicStyle = oldStyle.italic;
  /// ```
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Returns a new [TextStyle] with normal font style.
  ///
  /// Example:
  /// ```dart
  /// TextStyle normalStyle = oldStyle.normal;
  /// ```
  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);

  /// Text Alignment and Overflow

  /// Returns a new [TextStyle] with ellipsis overflow.
  ///
  /// Example:
  /// ```dart
  /// TextStyle ellipsisStyle = oldStyle.ellipsis;
  /// ```
  TextStyle get ellipsis => copyWith(overflow: TextOverflow.ellipsis);

  /// Returns a new [TextStyle] with clip overflow.
  ///
  /// Example:
  /// ```dart
  /// TextStyle clipStyle = oldStyle.clip;
  /// ```
  TextStyle get clip => copyWith(overflow: TextOverflow.clip);

  /// Returns a new [TextStyle] with fade overflow.
  ///
  /// Example:
  /// ```dart
  /// TextStyle fadeStyle = oldStyle.fade;
  /// ```
  TextStyle get fade => copyWith(overflow: TextOverflow.fade);
}

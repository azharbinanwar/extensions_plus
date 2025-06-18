part of '../../extensions_plus.dart';

extension StringTextStyleExtension on String {
  ///  Applies the `headlineLarge` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text headlineLarge(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: color),
    );
  }

  ///  Applies the `headlineMedium` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text headlineMedium(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: color),
    );
  }

  ///  Applies the `headlineSmall` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text headlineSmall(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color),
    );
  }

  ///  Applies the `titleLarge` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text titleLarge(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color),
    );
  }

  ///  Applies the `titleMedium` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text titleMedium(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color),
    );
  }

  ///  Applies the `titleSmall` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text titleSmall(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: color),
    );
  }

  ///  Applies the `bodyLarge` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text bodyLarge(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color),
    );
  }

  ///  Applies the `bodyMedium` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text bodyMedium(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
    );
  }

  ///  Applies the `bodySmall` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text bodySmall(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
    );
  }

  ///  Applies the `labelLarge` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text labelLarge(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
    );
  }

  ///  Applies the `labelMedium` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text labelMedium(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
    );
  }

  ///  Applies the `labelSmall` text style from the current theme to the string.
  ///
  ///  [context]: The current build context.
  ///  [color]: An optional color to override the default text color.
  ///
  /// Returns a [Text] widget with the specified style.
  Text labelSmall(BuildContext context, {Color? color}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
    );
  }

  /// Applies a custom color to the text.
  ///
  /// [color]: The color to apply.
  ///
  /// Returns a [Text] widget with the specified color.
  Text withColor(Color color) {
    return Text(this, style: TextStyle(color: color));
  }

  /// Applies a custom font size to the text.
  ///
  /// [size]: The font size to apply.
  ///
  /// Returns a [Text] widget with the specified font size.
  Text withSize(double size) {
    return Text(this, style: TextStyle(fontSize: size));
  }

  /// Applies a custom font weight to the text.
  ///
  /// [weight]: The font weight to apply.
  ///
  /// Returns a [Text] widget with the specified font weight.
  ///
  /// Example:
  ///
  Text withWeight(FontWeight weight) {
    return Text(this, style: TextStyle(fontWeight: weight));
  }

  /// Applies multiple styling options to the text, optionally based on the current theme.
  ///
  /// [context]: The build context for theme-based styling. If provided, the bodyMedium text style from the theme will be used as a base.
  /// [color]: The color of the text.
  /// [fontSize]: The size of the font.
  /// [fontWeight]: The weight of the font.
  /// [textAlign]: How the text should be aligned.
  /// [maxLines]: The maximum number of lines the text can span.
  /// [overflow]: How overflowing text should be handled.
  ///
  /// Returns a [Text] widget with the specified styles.
  ///
  /// Example:
  ///
  Text styled({
    BuildContext? context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    TextStyle? baseStyle = context != null
        ? Theme.of(context).textTheme.bodyMedium
        : null;

    return Text(
      this,
      style: (baseStyle ?? const TextStyle()).copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // Theme Color Extensions
  /// Applies the primary color from the theme to the text.
  ///
  /// [context]: The build context for accessing the theme.
  /// [textStyle]: An optional base text style to apply in addition to the primary color.
  ///
  /// Returns a [Text] widget with the primary color applied.
  ///
  /// Example:
  Text primaryColor(BuildContext context, {TextStyle? textStyle}) {
    TextStyle? baseStyle = textStyle ?? TextStyle();
    return Text(this, style: baseStyle.copyWith(color: context.primary));
  }

  /// Applies the secondary color from the theme to the text.
  ///
  /// [context]: The build context for accessing the theme.
  /// [textStyle]: An optional base text style to apply in addition to the secondary color.
  ///
  /// Returns a [Text] widget with the secondary color applied.
  ///
  /// Example:
  Text accentColor(BuildContext context, {TextStyle? textStyle}) {
    return Text(this, style: TextStyle(color: context.secondary));
  }

  /// Applies the error color from the theme to the text.
  ///
  /// [context]: The build context for accessing the theme.
  ///
  /// Returns a [Text] widget with the error color applied.
  ///
  /// Example:
  Text errorColor(BuildContext context) {
    return Text(this, style: TextStyle(color: context.error));
  }

  // Commonly used style methods
  /// Applies a custom color to the text.
  ///
  /// [color]: The color to apply.
  ///
  /// Returns a [Text] widget with the specified color.
  ///
  /// Example:
  Text textColor(Color color) {
    return _toText(style: TextStyle(color: color));
  }

  /// Applies a custom font size to the text.
  ///
  /// [size]: The font size to apply.
  ///
  /// Returns a [Text] widget with the specified font size.
  ///
  /// Example:
  Text fontSize(double size) {
    return _toText(style: TextStyle(fontSize: size));
  }

  /// Applies a custom font weight to the text.
  ///
  /// [weight]: The font weight to apply.
  ///
  /// Returns a [Text] widget with the specified font weight.
  ///
  /// Example:
  Text fontWeight(FontWeight weight) {
    return _toText(style: TextStyle(fontWeight: weight));
  }

  /// Applies a custom font family to the text.
  ///
  /// [family]: The font family to apply.
  ///
  /// Returns a [Text] widget with the specified font family.
  ///
  /// Example:
  Text fontFamily(String family) {
    return _toText(style: TextStyle(fontFamily: family));
  }

  /// Applies a custom letter spacing to the text.
  ///
  /// [spacing]: The letter spacing to apply.
  ///
  /// Returns a [Text] widget with the specified letter spacing.
  ///
  /// Example:
  Text letterSpacing(double spacing) {
    return _toText(style: TextStyle(letterSpacing: spacing));
  }

  /// Applies a custom line height to the text.
  ///
  /// [height]: The line height to apply.
  ///
  /// Returns a [Text] widget with the specified line height.
  ///
  /// Example:
  Text lineHeight(double height) {
    return _toText(style: TextStyle(height: height));
  }

  /// Applies a custom text decoration to the text.
  ///
  /// [decoration]: The text decoration to apply.
  ///
  /// Returns a [Text] widget with the specified text decoration.
  ///
  /// Example:
  Text textDecoration(TextDecoration decoration) {
    return _toText(style: TextStyle(decoration: decoration));
  }

  // Layout methods
  /// Sets the text alignment.
  Text textAlign(TextAlign align) => _toText(textAlign: align);

  /// Sets the maximum number of lines.
  Text maxLines(int lines) => _toText(maxLines: lines);

  /// Sets the overflow behavior.
  Text overflow(TextOverflow overflow) => _toText(overflow: overflow);

  /// Applies multiple styling properties to the text using a flexible approach.
  ///
  /// This method allows you to apply a wide range of text styles simultaneously.
  /// Each parameter corresponds to a specific style property in [TextStyle].
  /// If a parameter is not provided (null), the corresponding style property is not modified.
  ///
  /// [color]: The text color.
  /// [fontSize]: The size of the font.
  /// [fontWeight]: The weight of the font.
  /// [fontFamily]: The font family.
  /// [fontFamilyFallback]: A list of fallback font families.
  /// [height]: The line height.
  /// [letterSpacing]: The letter spacing.
  /// [wordSpacing]: The word spacing.
  /// [textBaseline]: The text baseline.
  /// [decoration]: The text decoration.
  /// [decorationColor]: The color of the text decoration.
  /// [decorationStyle]: The style of the text decoration.
  /// [decorationThickness]: The thickness of the text decoration.
  /// [foreground]: The foreground paint.
  /// [background]: The background paint.
  /// [shadows]: A list of shadows to apply to the text.
  Text withStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? height,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
  }) {
    return _toText(
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        height: height,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        fontVariations: fontVariations,
      ),
    );
  }

  // Flexible method for all text properties
  /// Applies multiple text properties to the text using a flexible approach.
  ///
  /// This method allows you to apply a range of text properties simultaneously.
  /// Each parameter corresponds to a specific text property in the [Text] widget.
  /// If a parameter is not provided (null), the corresponding text property is not modified.
  ///
  /// [textAlign]: The text alignment.
  /// [textDirection]: The text direction.
  /// [softWrap]: Whether the text should wrap to the next line.
  /// [overflow]: How overflowing text should be handled.
  /// [maxLines]: The maximum number of lines the text can span.
  /// [semanticsLabel]: A semantic label for the text.
  /// [textWidthBasis]: The text width basis.
  /// [textHeightBehavior]: The text height behavior.
  /// [strutStyle]: The strut style.
  /// [locale]: The locale for the text.
  /// [selectionColor]: The color of the selection.

  Text withTextProperties({
    TextAlign? textAlign,
    TextDirection? textDirection,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    StrutStyle? strutStyle,
    Locale? locale,
    Color? selectionColor,
  }) {
    return _toText(
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      strutStyle: strutStyle,
      locale: locale,
      selectionColor: selectionColor,
    );
  }

  /// this is a private method that converts a string to a Text widget
  Text _toText({
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    StrutStyle? strutStyle,
    Locale? locale,
    Color? selectionColor,
  }) {
    return Text(
      this,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      strutStyle: strutStyle,
      locale: locale,
      selectionColor: selectionColor,
    );
  }
}

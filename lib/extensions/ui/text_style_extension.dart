part of '../../extensions_plus.dart';

extension TextStyleExtension on Text {
  // Commonly used style methods
  /// Applies the given [color] to the text.
  Text textColor(Color color) {
    return _copyWith(
      style: style?.copyWith(color: color) ?? TextStyle(color: color),
    );
  }

  /// Creates a new [Text] widget with the provided properties, copying over the properties from the current [Text] widget that are not explicitly provided.
  ///
  /// This method is used internally to create modified copies of a [Text] widget, allowing for changes in specific properties while retaining the values of others.
  ///
  /// Parameters:
  /// - `data`: The new text data. If null, the current text data is used.
  /// - `style`: The new text style. If null, the current text style is used.
  /// - `textAlign`: The new text alignment. If null, the current text alignment is used.
  /// - `textDirection`: The new text direction. If null, the current text direction is used.
  /// - `softWrap`: The new soft wrap behavior. If null, the current soft wrap behavior is used.
  /// - `overflow`: The new overflow behavior. If null, the current overflow behavior is used.
  /// - `maxLines`: The new maximum number of lines. If null, the current maximum number of lines is used.
  /// - `semanticsLabel`: The new semantics label. If null, the current semantics label is used.
  /// - `textWidthBasis`: The new text width basis. If null, the current text width basis is used.
  /// - `textHeightBehavior`: The new text height behavior. If null, the current text height behavior is used.
  /// - `strutStyle`: The new strut style. If null, the current strut style is used.
  /// - `locale`: The new locale. If null, the current locale is used.
  /// - `selectionColor`: The new selection color. If null, the current selection color is used.
  ///
  /// Returns a new [Text] widget with the specified properties, or the existing properties if not overridden.
  ///
  /// This function is a utility for creating modified copies of [Text] widgets, ensuring that default or previous settings are preserved when only specific changes are desired.
  /// It uses the null-aware operator (`??`) to selectively choose between new properties or existing ones, maintaining a consistent and predictable behavior.
  ///
  /// Example:
  ///
  /// Applies the given [size] to the text's font.
  Text fontSize(double size) {
    return _copyWith(
      style: style?.copyWith(fontSize: size) ?? TextStyle(fontSize: size),
    );
  }

  /// Applies the given [weight] to the text's font.
  Text fontWeight(FontWeight weight) {
    return _copyWith(
      style:
          style?.copyWith(fontWeight: weight) ?? TextStyle(fontWeight: weight),
    );
  }

  /// Applies the given [family] to the text's font.
  Text fontFamily(String family) {
    return _copyWith(
      style:
          style?.copyWith(fontFamily: family) ?? TextStyle(fontFamily: family),
    );
  }

  /// Applies the given [spacing] to the text's letter spacing.
  Text letterSpacing(double spacing) {
    return _copyWith(
      style: style?.copyWith(letterSpacing: spacing) ??
          TextStyle(letterSpacing: spacing),
    );
  }

  /// Applies the given [height] to the text's line height.
  Text lineHeight(double height) {
    return _copyWith(
      style: style?.copyWith(height: height) ?? TextStyle(height: height),
    );
  }

  /// Applies the given [decoration] to the text's decoration.
  Text decoration(TextDecoration decoration) {
    return _copyWith(
      style: style?.copyWith(decoration: decoration) ??
          TextStyle(decoration: decoration),
    );
  }

  /// Sets the text alignment to [align].
  ///
  /// This method is used to align the text within its layout bounds.
  ///
  /// The [align] parameter determines how the text is aligned. For example:
  /// - `TextAlign.left`: Aligns the text to the left.
  /// - `TextAlign.center`: Centers the text horizontally.
  /// - `TextAlign.right`: Aligns the text to the right.
  /// - `TextAlign.justify`: Justifies the text, spreading it to fill the width.
  Text align(TextAlign align) => _copyWith(textAlign: align);

  /// Sets the maximum number of lines for the text.
  ///
  /// If the text exceeds the specified [lines], it will be truncated according to the `overflow` property.
  Text maxLines(int lines) => _copyWith(maxLines: lines);

  /// Sets the overflow behavior for the text.
  ///
  /// This determines how text is handled when it overflows its bounds.
  Text overflow(TextOverflow overflow) => _copyWith(overflow: overflow);

  /// A flexible method that allows setting multiple style properties of the text at once.
  ///
  /// This method provides a convenient way to modify various `TextStyle` properties
  /// like color, font size, font weight, font family, and more. It allows for
  /// fine-grained control over text appearance.
  ///
  /// Parameters:
  /// - `color`: The color to apply to the text.
  /// - `fontSize`: The size of the text's font.
  /// - `fontWeight`: The weight (boldness) of the text's font.
  /// - `fontFamily`: The font family to use for the text.
  /// - `fontFamilyFallback`: An ordered list of font families to fall back on.
  /// - `height`: The line height of the text.
  /// - `letterSpacing`: The spacing between individual letters in the text.
  /// - `wordSpacing`: The spacing between words in the text.
  /// - `textBaseline`: The baseline used for aligning the text.
  /// - `decoration`: The decorations to paint on the text (e.g., underline).
  /// - `decorationColor`: The color of the text decorations.
  /// - `decorationStyle`: The style of the text decorations (e.g., solid, dashed).
  /// - `decorationThickness`: The thickness of the text decorations.
  /// - `foreground`: The paint to use for rendering the text.
  /// - `background`: The background paint to use for rendering the text.
  /// - `shadows`: A list of shadows to apply to the text.
  /// - `fontFeatures`: A list of font features to apply to the text.
  /// - `fontVariations`: A list of font variations to apply to the text.
  ///
  /// Returns a new [Text] widget with the specified style properties applied.
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
    return _copyWith(
      style: style?.copyWith(
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
          ) ??
          TextStyle(
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

  /// A flexible method that allows setting multiple layout properties of the text at once.
  ///
  /// This method provides a way to modify various layout-related properties of
  /// the text, such as text alignment, direction, wrapping behavior, and more.
  ///
  /// Parameters:
  /// - `textAlign`: How the text should be aligned horizontally.
  /// - `textDirection`: The direction in which the text flows.
  /// - `softWrap`: Whether the text should break at soft line breaks.
  /// - `overflow`: How overflowing text should be handled.
  /// - `maxLines`: The maximum number of lines for the text to span.
  /// - `semanticsLabel`: A semantic description of the text.
  /// - `textWidthBasis`: The basis on which the text's width is calculated.
  /// - `textHeightBehavior`: How the text should behave vertically.
  /// - `strutStyle`: The strut style to use for vertical layout.
  /// - `locale`: The locale to use for text layout and formatting.
  /// - `selectionColor`: The color to use for text selections.
  ///
  /// Returns a new [Text] widget with the specified text properties applied.
  ///
  /// This method can be used to customize the text's layout and behavior
  /// based on various factors such as screen size, language, or specific
  /// design requirements. It complements the `withStyle` method, allowing
  /// for comprehensive control over both the appearance and layout of the
  /// text.
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
    return _copyWith(
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

  /// This is a private method used a helper
  Text _copyWith({
    String? data,
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
      data ?? this.data ?? '',
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      strutStyle: strutStyle ?? this.strutStyle,
      locale: locale ?? this.locale,
      selectionColor: selectionColor ?? this.selectionColor,
    );
  }
}

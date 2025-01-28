part of '../../extensions_plus.dart';

/// Extension on [Color] to provide advanced color manipulation methods
extension ColorExtension on Color {
  /// Darkens the color by reducing its lightness
  ///
  /// [amount] defines the lightness reduction (default is 10%)
  /// Returns a new darkened color
  ///
  /// Example:
  /// Color darkBlue = Colors.blue.darken(0.2); // Darken by 20%
  Color darken([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Lightens the color by increasing its lightness
  ///
  /// [amount] defines the lightness increase (default is 10%)
  /// Returns a new lightened color
  ///
  /// Example:
  /// Color lightBlue = Colors.blue.lighten(0.2); // Lighten by 20%
  Color lighten([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// Inverts the color's lightness and saturation while maintaining the hue
  ///
  /// Returns a new color with inverted properties
  ///
  /// Example:
  /// Color invertedColor = Colors.blue.invert;
  Color get invert {
    HSLColor hsl = HSLColor.fromColor(this);
    HSLColor invertedHsl =
        hsl.withLightness(1 - hsl.lightness).withSaturation(1 - hsl.saturation);
    return invertedHsl.toColor();
  }

  /// Determines a contrasting text color (black or white)
  ///
  /// Calculates luminance to provide optimal readability
  /// Returns [Colors.black] for light backgrounds
  /// Returns [Colors.white] for dark backgrounds
  ///
  /// Example:
  /// Color textColor = someColor.onIt;
  Color get onIt {
    final double r = this.r;
    final double g = this.g;
    final double b = this.b;

    double luminance = (0.299 * r + 0.587 * g + 0.114 * b);

    return luminance > 0.5
        ? Colors.black // Black for light backgrounds
        : Colors.white; // White for dark backgrounds
  }

  /// Converts the color to a hex string with alpha channel
  ///
  /// Returns a hex representation in format: #AARRGGBB
  ///
  /// Example:
  /// String hexColor = Colors.blue.hex; // #FF0000FF
  String get hexWithAlpha {
    // consider hex with alpha
    return '#${(a * 255).toInt().toRadixString(16).padLeft(2, '0')}'
            '${(r * 255).toInt().toRadixString(16).padLeft(2, '0')}'
            '${(g * 255).toInt().toRadixString(16).padLeft(2, '0')}'
            '${(b * 255).toInt().toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  /// Converts the color to a hex string without alpha channel
  ///
  /// Returns a hex representation in format: #RRGGBB
  ///
  /// Example:
  /// String hexColor = Colors.blue.hexWithoutAlpha(); // #0000FF
  String get hex {
    return '#${(r * 255).toInt().toRadixString(16).padLeft(2, '0')}'
            '${(g * 255).toInt().toRadixString(16).padLeft(2, '0')}'
            '${(b * 255).toInt().toRadixString(16).padLeft(2, '0')}'
        .toLowerCase();
  }

  /// Adjusts the brightness of the color
  ///
  /// [factor] multiplies the current lightness
  /// Requires non-negative factor
  /// Clamps result between 0.0 and 1.0
  ///
  /// Example:
  /// Color brighterBlue = Colors.blue.brightness(1.5);
  Color brightness(double factor) {
    assert(factor >= 0, 'Brightness factor must be non-negative');

    HSLColor hsl = HSLColor.fromColor(this);
    double newLightness = (hsl.lightness * factor).clamp(0.0, 1.0);

    return hsl.withLightness(newLightness).toColor();
  }

  /// Modifies the color's saturation
  ///
  /// [factor] multiplies the current saturation
  ///
  /// Example:
  /// Color desaturatedBlue = Colors.blue.saturation(0.5);
  Color saturation(double factor) {
    HSLColor hsl = HSLColor.fromColor(this);
    HSLColor adjustedHsl = hsl.withSaturation(hsl.saturation * factor);
    return adjustedHsl.toColor();
  }

  /// Generates a list of 10 color shades
  ///
  /// Provides shades from very light (50) to very dark (900)
  ///
  /// Example:
  /// ```List<Color> blueShades = Colors.blue.shades```;
  List<Color> get shades {
    final hslColor = HSLColor.fromColor(this);

    return [
      _adjustShade(hslColor, 0.9), // 50 - Very light
      _adjustShade(hslColor, 0.8), // 100
      _adjustShade(hslColor, 0.7), // 200
      _adjustShade(hslColor, 0.6), // 300
      _adjustShade(hslColor, 0.5), // 400
      _adjustShade(hslColor, 0.4), // 500 (original color)
      _adjustShade(hslColor, 0.3), // 600
      _adjustShade(hslColor, 0.2), // 700
      _adjustShade(hslColor, 0.1), // 800
      _adjustShade(hslColor, 0.05), // 900 - Very dark
    ];
  }

  /// Internal method to adjust shade lightness
  Color _adjustShade(HSLColor hslColor, double lightnessFactor) {
    return hslColor.withLightness(lightnessFactor.clamp(0.0, 1.0)).toColor();
  }

  /// Convenience getters for specific color shades
  Color get shade50 => shades[0];

  Color get shade100 => shades[1];

  Color get shade200 => shades[2];

  Color get shade300 => shades[3];

  Color get shade400 => shades[4];

  Color get shade500 => shades[5];

  Color get shade600 => shades[6];

  Color get shade700 => shades[7];

  Color get shade800 => shades[8];

  Color get shade900 => shades[9];
}

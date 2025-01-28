part of '../../extensions_plus.dart';

extension GenericBuildContextExtension on BuildContext {
  /// General Config
  /// Access `adaptations` from the Theme.
  Map<Type, Adaptation<Object>> get adaptations => Theme.of(this).adaptationMap;

  /// Check if `applyElevationOverlayColor` is enabled.
  bool get applyElevationOverlayColor =>
      Theme.of(this).applyElevationOverlayColor;

  /// Access the `cupertinoOverrideTheme` for Cupertino customization.
  NoDefaultCupertinoThemeData? get cupertinoOverrideTheme =>
      Theme.of(this).cupertinoOverrideTheme;

  /// Retrieve custom `extensions` for the theme.
  Map<Object, ThemeExtension<dynamic>> get extensions =>
      Theme.of(this).extensions;

  /// Retrieve the `InputDecorationTheme`.
  InputDecorationTheme? get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;

  /// Access the `MaterialTapTargetSize`.
  MaterialTapTargetSize? get materialTapTargetSize =>
      Theme.of(this).materialTapTargetSize;

  /// Retrieve the `PageTransitionsTheme`.
  PageTransitionsTheme? get pageTransitionsTheme =>
      Theme.of(this).pageTransitionsTheme;

  /// Get the platform for which the app is running.
  TargetPlatform? get platform => Theme.of(this).platform;

  /// Retrieve the `ScrollbarThemeData`.
  ScrollbarThemeData? get scrollbarTheme => Theme.of(this).scrollbarTheme;

  /// Access the `splashFactory` used for Ink splashes.
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(this).splashFactory;

  /// Retrieve the `VisualDensity` for spacing adjustments.
  VisualDensity? get visualDensity => Theme.of(this).visualDensity;
}

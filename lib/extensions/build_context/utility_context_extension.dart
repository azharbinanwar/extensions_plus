part of '../../extensions_plus.dart';

/// Utility extensions for common `BuildContext` actions.
extension UtilityContextExtension on BuildContext {
  /// Removes focus from the current widget (useful for hiding the keyboard).
  void unfocus() => FocusScope.of(this).unfocus();

  /// Copies the given text to the clipboard.
  Future<void> copyToClipboard(String text) =>
      Clipboard.setData(ClipboardData(text: text));

  /// True when the active theme is dark.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// True when the ambient text direction is right-to-left.
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  /// The current [Locale].
  Locale get locale => Localizations.localeOf(this);
}

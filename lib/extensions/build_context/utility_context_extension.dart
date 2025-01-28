part of 'build_context_extension.dart';

/// Utility extensions for common `BuildContext` actions.
extension UtilityContextExtension on BuildContext {
  /// Removes focus from the current widget (useful for hiding the keyboard).
  void unfocus() => FocusScope.of(this).unfocus();

  /// Copies the given text to the clipboard.
  Future<void> copyToClipboard(String text) =>
      Clipboard.setData(ClipboardData(text: text));
}

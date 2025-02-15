part of '../../extensions_plus.dart';

/// Extension on [BuildContext] to provide responsive design utilities and device information.
///
/// This extension provides convenient methods and getters for determining device characteristics,
/// screen sizes, and responsive breakpoints for Flutter applications.
extension DeviceContextExtension on BuildContext {
  /// Screen size breakpoints for different device categories
  static const double kMobileBreakpoint = 480.0;
  static const double kTabletBreakpoint = 768.0;
  static const double kDesktopBreakpoint = 1024.0;
  static const double kLargeDesktopBreakpoint = 1440.0;

  /// Returns the current [MediaQueryData] for this context.
  ///
  /// This is a shortcut to [MediaQuery.of(this)].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the [Size] of the current media (e.g., the screen).
  ///
  /// This is a shortcut to [mediaQuery.size].
  Size get size => mediaQuery.size;

  /// Returns the width of the current media (e.g., the screen width).
  ///
  /// This is a shortcut to [size.width].
  double get width => size.width;

  /// Returns the height of the current media (e.g., the screen height).
  ///
  /// This is a shortcut to [size.height].
  double get height => size.height;

  /// Returns the device pixel ratio for the current media.
  ///
  /// This is a shortcut to [mediaQuery.devicePixelRatio].
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  /// Returns the [Orientation] of the current media (e.g., landscape or portrait).
  ///
  /// This is a shortcut to [mediaQuery.orientation].
  Orientation get orientation => mediaQuery.orientation;

  /// Returns `true` if the device is in landscape orientation.
  ///
  /// This is a shortcut to `orientation == Orientation.landscape`.
  bool get isLandscape => orientation == Orientation.landscape;

  /// Returns `true` if the device is in portrait orientation.
  ///
  /// This is a shortcut to `orientation == Orientation.portrait`.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Returns `true` if the screen width is considered as a mobile device (<= `kMobileBreakpoint`).
  ///
  /// This is equivalent to checking `width <= kMobileBreakpoint`.
  bool get isMobile => width <= kMobileBreakpoint;

  /// Returns `true` if the screen width is considered as a tablet device (> `kMobileBreakpoint` and <= `kTabletBreakpoint`).
  ///
  /// This is equivalent to checking `width > kMobileBreakpoint && width <= kTabletBreakpoint`.
  bool get isTablet => width > kMobileBreakpoint && width <= kTabletBreakpoint;

  /// Returns `true` if the screen width is considered as a desktop device (> `kTabletBreakpoint` and <= `kLargeDesktopBreakpoint`).
  ///
  /// This is equivalent to checking `width > kTabletBreakpoint && width <= kLargeDesktopBreakpoint`.
  bool get isDesktop =>
      width > kTabletBreakpoint && width <= kLargeDesktopBreakpoint;

  /// Returns `true` if the screen width is considered as a large desktop device (> `kLargeDesktopBreakpoint`).
  ///
  /// This is equivalent to checking `width > kLargeDesktopBreakpoint`.
  bool get isLargeDesktop => width > kLargeDesktopBreakpoint;

  /// Returns the number of responsive columns based on the screen width.
  ///
  /// This method calculates how many columns can fit in the current screen width,
  /// based on a minimum column width defined by `baseWidth`.
  ///
  /// At least 1 column is always returned. Wider screens will return more columns.
  ///
  /// - [baseWidth]: The minimum width for each column (default: 400.0).
  ///
  /// Example:
  /// - If `width` is 1200 and `baseWidth` is 400, it returns 3.
  /// - If `width` is 300 and `baseWidth` is 400, it returns 1.
  int responsiveColumns({double baseWidth = 400.0}) =>
      max((width / baseWidth).floor(), 1);

  /// Returns appropriate padding based on screen size
  EdgeInsets get responsivePadding => EdgeInsets.all(
    isMobile
        ? 8.0
        : isTablet
        ? 24.0
        : 32.0,
  );

  /// Returns `true` if the device has a notch or similar display cutout.
  ///
  /// This is determined by checking if the top padding is greater than 20 logical pixels.
  ///
  /// This is equivalent to checking `mediaQuery.padding.top > 20`.
  bool get hasNotch => mediaQuery.padding.top > 20;

  /// Returns the top padding of the current media (e.g., the status bar height).
  ///
  /// This is equivalent to checking `MediaQuery.of(this).padding.top`.
  double get paddingTop => MediaQuery.of(this).padding.top;

  /// Returns the bottom padding of the current media (e.g., the navigation bar height).
  ///
  /// This is equivalent to checking `MediaQuery.of(this).padding.bottom`.
  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  /// Returns the height of the status bar.
  ///
  /// This is equivalent to checking `MediaQuery.of(this).padding.top`.
  double get statusBarHeight => MediaQuery.of(this).padding.top;
}

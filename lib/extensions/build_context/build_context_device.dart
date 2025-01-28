part of '../../extensions_plus.dart';

/// Extension on [BuildContext] to provide responsive design utilities and device information.
///
/// This extension provides convenient methods and getters for determining device characteristics,
/// screen sizes, and responsive breakpoints for Flutter applications.
extension DeviceContextExtension on BuildContext {
  /// Screen size breakpoints for different device categories
  static const double kMobileBreakpoint = 480.0;
  static const double kSmallTabletBreakpoint = 600.0;
  static const double kTabletBreakpoint = 768.0;
  static const double kDesktopBreakpoint = 1024.0;
  static const double kLargeDesktopBreakpoint = 1440.0;

  /// Returns the current media query data
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the size of the current media
  Size get size => mediaQuery.size;

  /// Returns the width of the current media
  double get width => size.width;

  /// Returns the height of the current media
  double get height => size.height;

  /// Returns the device pixel ratio
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  /// Returns the orientation of the current media
  Orientation get orientation => mediaQuery.orientation;

  /// Returns true if device is in landscape orientation
  bool get isLandscape => orientation == Orientation.landscape;

  /// Returns true if device is in portrait orientation
  bool get isPortrait => orientation == Orientation.portrait;

  /// Returns true if screen width is <= 480.0
  bool get isMobile => width <= kMobileBreakpoint;

  /// Returns true if screen width is > 480.0 and <= 600.0
  bool get isSmallTablet =>
      width > kMobileBreakpoint && width <= kSmallTabletBreakpoint;

  /// Returns true if screen width is > 600.0 and <= 768.0
  bool get isTablet =>
      width > kSmallTabletBreakpoint && width <= kTabletBreakpoint;

  /// Returns true if screen width is > 768.0 and <= 1024.0
  bool get isSmallDesktop =>
      width > kTabletBreakpoint && width <= kDesktopBreakpoint;

  /// Returns true if screen width is > 1024.0 and <= 1440.0
  bool get isDesktop =>
      width > kDesktopBreakpoint && width <= kLargeDesktopBreakpoint;

  /// Returns true if screen width is > 1440.0
  bool get isLargeDesktop => width > kLargeDesktopBreakpoint;

  /// Returns the number of responsive columns based on screen width
  ///
  /// [baseWidth] The minimum width for each column (default: 400.0)
  /// Returns at least 1 column, more for wider screens
  int responsiveColumns({double baseWidth = 400.0}) =>
      max((width / baseWidth).floor(), 1);

  /// Returns appropriate padding based on screen size
  EdgeInsets get responsivePadding => EdgeInsets.all(isMobile
      ? 8.0
      : isSmallTablet
          ? 16.0
          : isTablet
              ? 24.0
              : 32.0);

  /// Returns true if the device has a notch or similar display cutout
  bool get hasNotch => mediaQuery.padding.top > 20;

  /// Returns the top padding of the current media
  double get paddingTop => MediaQuery.of(this).padding.top;

  /// Returns the bottom padding of the current media
  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  /// Returns the height of the status bar
  double get statusBarHeight => MediaQuery.of(this).padding.top;
}

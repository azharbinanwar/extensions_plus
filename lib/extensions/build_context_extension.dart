import 'dart:math';

import 'package:extensions_plus/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension BuildContextEntension<T> on BuildContext {
  Size get size => MediaQuery.of(this).size;

  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet => MediaQuery.of(this).size.width < 1024.0 && MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet => MediaQuery.of(this).size.width < 650.0 && MediaQuery.of(this).size.width > 500.0;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall => MediaQuery.of(this).size.width < 850.0 && MediaQuery.of(this).size.width >= 560.0;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get paddingTop => MediaQuery.of(this).padding.top;

  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  int responsiveBreakpoint([double width = 400]) => max(size.width ~/ width, 1);

  /// Returns the `displayLarge` text style from the current theme.
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  /// Returns the `displayMedium` text style from the current theme.
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  /// Returns the `displaySmall` text style from the current theme.
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  /// Headline styles
  /// Returns the `headlineLarge` text style from the current theme.
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  /// Returns the `headlineMedium` text style from the current theme.
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  /// Returns the `headlineSmall` text style from the current theme.
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  /// Title styles
  /// Returns the `titleLarge` text style from the current theme.
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  /// Returns the `titleMedium` text style from the current theme.
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  /// Returns the `titleSmall` text style from the current theme.
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  /// Body styles
  /// Returns the `bodyLarge` text style from the current theme.
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  /// Returns the `bodyMedium` text style from the current theme.
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  /// Returns the `bodySmall` text style from the current theme.
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  /// Label styles
  /// Returns the `labelLarge` text style from the current theme.
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  /// Returns the `labelMedium` text style from the current theme.
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  /// Returns the `labelSmall` text style from the current theme.
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  /// COLORS
  ThemeData get theme => Theme.of(this);

  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  Brightness get brightness => Theme.of(this).brightness;

  /// Primary Colors
  /// Returns the primary color from the current theme.
  Color get primary => Theme.of(this).colorScheme.primary;

  /// Returns the onPrimary color from the current theme.
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  /// Returns the primaryContainer color from the current theme.
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  /// Returns the onPrimaryContainer color from the current theme.
  Color get onPrimaryContainer => Theme.of(this).colorScheme.onPrimaryContainer;

  /// Returns the primaryFixed color from the current theme.
  Color get primaryFixed => Theme.of(this).colorScheme.primaryFixed;

  /// Returns the primaryFixedDim color from the current theme.
  Color get primaryFixedDim => Theme.of(this).colorScheme.primaryFixedDim;

  /// Returns the onPrimaryFixed color from the current theme.
  Color get onPrimaryFixed => Theme.of(this).colorScheme.onPrimaryFixed;

  /// Returns the onPrimaryFixedVariant color from the current theme.
  Color get onPrimaryFixedVariant => Theme.of(this).colorScheme.onPrimaryFixedVariant;

  /// Secondary Colors
  /// Returns the secondary color from the current theme.
  Color get secondary => Theme.of(this).colorScheme.secondary;

  /// Returns the onSecondary color from the current theme.
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  /// Returns the secondaryContainer color from the current theme.
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  /// Returns the onSecondaryContainer color from the current theme.
  Color get onSecondaryContainer => Theme.of(this).colorScheme.onSecondaryContainer;

  /// Returns the secondaryFixed color from the current theme.
  Color get secondaryFixed => Theme.of(this).colorScheme.secondaryFixed;

  /// Returns the secondaryFixedDim color from the current theme.
  Color get secondaryFixedDim => Theme.of(this).colorScheme.secondaryFixedDim;

  /// Returns the onSecondaryFixed color from the current theme.
  Color get onSecondaryFixed => Theme.of(this).colorScheme.onSecondaryFixed;

  /// Returns the onSecondaryFixedVariant color from the current theme.
  Color get onSecondaryFixedVariant => Theme.of(this).colorScheme.onSecondaryFixedVariant;

  /// Tertiary Colors
  /// Returns the tertiary color from the current theme.
  Color get tertiary => Theme.of(this).colorScheme.tertiary;

  /// Returns the onTertiary color from the current theme.
  Color get onTertiary => Theme.of(this).colorScheme.onTertiary;

  /// Returns the tertiaryContainer color from the current theme.
  Color get tertiaryContainer => Theme.of(this).colorScheme.tertiaryContainer;

  /// Returns the onTertiaryContainer color from the current theme.
  Color get onTertiaryContainer => Theme.of(this).colorScheme.onTertiaryContainer;

  /// Returns the tertiaryFixed color from the current theme.
  Color get tertiaryFixed => Theme.of(this).colorScheme.tertiaryFixed;

  /// Returns the tertiaryFixedDim color from the current theme.
  Color get tertiaryFixedDim => Theme.of(this).colorScheme.tertiaryFixedDim;

  /// Returns the onTertiaryFixed color from the current theme.
  Color get onTertiaryFixed => Theme.of(this).colorScheme.onTertiaryFixed;

  /// Returns the onTertiaryFixedVariant color from the current theme.
  Color get onTertiaryFixedVariant => Theme.of(this).colorScheme.onTertiaryFixedVariant;

  /// Error Colors
  /// Returns the error color from the current theme.
  Color get error => Theme.of(this).colorScheme.error;

  /// Returns the onError color from the current theme.
  Color get onError => Theme.of(this).colorScheme.onError;

  /// Returns the errorContainer color from the current theme.
  Color get errorContainer => Theme.of(this).colorScheme.errorContainer;

  /// Returns the onErrorContainer color from the current theme.
  Color get onErrorContainer => Theme.of(this).colorScheme.onErrorContainer;

  /// Surface Colors
  /// Returns the surface color from the current theme.
  Color get surface => Theme.of(this).colorScheme.surface;

  /// Returns the onSurface color from the current theme.
  Color get onSurface => Theme.of(this).colorScheme.onSurface;

  /// Returns the surfaceDim color from the current theme.
  Color get surfaceDim => Theme.of(this).colorScheme.surfaceDim;

  /// Returns the surfaceBright color from the current theme.
  Color get surfaceBright => Theme.of(this).colorScheme.surfaceBright;

  /// Returns the surfaceContainerLowest color from the current theme.
  Color get surfaceContainerLowest => Theme.of(this).colorScheme.surfaceContainerLowest;

  /// Returns the surfaceContainerLow color from the current theme.
  Color get surfaceContainerLow => Theme.of(this).colorScheme.surfaceContainerLow;

  /// Returns the surfaceContainer color from the current theme.
  Color get surfaceContainer => Theme.of(this).colorScheme.surfaceContainer;

  /// Returns the surfaceContainerHigh color from the current theme.
  Color get surfaceContainerHigh => Theme.of(this).colorScheme.surfaceContainerHigh;

  /// Returns the surfaceContainerHighest color from the current theme.
  Color get surfaceContainerHighest => Theme.of(this).colorScheme.surfaceContainerHighest;

  /// Other Colors
  /// Returns the onSurfaceVariant color from the current theme.
  Color get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;

  /// Returns the outline color from the current theme.
  Color get outline => Theme.of(this).colorScheme.outline;

  /// Returns the outlineVariant color from the current theme.
  Color get outlineVariant => Theme.of(this).colorScheme.outlineVariant;

  /// Returns the shadow color from the current theme.
  Color get shadow => Theme.of(this).colorScheme.shadow;

  /// Returns the scrim color from the current theme.
  Color get scrim => Theme.of(this).colorScheme.scrim;

  /// Returns the inverseSurface color from the current theme.
  Color get inverseSurface => Theme.of(this).colorScheme.inverseSurface;

  /// Returns the onInverseSurface color from the current theme.
  Color get onInverseSurface => Theme.of(this).colorScheme.onInverseSurface;

  /// Returns the inversePrimary color from the current theme.
  Color get inversePrimary => Theme.of(this).colorScheme.inversePrimary;

  /// Returns the surfaceTint color from the current theme.
  Color get surfaceTint => Theme.of(this).colorScheme.surfaceTint;

// AppBar Theme
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  Color get appBarColor => Theme.of(this).appBarTheme.backgroundColor!;

// Icon Theme
  Color get iconColor => Theme.of(this).iconTheme.color!;

  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  Orientation get orientation => MediaQuery.of(this).orientation;

  void unfocus() => FocusScope.of(this).unfocus();

  Future<T?> showBottomSheet({
    required WidgetBuilder builder,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    double scrollControlDisabledMaxHeightRatio = 9.0 / 16.0,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    AnimationStyle? sheetAnimationStyle,
  }) {
    return showModalBottomSheet(
      context: this,
      builder: builder,
      backgroundColor: backgroundColor,
      barrierLabel: barrierLabel,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      sheetAnimationStyle: sheetAnimationStyle,
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    Widget content, {
    Color? backgroundColor,
    AnimationStyle? animationStyle,
    final double? elevation,
    final EdgeInsetsGeometry? margin,
    final EdgeInsetsGeometry? padding,
    final double? width,
    final ShapeBorder? shape,
    final HitTestBehavior? hitTestBehavior,
    final SnackBarBehavior? behavior,
    final SnackBarAction? action,
    final double? actionOverflowThreshold,
    final bool? showCloseIcon,
    final Color? closeIconColor,
    final Duration duration = const Duration(milliseconds: 4000),
    final Animation<double>? animation,
    final VoidCallback? onVisible,
    final DismissDirection? dismissDirection,
    final Clip clipBehavior = Clip.hardEdge,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: content,
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        elevation: elevation,
        margin: margin,
        padding: padding,
        width: width,
        shape: shape,
        hitTestBehavior: hitTestBehavior,
        action: action,
        actionOverflowThreshold: actionOverflowThreshold,
        showCloseIcon: showCloseIcon,
        closeIconColor: closeIconColor,
        duration: duration,
        animation: animation,
        onVisible: onVisible,
        dismissDirection: dismissDirection,
        clipBehavior: clipBehavior,
      ),
      snackBarAnimationStyle: animationStyle,
    );
  }

  BottomNavigationBarThemeData get bottomNavigationBarTheme => Theme.of(this).bottomNavigationBarTheme;

  Future<Object?> showAppGeneralDialog({
    required final String title,
    final Color? barrierColor,
    final List<Widget> actions = const [],
    required Widget child,
    final EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
  }) {
    // add 8 points between actions
    List<Widget> userActions =
        actions.length <= 1 ? actions : actions.map((e) => Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: e)).toList();
    return showGeneralDialog(
      context: this,
      barrierColor: barrierColor ?? Colors.transparent,
      pageBuilder: (BuildContext context, _, __) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: min(width * .9, 500.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Material(
              color: context.theme.canvasColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: kToolbarHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 48.0),
                        Expanded(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: context.appBarTheme.titleTextStyle,
                          ),
                        ),
                        IconButton(
                          splashRadius: 20.0,
                          icon: Icon(Icons.close, color: context.primary),
                          onPressed: Navigator.of(context).pop,
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(height: 8.0),
                  Padding(
                    padding: padding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        child,
                        if (userActions.isNotEmpty) ...{
                          const SizedBox(height: 16.0),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: userActions).fit()
                        },
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).center();
      },
    );
  }

  Future<void> copyToClipboard(String text) => Clipboard.setData(ClipboardData(text: text));
}

part of '../../extensions_plus.dart';

/// Extensions to show bottom sheets easily from the `BuildContext`.
extension OverlayUtilitiesBuildContext on BuildContext {
  /// Displays a modal bottom sheet with customizable properties.
  ///
  /// [builder]: The widget builder for the bottom sheet content.
  /// [isScrollControlled]: Allows the sheet to expand fully if true.
  Future<T?> showBottomSheet<T>({
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

  /// Displays a `SnackBar` with customizable properties.
  ///
  /// [content]: The widget to display inside the `SnackBar`.
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    Widget content, {
    Color? backgroundColor,
    AnimationStyle? animationStyle,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    HitTestBehavior? hitTestBehavior,
    SnackBarBehavior? behavior,
    SnackBarAction? action,
    double? actionOverflowThreshold,
    bool? showCloseIcon,
    Color? closeIconColor,
    Duration duration = const Duration(milliseconds: 4000),
    Animation<double>? animation,
    VoidCallback? onVisible,
    DismissDirection? dismissDirection,
    Clip clipBehavior = Clip.hardEdge,
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

  /// Displays a custom general dialog with a title and actions.
  ///
  /// [title]: The title of the dialog.
  /// [child]: The main content widget of the dialog.
  Future<Object?> showAppGeneralDialog({
    required String title,
    Color? barrierColor,
    List<Widget> actions = const [],
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
  }) {
    List<Widget> userActions =
        actions.length <= 1
            ? actions
            : actions
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: e,
                  ),
                )
                .toList();
    return showGeneralDialog(
      context: this,
      barrierColor: barrierColor ?? Colors.transparent,
      pageBuilder: (BuildContext context, _, _) {
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        child,
                        if (userActions.isNotEmpty) ...{
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: userActions,
                          ).fit(),
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

  /// Displays a simple alert dialog with title, content, and actions.
  Future<T?> showAppDialog<T>({
    required Text title,
    required Widget content,
    List<Widget>? actions,
    EdgeInsetsGeometry? padding,
    Color? barrierColor,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    return showDialog<T>(
      context: this,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (context) {
        return AlertDialog(
          title: title,
          content: content,
          actions: actions,
          contentPadding: padding,
        );
      },
    );
  }
}

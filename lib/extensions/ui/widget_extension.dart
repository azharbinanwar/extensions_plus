part of '../../extensions_plus.dart';

/// Extension methods for the `Widget` class to add various utility functions.
extension WidgetExtension on Widget {
  /// Adds padding to all sides of the widget.
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Adds custom padding to the widget.
  Widget padding(EdgeInsets padding) => Padding(padding: padding, child: this);

  /// Fills the parent widget.
  Widget fill({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Positioned.fill(
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    child: this,
  );

  /// Adds a tap gesture to the widget.
  Widget onTap(VoidCallback? onTap) =>
      GestureDetector(onTap: onTap, child: this);

  /// Adds symmetric padding to the widget.
  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Adds padding to specific sides of the widget.
  Widget paddingOnly({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    ),
    child: this,
  );

  /// Adds padding from left, top, right, and bottom.
  Widget paddingFromLTRB(
    double left,
    double right,
    double top,
    double bottom,
  ) => Padding(
    padding: EdgeInsets.fromLTRB(left, top, right, bottom),
    child: this,
  );

  /// Adds margin to all sides of the widget.
  Widget marginAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Adds symmetric margin to the widget.
  Widget marginSymmetric({
    required double horizontal,
    required double vertical,
  }) => Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: this,
  );

  /// Adds margin to specific sides of the widget.
  Widget marginOnly({
    required double left,
    required double right,
    required double top,
    required double bottom,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    ),
    child: this,
  );

  /// Adds margin from left, top, right, and bottom.
  Widget marginFromLTRB({
    required double left,
    required double right,
    required double top,
    required double bottom,
  }) => Padding(
    padding: EdgeInsets.fromLTRB(left, top, right, bottom),
    child: this,
  );

  /// Centers the widget.
  Widget center() => Center(child: this);

  /// Fits the widget within a `FittedBox`.
  Widget fit() => FittedBox(child: this);

  /// Sets the widget to a square size.
  Widget square(double value) => SizedBox.square(dimension: value, child: this);

  /// Wraps the widget with a `Material` widget.
  Widget materialized({BorderRadius? borderRadius}) => Material(
    borderRadius: borderRadius,
    color: Colors.transparent,
    child: this,
  );

  /// Wraps the widget with a `SafeArea`.
  Widget safeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
  }) =>
      SafeArea(left: left, top: top, right: right, bottom: bottom, child: this);

  /// Shows the widget if the condition is true.
  Widget showIf(bool value) => value ? this : const SizedBox.shrink();

  /// Aligns the widget.
  Widget align([AlignmentGeometry alignment = Alignment.center]) =>
      Align(alignment: alignment, child: this);

  /// Expands the widget.
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Makes the widget flexible.
  Widget flexible({int flex = 1}) => Flexible(flex: flex, child: this);

  /// Sets the background color of the widget.
  Widget background(Color color) => Material(color: color, child: this);

  /// Adds a divider below the widget.
  Widget addDivider({
    double height = 1.0,
    Color color = Colors.grey,
    double indent = 0.0,
    double endIndent = 0.0,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        this,
        Divider(
          height: height,
          color: color,
          indent: indent,
          endIndent: endIndent,
        ),
      ],
    );
  }

  /// Adds constraints to the widget.
  Widget constrains({
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: this,
    );
  }

  /// Adds responsive constraints to the widget.
  Widget responsiveConstrains({
    Alignment alignment = Alignment.topCenter,
    double minWidth = 0.0,
    double maxWidth = 600.0,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: this,
    ).align(alignment);
  }

  /// Updates the status bar color according to the screens and theme.
  Widget annotateRegion(
    BuildContext context, {
    Color? statusBarColor,
    Brightness? statusBarIconBrightness,
    Brightness? statusBarBrightness,
  }) {
    Brightness brightness = Theme.of(context).brightness;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? context.appBarColor,
        statusBarIconBrightness:
            statusBarIconBrightness ??
            (brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light),
        statusBarBrightness: statusBarBrightness ?? brightness,
      ),
      child: this,
    );
  }

  /// Converts the widget to a scrollable list.
  Widget toScrollableList({
    int itemCount = 10,
    Axis scrollDirection = Axis.vertical,
    EdgeInsets padding = EdgeInsets.zero,
    Widget? separator,
  }) {
    List<Widget> items = List.generate(itemCount, (index) => this);
    if (separator != null) {
      items = items.expand((element) => [element, separator]).toList();
    }

    return SingleChildScrollView(
      padding: padding,
      scrollDirection: scrollDirection,
      child:
          scrollDirection == Axis.vertical
              ? Column(children: items)
              : Row(children: items),
    );
  }

  /// Converts the widget to a scrollable grid.
  Widget toScrollableGrid({
    SliverGridDelegate gridDelegate =
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
    EdgeInsets padding = EdgeInsets.zero,
    int itemCount = 10,
    Axis scrollDirection = Axis.vertical,
  }) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: gridDelegate,
      scrollDirection: scrollDirection,
      padding: padding,
      itemBuilder: (_, _) => this,
    );
  }

  /// Makes the widget scrollable.
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      padding: padding,
      child: this,
    );
  }

  /// Adds elevation/shadow to the widget.
  Widget elevation({
    double elevation = 4.0,
    Color? shadowColor,
    BorderRadiusGeometry? borderRadius,
  }) => Material(
    elevation: elevation,
    shadowColor: shadowColor,
    borderRadius: borderRadius,
    child: this,
  );

  /// Adds circular border radius to the widget.
  Widget circular(double radius) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);

  /// Adds opacity to the widget.
  Widget opacity(double value) => Opacity(opacity: value, child: this);

  /// Rotates the widget.
  Widget rotate(double angle) => Transform.rotate(angle: angle, child: this);

  /// Scales the widget.
  Widget scale(double scale) => Transform.scale(scale: scale, child: this);

  /// Adds conditional visibility to the widget.
  Widget visibility({
    bool visible = true,
    bool maintainState = false,
    bool maintainAnimation = false,
    bool maintainSize = false,
  }) => Visibility(
    visible: visible,
    maintainState: maintainState,
    maintainAnimation: maintainAnimation,
    maintainSize: maintainSize,
    child: this,
  );

  /// Adds a tap ripple effect to the widget.
  Widget ripple({
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? highlightColor,
  }) => Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: borderRadius,
      splashColor: splashColor,
      highlightColor: highlightColor,
      child: this,
    ),
  );
}

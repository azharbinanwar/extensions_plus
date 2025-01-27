part of 'build_context_extension.dart';

/// A powerful extension on [BuildContext] that provides convenient navigation methods
/// with full support for all [MaterialPageRoute] properties.
extension NavigationExtension on BuildContext {
  /// Gets the current [NavigatorState].
  ///
  /// This is a shorthand for `Navigator.of(this)`.
  NavigatorState get navigator => Navigator.of(this);

  /// Pushes a new route onto the navigation stack with full control over [MaterialPageRoute] properties.
  ///
  /// Parameters:
  /// - [page]: The widget to display in the new route
  /// - [maintainState]: Whether to maintain the state of the previous route (defaults to true)
  /// - [fullscreenDialog]: Whether this page route is a full-screen dialog (defaults to false)
  /// - [allowSnapshotting]: Whether to allow state snapshots (defaults to true)
  /// - [barrierDismissible]: Whether clicking outside dismisses the route (defaults to false)
  /// - [settings]: Route settings for named routes and arguments
  /// - [requestFocus]: Whether to request focus when the route is pushed
  ///
  /// Returns a Future that completes with the [result] value when the route is popped.
  ///
  /// Example:
  /// ```dart
  /// context.push(
  ///   HomePage(),
  ///   fullscreenDialog: true,
  ///   settings: RouteSettings(name: '/home'),
  /// );
  /// ```
  Future<T?> push<T>(
    Widget page, {
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    RouteSettings? settings,
    bool? requestFocus,
  }) {
    return navigator.push<T>(
      MaterialPageRoute<T>(
        builder: (context) => page,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
        barrierDismissible: barrierDismissible,
        settings: settings,
        requestFocus: requestFocus,
      ),
    );
  }

  /// Pushes a new route and removes all previous routes until [predicate] returns true.
  ///
  /// Parameters:
  /// - [page]: The widget to display in the new route
  /// - [predicate]: Function that determines which routes to keep
  /// - Additional [MaterialPageRoute] properties as described in [push]
  ///
  /// Example:
  /// ```dart
  /// // Remove all previous routes
  /// context.pushAndRemoveUntil(
  ///   HomePage(),
  ///   (route) => false,
  /// );
  ///
  /// // Keep routes until a specific route
  /// context.pushAndRemoveUntil(
  ///   HomePage(),
  ///   (route) => route.settings.name == '/login',
  /// );
  /// ```
  Future<T?> pushAndRemoveUntil<T>(
    Widget page,
    bool Function(Route) predicate, {
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    RouteSettings? settings,
    bool? requestFocus,
  }) {
    return navigator.pushAndRemoveUntil<T>(
      MaterialPageRoute<T>(
        builder: (context) => page,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
        barrierDismissible: barrierDismissible,
        settings: settings,
        requestFocus: requestFocus,
      ),
      predicate,
    );
  }

  /// Pushes a new route with a fade transition animation.
  ///
  /// Parameters:
  /// - [page]: The widget to display in the new route
  /// - [duration]: Duration of the fade animation (defaults to 300ms)
  /// - Additional [MaterialPageRoute] properties as described in [push]
  ///
  /// Example:
  /// ```dart
  /// context.pushWithFade(
  ///   HomePage(),
  ///   duration: Duration(milliseconds: 500),
  /// );
  /// ```
  Future<T?> pushWithFade<T>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    RouteSettings? settings,
    bool? requestFocus,
  }) {
    return navigator.push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: duration,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
        barrierDismissible: barrierDismissible,
        settings: settings,
      ),
    );
  }

  /// Pushes a new route with a slide transition animation.
  ///
  /// Parameters:
  /// - [page]: The widget to display in the new route
  /// - [duration]: Duration of the slide animation (defaults to 300ms)
  /// - [begin]: Starting offset for the slide animation (defaults to right-to-left)
  /// - Additional [MaterialPageRoute] properties as described in [push]
  ///
  /// Example:
  /// ```dart
  /// // Slide from bottom
  /// context.pushWithSlide(
  ///   HomePage(),
  ///   begin: Offset(0.0, 1.0),
  /// );
  /// ```
  Future<T?> pushWithSlide<T>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Offset begin = const Offset(1.0, 0.0),
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    RouteSettings? settings,
    bool? requestFocus,
  }) {
    return navigator.push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: begin,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: duration,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
        barrierDismissible: barrierDismissible,
        settings: settings,
      ),
    );
  }

  /// Pops the current route off the navigation stack.
  ///
  /// Optionally returns a [result] to the previous route.
  ///
  /// Example:
  /// ```dart
  /// context.pop(); // Simple pop
  /// context.pop('result'); // Pop with result
  /// ```
  void pop<T>([T? result]) => navigator.pop<T>(result);

  /// Pops routes until [predicate] returns true.
  ///
  /// Example:
  /// ```dart
  /// context.popUntil((route) => route.isFirst); // Pop to first route
  /// ```
  void popUntil(bool Function(Route) predicate) =>
      navigator.popUntil(predicate);

  /// Whether the navigator can pop the current route.
  bool get canPop => navigator.canPop();

  /// Pops all routes except the first route.
  void popUntilFirst() => navigator.popUntil((route) => route.isFirst);

  /// Pops the current route and returns [data] to the previous route.
  ///
  /// Example:
  /// ```dart
  /// context.popWithData({'result': 'success'});
  /// ```
  void popWithData<T>(T data) => navigator.pop<T>(data);

  /// Pops multiple routes at once.
  ///
  /// Example:
  /// ```dart
  /// context.popTimes(2); // Pop two routes
  /// ```
  void popTimes(int times) {
    int count = 0;
    navigator.popUntil((_) => count++ >= times);
  }

  /// Checks if a route with the given name exists in the navigation stack.
  ///
  /// Example:
  /// ```dart
  /// if (context.hasRoute('/home')) {
  ///   // Route exists
  /// }
  /// ```
  bool hasRoute(String routeName) {
    bool exists = false;
    navigator.popUntil((route) {
      exists = route.settings.name == routeName;
      return true;
    });
    return exists;
  }
}

part of '../../extensions_plus.dart';

extension BuildContextTheme on BuildContext {
  /// TYPOGRAPHY & ICONOGRAPHY

  /// Retrieves the primary [TextTheme] for this theme.
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  /// Retrieves the general [TextTheme] for this theme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Retrieves the [Typography] settings for this theme.
  Typography get typography => Theme.of(this).typography;

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
  Color get onPrimaryFixedVariant =>
      Theme.of(this).colorScheme.onPrimaryFixedVariant;

  /// Secondary Colors
  /// Returns the secondary color from the current theme.
  Color get secondary => Theme.of(this).colorScheme.secondary;

  /// Returns the onSecondary color from the current theme.
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  /// Returns the secondaryContainer color from the current theme.
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  /// Returns the onSecondaryContainer color from the current theme.
  Color get onSecondaryContainer =>
      Theme.of(this).colorScheme.onSecondaryContainer;

  /// Returns the secondaryFixed color from the current theme.
  Color get secondaryFixed => Theme.of(this).colorScheme.secondaryFixed;

  /// Returns the secondaryFixedDim color from the current theme.
  Color get secondaryFixedDim => Theme.of(this).colorScheme.secondaryFixedDim;

  /// Returns the onSecondaryFixed color from the current theme.
  Color get onSecondaryFixed => Theme.of(this).colorScheme.onSecondaryFixed;

  /// Returns the onSecondaryFixedVariant color from the current theme.
  Color get onSecondaryFixedVariant =>
      Theme.of(this).colorScheme.onSecondaryFixedVariant;

  /// Tertiary Colors
  /// Returns the tertiary color from the current theme.
  Color get tertiary => Theme.of(this).colorScheme.tertiary;

  /// Returns the onTertiary color from the current theme.
  Color get onTertiary => Theme.of(this).colorScheme.onTertiary;

  /// Returns the tertiaryContainer color from the current theme.
  Color get tertiaryContainer => Theme.of(this).colorScheme.tertiaryContainer;

  /// Returns the onTertiaryContainer color from the current theme.
  Color get onTertiaryContainer =>
      Theme.of(this).colorScheme.onTertiaryContainer;

  /// Returns the tertiaryFixed color from the current theme.
  Color get tertiaryFixed => Theme.of(this).colorScheme.tertiaryFixed;

  /// Returns the tertiaryFixedDim color from the current theme.
  Color get tertiaryFixedDim => Theme.of(this).colorScheme.tertiaryFixedDim;

  /// Returns the onTertiaryFixed color from the current theme.
  Color get onTertiaryFixed => Theme.of(this).colorScheme.onTertiaryFixed;

  /// Returns the onTertiaryFixedVariant color from the current theme.
  Color get onTertiaryFixedVariant =>
      Theme.of(this).colorScheme.onTertiaryFixedVariant;

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
  Color get surfaceContainerLowest =>
      Theme.of(this).colorScheme.surfaceContainerLowest;

  /// Returns the surfaceContainerLow color from the current theme.
  Color get surfaceContainerLow =>
      Theme.of(this).colorScheme.surfaceContainerLow;

  /// Returns the surfaceContainer color from the current theme.
  Color get surfaceContainer => Theme.of(this).colorScheme.surfaceContainer;

  /// Returns the surfaceContainerHigh color from the current theme.
  Color get surfaceContainerHigh =>
      Theme.of(this).colorScheme.surfaceContainerHigh;

  /// Returns the surfaceContainerHighest color from the current theme.
  Color get surfaceContainerHighest =>
      Theme.of(this).colorScheme.surfaceContainerHighest;

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

  /// AppBar Theme
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  Color get appBarColor => Theme.of(this).appBarTheme.backgroundColor!;

  /// Icon Theme
  Color get iconColor => Theme.of(this).iconTheme.color!;

  /// Access the color scheme of the current theme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Access the canvas color of the current theme.
  Color get canvasColor => Theme.of(this).canvasColor;

  /// Access the card color of the current theme.
  Color get cardColor => Theme.of(this).cardColor;

  /// Access the dialog background color of the current theme.
  Color get dialogBackgroundColor => Theme.of(this).dialogBackgroundColor;

  /// Access the disabled color of the current theme.
  Color get disabledColor => Theme.of(this).disabledColor;

  /// Access the divider color of the current theme.
  Color get dividerColor => Theme.of(this).dividerColor;

  /// Access the focus color of the current theme.
  Color get focusColor => Theme.of(this).focusColor;

  /// Access the highlight color of the current theme.
  Color get highlightColor => Theme.of(this).highlightColor;

  /// Access the hint color of the current theme.
  Color get hintColor => Theme.of(this).hintColor;

  /// Access the hover color of the current theme.
  Color get hoverColor => Theme.of(this).hoverColor;

  /// Access the indicator color of the current theme.
  Color get indicatorColor => Theme.of(this).indicatorColor;

  /// Access the primary color of the current theme.
  Color get primaryColor => Theme.of(this).primaryColor;

  /// Access the dark variant of the primary color.
  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  /// Access the light variant of the primary color.
  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  /// Access the scaffold background color of the current theme.
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  /// Access the secondary header color of the current theme.
  Color get secondaryHeaderColor => Theme.of(this).secondaryHeaderColor;

  /// Access the shadow color of the current theme.
  Color get shadowColor => Theme.of(this).shadowColor;

  /// Access the splash color of the current theme.
  Color get splashColor => Theme.of(this).splashColor;

  /// Access the unselected widget color of the current theme.
  Color get unselectedWidgetColor => Theme.of(this).unselectedWidgetColor;

  // COMPONENT THEMES

  /// Retrieves the [IconThemeData] for action icons.
  IconThemeData get actionIconTheme => Theme.of(this).iconTheme;

  /// Retrieves the [BadgeThemeData] for badges.
  BadgeThemeData get badgeTheme => Theme.of(this).badgeTheme;

  /// Retrieves the [MaterialBannerThemeData] for material banners.
  MaterialBannerThemeData get bannerTheme => Theme.of(this).bannerTheme;

  /// Retrieves the [BottomAppBarTheme] for bottom app bars.
  BottomAppBarTheme get bottomAppBarTheme => Theme.of(this).bottomAppBarTheme;

  /// Retrieves the [BottomNavigationBarThemeData] for bottom navigation bars.
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      Theme.of(this).bottomNavigationBarTheme;

  /// Retrieves the [BottomSheetThemeData] for bottom sheets.
  BottomSheetThemeData get bottomSheetTheme => Theme.of(this).bottomSheetTheme;

  /// Retrieves the [ButtonThemeData] for buttons.
  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;

  /// Retrieves the [CardTheme] for cards.
  CardThemeData get cardTheme => Theme.of(this).cardTheme;

  /// Retrieves the [CheckboxThemeData] for checkboxes.
  CheckboxThemeData get checkboxTheme => Theme.of(this).checkboxTheme;

  /// Retrieves the [ChipThemeData] for chips.
  ChipThemeData get chipTheme => Theme.of(this).chipTheme;

  /// Retrieves the [DataTableThemeData] for data tables.
  DataTableThemeData get dataTableTheme => Theme.of(this).dataTableTheme;

  /// Retrieves the [DatePickerThemeData] for date pickers.
  DatePickerThemeData get datePickerTheme => Theme.of(this).datePickerTheme;

  /// Retrieves the [DialogThemeData] for dialogs.
  DialogThemeData get dialogTheme => Theme.of(this).dialogTheme;

  /// Retrieves the [DividerThemeData] for dividers.
  DividerThemeData get dividerTheme => Theme.of(this).dividerTheme;

  /// Retrieves the [DrawerThemeData] for drawers.
  DrawerThemeData get drawerTheme => Theme.of(this).drawerTheme;

  /// Retrieves the [DropdownMenuThemeData] for dropdown menus.
  DropdownMenuThemeData get dropdownMenuTheme =>
      Theme.of(this).dropdownMenuTheme;

  /// Retrieves the [ElevatedButtonThemeData] for elevated buttons.
  ElevatedButtonThemeData get elevatedButtonTheme =>
      Theme.of(this).elevatedButtonTheme;

  /// Retrieves the [ExpansionTileThemeData] for expansion tiles.
  ExpansionTileThemeData get expansionTileTheme =>
      Theme.of(this).expansionTileTheme;

  /// Retrieves the [FilledButtonThemeData] for filled buttons.
  FilledButtonThemeData get filledButtonTheme =>
      Theme.of(this).filledButtonTheme;

  /// Retrieves the [FloatingActionButtonThemeData] for floating action buttons.
  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      Theme.of(this).floatingActionButtonTheme;

  /// Retrieves the [IconButtonThemeData] for icon buttons.
  IconButtonThemeData get iconButtonTheme => Theme.of(this).iconButtonTheme;

  /// Retrieves the [ListTileThemeData] for list tiles.
  ListTileThemeData get listTileTheme => Theme.of(this).listTileTheme;

  /// Retrieves the [MenuBarThemeData] for menu bars.
  MenuBarThemeData get menuBarTheme => Theme.of(this).menuBarTheme;

  /// Retrieves the [MenuButtonThemeData] for menu buttons.
  MenuButtonThemeData get menuButtonTheme => Theme.of(this).menuButtonTheme;

  /// Retrieves the [MenuThemeData] for menus.
  MenuThemeData get menuTheme => Theme.of(this).menuTheme;

  /// Retrieves the [NavigationBarThemeData] for navigation bars.
  NavigationBarThemeData get navigationBarTheme =>
      Theme.of(this).navigationBarTheme;

  /// Retrieves the [NavigationDrawerThemeData] for navigation drawers.
  NavigationDrawerThemeData get navigationDrawerTheme =>
      Theme.of(this).navigationDrawerTheme;

  /// Retrieves the [NavigationRailThemeData] for navigation rails.
  NavigationRailThemeData get navigationRailTheme =>
      Theme.of(this).navigationRailTheme;

  /// Retrieves the [OutlinedButtonThemeData] for outlined buttons.
  OutlinedButtonThemeData get outlinedButtonTheme =>
      Theme.of(this).outlinedButtonTheme;

  /// Retrieves the [PopupMenuThemeData] for popup menus.
  PopupMenuThemeData get popupMenuTheme => Theme.of(this).popupMenuTheme;

  /// Retrieves the [ProgressIndicatorThemeData] for progress indicators.
  ProgressIndicatorThemeData get progressIndicatorTheme =>
      Theme.of(this).progressIndicatorTheme;

  /// Retrieves the [RadioThemeData] for radio buttons.
  RadioThemeData get radioTheme => Theme.of(this).radioTheme;

  /// Retrieves the [SearchBarThemeData] for search bars.
  SearchBarThemeData get searchBarTheme => Theme.of(this).searchBarTheme;

  /// Retrieves the [SearchViewThemeData] for search views.
  SearchViewThemeData get searchViewTheme => Theme.of(this).searchViewTheme;

  /// Retrieves the [SegmentedButtonThemeData] for segmented buttons.
  SegmentedButtonThemeData get segmentedButtonTheme =>
      Theme.of(this).segmentedButtonTheme;

  /// Retrieves the [SliderThemeData] for sliders.
  SliderThemeData get sliderTheme => Theme.of(this).sliderTheme;

  /// Retrieves the [SnackBarThemeData] for snack bars.
  SnackBarThemeData get snackBarTheme => Theme.of(this).snackBarTheme;

  /// Retrieves the [SwitchThemeData] for switches.
  SwitchThemeData get switchTheme => Theme.of(this).switchTheme;

  /// Retrieves the [TextButtonThemeData] for text buttons.
  TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;

  /// Retrieves the [TextSelectionThemeData] for text selection.
  TextSelectionThemeData get textSelectionTheme =>
      Theme.of(this).textSelectionTheme;

  /// Retrieves the [TimePickerThemeData] for time pickers.
  TimePickerThemeData get timePickerTheme => Theme.of(this).timePickerTheme;

  /// Retrieves the [ToggleButtonsThemeData] for toggle buttons.
  ToggleButtonsThemeData get toggleButtonsTheme =>
      Theme.of(this).toggleButtonsTheme;

  /// Retrieves the [TooltipThemeData] for tooltips.
  TooltipThemeData get tooltipTheme => Theme.of(this).tooltipTheme;

  /// Retrieves the primary [IconThemeData] for this theme.
  IconThemeData get primaryIconTheme => Theme.of(this).primaryIconTheme;
}

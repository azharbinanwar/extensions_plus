### 1.5.0

- **Breaking Changes:**
    - **Navigation Extensions:** Renamed navigation methods to avoid conflicts with popular packages like `go_router`.
        - `push()` → `pushPlus()`
        - `pop()` → `goBack()`
        - `popUntil()` → `goBackUntil()`
        - `canPop` → `canGoBack`
        - `popUntilFirst()` → `goBackToFirst()`
        - `popWithData()` → `goBackWithData()`
        - `popTimes()` → `goBackTimes()`
    - **List Extensions:** Renamed list methods to avoid conflicts with the `collection` package.
        - `firstWhereOrNull()` → `findFirst()`
        - `elementAtOrNull()` → `getAt()`
    - **Iterable Extensions:** Renamed iterable methods to avoid conflicts with the `collection` package.
        - `firstWhereOrNull()` → `findFirst()`
        - `elementAtOrNull()` → `getAt()`

- **Migration Guide:**
    - Update all `context.push()` calls to `context.pushPlus()`
    - Update all `context.pop()` calls to `context.goBack()`
    - Update all `list.firstWhereOrNull()` calls to `list.findFirst()`
    - Update all `list.elementAtOrNull()` calls to `list.getAt()`
    - Update all `iterable.firstWhereOrNull()` calls to `iterable.findFirst()`
    - Update all `iterable.elementAtOrNull()` calls to `iterable.getAt()`
    - Update other navigation methods accordingly

- **Documentation:**
    - Updated README with new method names and examples
    - Added migration guide for users upgrading from v1.4.x
    - Updated all code examples throughout documentation

- **Reason for Changes:**
    - Resolves **all conflicts** with popular packages (`go_router`, `collection`)
    - Allows developers to use multiple packages together without import conflicts
    - Maintains all existing functionality with new, conflict-free naming
    - Package now works seamlessly alongside the most popular Flutter routing and utility packages


### 1.4.3

- **SDK Updates:**
    - Updated SDK constraint to `^3.8.0` for Dart 3.8.1 compatibility.
    - Updated `flutter_lints` to `^6.0.0`.

- **Bug Fixes:**
    - Fixed `responsiveConstrains` in `WidgetExtension` by explicitly typing `alignment`.
    - Corrected `indicatorColor` getter in `BuildContextTheme` to use `tabBarTheme.indicatorColor`.
    - Replaced deprecated `CardTheme` with `CardThemeData` in `BuildContextTheme`.

- **Code Improvements:**
    - Updated unused parameter syntax from `__` to `_` for Dart 3.8.1 compatibility.
    - Removed unused variables in `OverlayUtilitiesBuildContext` and `WidgetExtension`.


### 1.4.2

- **Text Extensions:**
    - Renamed `align` → `textAlign` for better clarity.
    - Renamed `decoration` → `textDecoration` to avoid conflict with widget extension.


### 1.4.1

- **Removed:**
    - `dialogBackgroundColor` extension method from `BuildContext`.

- **Reason for Removal:**
    - The property `Theme.of(context).dialogBackgroundColor` has been **deprecated** in Flutter.
      3.29.0 || Dart 3.7.0

### 1.4.0

- **Text Extensions:**
    - Renamed `align` → `textAlign` for better clarity.
    - Renamed `decoration` → `textDecoration` to avoid conflict with widget extension.

- **Screen Breakpoints:**
    - Removed `isSmallTablet` and `isSmallDesktop` to simplify screen size logic.
    - Updated `responsivePadding` method to match new breakpoints.

- **Dart Version Upgrade:**
    - Upgraded minimum Dart SDK version to `3.7.0` for improved performance and stability.

### 1.3.0

- **Features**
  - Added comprehensive UI demo for TextStyle extension
  - Enhanced documentation with practical examples
  - Expanded text style manipulation methods

- **Changes**
    - Refactored text style extension methods
    - Improved text style chaining for better readability
    - Updated text style demo with more examples

### 1.2.0

- **Added**
    - Comprehensive text styling extensions with Material Design support:
        - Theme-based text styles (headline, title, body, label variants)
        - Chainable styling methods for Text widgets
        - Advanced text customization (withStyle, withTextProperties)
    - New date formatting capabilities:
        - String extension method `format()` with locale support
        - Qualified imports for intl package to prevent conflicts

- **Changed**
    - Simplified responsive layout system:
        - Consolidated desktop breakpoints for cleaner responsive design
        - Updated isDesktop to cover broader range (>768px)
        - Maintained isTablet (600-768px) and isLargeDesktop (>1440px) checks
    - Enhanced text styling architecture:
        - Improved null safety in text style extensions
        - Better type handling for theme-based styles
        - Organized text properties into logical groups

- **Removed**
    - isSmallDesktop breakpoint (768-1024px range)
    - Legacy desktop-specific string extensions

### 1.1.0

- **Added**
    - Complete Material Design theme property support in `BuildContextTheme` including:
        - General Configuration (platform, visual density, adaptations, extensions, input
          decoration, page transitions, scrollbar theme, tap target size, splash factory)
        - Color System (canvas, dialog, disabled, divider, focus, highlight, hint, hover, indicator,
          shadow, splash, unselected widget colors)
        - Component Themes (app bar, navigation, buttons, forms, menus, selection, progress
          indicators, search, tooltips)

- **Changed**
    - Restructured extension files to use the main library file for parts
    - Removed deprecated theme properties
    - Organized theme properties into logical groupings
    - **Refactor**: Removed `?` from non-nullable theme variables for better type safety and
      consistency.

- **Breaking Changes**
    - Extension files now use `part of` with the main library file
    - Removed support for deprecated theme properties

### 1.0.0

- **Features**
    - Introduced a comprehensive set of Dart extensions to simplify development:
        - **Widget Extension**: Utilities for UI-related tasks.
        - **String Extension**: Enhanced string manipulation methods.
        - **num, List, and Map Extensions**: Added powerful utility functions for numbers, lists,
          and maps.
        - **DateTime Extension**: Simplified operations for date and time handling.
        - **Color Extension**: Convenient utilities for color manipulation.
        - **BuildContext Extension**: Streamlined access to Flutter context.
        - **Route Extension**: Simplified navigation in Flutter apps.
    - Added a complete example project to demonstrate the use of all extensions.

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
        - General Configuration (platform, visual density, adaptations, extensions, input decoration, page transitions, scrollbar theme, tap target size, splash factory)
        - Color System (canvas, dialog, disabled, divider, focus, highlight, hint, hover, indicator, shadow, splash, unselected widget colors)
        - Component Themes (app bar, navigation, buttons, forms, menus, selection, progress indicators, search, tooltips)

- **Changed**
    - Restructured extension files to use the main library file for parts
    - Removed deprecated theme properties
    - Organized theme properties into logical groupings
    - **Refactor**: Removed `?` from non-nullable theme variables for better type safety and consistency.

- **Breaking Changes**
    - Extension files now use `part of` with the main library file
    - Removed support for deprecated theme properties


### 1.0.0
- **Features**
    - Introduced a comprehensive set of Dart extensions to simplify development:
        - **Widget Extension**: Utilities for UI-related tasks.
        - **String Extension**: Enhanced string manipulation methods.
        - **num, List, and Map Extensions**: Added powerful utility functions for numbers, lists, and maps.
        - **DateTime Extension**: Simplified operations for date and time handling.
        - **Color Extension**: Convenient utilities for color manipulation.
        - **BuildContext Extension**: Streamlined access to Flutter context.
        - **Route Extension**: Simplified navigation in Flutter apps.
    - Added a complete example project to demonstrate the use of all extensions.

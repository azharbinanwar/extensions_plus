# extensions_plus

**extensions_plus** is a comprehensive Dart package designed to enhance developer productivity through powerful extensions. It provides an extensive collection of utility methods for common data types:

- **BuildContext Extensions**: Simplify access to themes, navigation, and device configurations
- **String Extensions**: Enhance text manipulation and validation capabilities
- **Numeric Extensions**: Add mathematical and formatting utilities
- **Collection Extensions**: Provide advanced operations for Iterables, Lists and Maps
- **DateTime Extensions**: Improve date and time handling
- **Widget Extensions**: Streamline UI development with chainable methods
- **Color Extensions**: Enable sophisticated color manipulation

The package promotes clean, maintainable code through its modular design and intuitive API. Whether you're building a simple app or a complex application, extensions_plus helps reduce boilerplate code and improve code readability.

---
## Table of Contents

- [Features](#features)
    - [Powerful Extensions](#-powerful-extensions)
    - [Productivity Boost](#-productivity-boost)
- [Installation](#installation)
- [Extensions](#extensions)
    - [Device Context Extensions](#device-context-extensions)
    - [Easy Extensions](#easy-navigation)
    - [Theme](#theme)
    - [DateTime Extensions](#datetime-extensions)
    - [Widget Extensions](#widget-extensions)
    - [Collections](#collections)
        - [Iterable Extensions](#extensions-methods-for-iterablet)
        - [List Extensions](#extensions-methods-for-listt)
        - [Map Opertations](#map-opertations)
    - [Color Extensions](#color-extensions)
    - [Strings](#strings)
    - [Numeric Extensions](#numeric-extensions-simplified-numeric-operations)
---

## Features

### ✨ Powerful Extensions

- **String**: Includes utilities for capitalization, validation, Base64 encoding/decoding, pattern
  matching, and more.
- **BuildContext**: Simplifies access to theming, navigation, and device-specific configurations.
- **Num**: Offers mathematical and formatting helpers.
- **Widget**: Enhances UI building with reusable and flexible methods.

### 🚀 Productivity Boost

- Reduce boilerplate code.
- Improve readability and maintainability.
- Write code faster with prebuilt utilities.

## Installation

1. Add `extensions_plus` to your `pubspec.yaml`:

   ```yaml
   dependencies:
     extensions_plus: ^latest_version
   ```

2. Run `flutter pub get` to install the package.

3. Import the package in your project:

   ```dart
   import 'package:extensions_plus/extensions_plus.dart';
   ```
## Extensions
## Device Context Extensions

The `DeviceContextExtension` on `BuildContext` provides a comprehensive set of utilities for responsive design and device information. These extensions help streamline development by offering methods to easily determine device characteristics, screen dimensions, and breakpoints in Flutter applications.

### Features

- **Responsive Breakpoints**: Predefined constants for common screen size categories:
    - Mobile: `<= 480.0`
    - Small Tablet: `> 480.0` and `<= 600.0`
    - Tablet: `> 600.0` and `<= 768.0`
    - Desktop: `> 768.0`
    - Large Desktop: `> 1440.0`

- **Media Query Utilities**:
    - Access screen width, height, and orientation.
    - Determine device pixel ratio and check for notches or cutouts.

- **Responsive Helpers**:
    - Automatically calculate responsive column counts based on screen width.
    - Provide adaptive padding for different screen sizes.

- **Convenient Access**:
    - Retrieve media query data, status bar height, and device padding directly from the context.

### Example Usage

#### Determine Screen Type
```dart
if (context.isMobile) {
  print("This is a mobile device.");
} else if (context.isTablet) {
  print("This is a tablet device.");
}
```

#### Responsive Columns

```dart

int columns = context.responsiveColumns(baseWidth: 300.0);
print("Number of columns: $columns");
```

#### Adaptive Padding

```dart
Padding(
   padding: context.responsivePadding,
   child: Text("Responsive padding example"
   ),
);
```

#### Check for Notch

```dart
if (context.hasNotch) {
   print("This device has a notch.");
}
```

Use `DeviceContextExtension` to simplify responsive design and device-specific logic in your Flutter
applications!


# Easy Navigation

The `NavigationExtension` enhances the `BuildContext` in Flutter, providing a rich set of navigation utilities to simplify routing tasks. Designed for flexibility, it supports common navigation patterns, custom transitions, and more.

## Features

- **Shorthand Access**
  - Quickly access the current `NavigatorState` using `context.navigator`.

- **Flexible Navigation**
  - Push new routes with full control over `MaterialPageRoute` properties using `context.pushPlus()` or `context.pushAndRemoveUntil()`.

- **Custom Transitions**
  - Smooth fade transitions with `context.pushWithFade()`.
  - Directional slide transitions with `context.pushWithSlide()`.

- **Route Management**
  - Remove specific or multiple routes using `context.goBackToFirst()` and `context.goBackTimes()`.
  - Check if a specific route exists with `context.hasRoute()`.

- **State Passing**
  - Pass and retrieve data between routes using `context.goBackWithData()`.

## Usage Examples

### Push a New Route
```dart
context.pushPlus(
  HomePage(),
  fullscreenDialog: true,
  settings: RouteSettings(name: '/home'),
);
```

### Push and Remove Until a Specific Route
```dart
context.pushAndRemoveUntil(
  HomePage(),
  (route) => route.settings.name == '/login',
);
```

### Push with a Fade Transition

```dart
context.pushWithFade(
   HomePage(), 
   duration: Duration(milliseconds: 500),
);
```

### Push with a Slide Transition

```dart
context.pushWithSlide(
   HomePage(),
   begin: Offset(0.0, 1.0), // Slide from bottom to top
);
```

### Go Back with Data

```dart
context.goBackWithData({'result': 'success'});
```

### Check if a Route Exists

```dart
if (context.hasRoute('/home')) {
   print('Route exists');
}
```

### Go Back Multiple Routes

```dart
context.goBackTimes(2); // Goes back two routes
```

### Simple Navigation
```dart
context.goBack(); // Simple go back
context.goBack('result'); // Go back with result

// Check if can go back
if (context.canGoBack) {
  context.goBack();
}
```

## Migration from v1.4.x to v1.5.0

If you're upgrading from a previous version, update your method calls:

```dart
// Old (v1.4.x)           →  New (v1.5.0)
context.push()            →  context.pushPlus()
context.pop()             →  context.goBack()
context.popWithData()     →  context.goBackWithData()
context.popTimes()        →  context.goBackTimes()
context.canPop            →  context.canGoBack
```

## Why Use NavigationExtension?

- **Conflict-free**: Works alongside popular packages like `go_router` without import conflicts.
- **Intuitive naming**: Clear, descriptive method names that express intent.
- **Simplifies navigation**: Reduces boilerplate code for custom transitions and complex navigation flows.
- **Enhanced readability**: Consistent API that improves code maintainability.

**Note:** This extension is designed to work seamlessly with `Navigator` in Flutter and supports both material and custom page transitions. All navigation methods are prefixed to avoid conflicts with other popular routing packages.

---

# Theme

This extensions enhances the `BuildContext` in Flutter by providing easy access to commonly used theme-related properties, such as text styles, colors, and theme data.

## Features

- **Text Styles**: Direct access to text styles like `displayLarge`, `headlineMedium`, `titleSmall`, etc., from the current theme.
- **Colors**: Retrieve colors from the `ColorScheme`, including `primary`, `secondary`, `tertiary`, `surface`, and `error` colors.
- **Theme Data**: Access the `ThemeData`, `IconThemeData`, and `AppBarTheme` for more customization.
- **Convenience**: Simplifies code by removing repetitive calls to `Theme.of(context)`.

---



## Usage

### Text Styles

Access text styles directly:

```dart
Text(
  'Hello, World!',
  style: context.titleLarge,
);
```

### Primary Colors

Retrieve primary colors from the `ColorScheme`:

```dart
Container(
  color: context.primary,
);
```

### AppBar Theme

Use the `AppBarTheme` properties easily:

```dart
AppBar(
  backgroundColor: context.appBarColor,
);
```


## API Reference

### Text Styles

| Getter           | Description                          |
|------------------|--------------------------------------|
| `displayLarge`   | Returns `displayLarge` text style.   |
| `displayMedium`  | Returns `displayMedium` text style.  |
| `displaySmall`   | Returns `displaySmall` text style.   |
| `headlineLarge`  | Returns `headlineLarge` text style.  |
| `headlineMedium` | Returns `headlineMedium` text style. |
| `headlineSmall`  | Returns `headlineSmall` text style.  |
| `titleLarge`     | Returns `titleLarge` text style.     |
| `titleMedium`    | Returns `titleMedium` text style.    |
| `titleSmall`     | Returns `titleSmall` text style.     |
| `bodyLarge`      | Returns `bodyLarge` text style.      |
| `bodyMedium`     | Returns `bodyMedium` text style.     |
| `bodySmall`      | Returns `bodySmall` text style.      |
| `labelLarge`     | Returns `labelLarge` text style.     |
| `labelMedium`    | Returns `labelMedium` text style.    |
| `labelSmall`     | Returns `labelSmall` text style.     |

### Colors

| Getter                   | Description                         |
|--------------------------|-------------------------------------|
| `primary`                | Primary color.                     |
| `onPrimary`              | On-primary color.                  |
| `primaryContainer`       | Primary container color.           |
| `onPrimaryContainer`     | On-primary container color.        |
| `primaryFixed`           | Primary fixed color.               |
| `primaryFixedDim`        | Primary fixed dim color.           |
| `onPrimaryFixed`         | On-primary fixed color.            |
| `onPrimaryFixedVariant`  | On-primary fixed variant color.    |
| `secondary`              | Secondary color.                   |
| `onSecondary`            | On-secondary color.                |
| `secondaryContainer`     | Secondary container color.         |
| `onSecondaryContainer`   | On-secondary container color.      |
| `secondaryFixed`         | Secondary fixed color.             |
| `secondaryFixedDim`      | Secondary fixed dim color.         |
| `onSecondaryFixed`       | On-secondary fixed color.          |
| `onSecondaryFixedVariant`| On-secondary fixed variant color.  |
| `tertiary`               | Tertiary color.                    |
| `onTertiary`             | On-tertiary color.                 |
| `tertiaryContainer`      | Tertiary container color.          |
| `onTertiaryContainer`    | On-tertiary container color.       |
| `tertiaryFixed`          | Tertiary fixed color.              |
| `tertiaryFixedDim`       | Tertiary fixed dim color.          |
| `onTertiaryFixed`        | On-tertiary fixed color.           |
| `onTertiaryFixedVariant` | On-tertiary fixed variant color.   |
| `error`                  | Error color.                       |
| `onError`                | On-error color.                    |
| `errorContainer`         | Error container color.             |
| `onErrorContainer`       | On-error container color.         |
| `surface`                | Surface color.                     |
| `onSurface`              | On-surface color.                  |
| `surfaceDim`             | Surface dim color.                 |
| `surfaceBright`          | Surface bright color.              |
| `surfaceContainerLowest` | Surface container lowest color.    |
| `surfaceContainerLow`    | Surface container low color.       |
| `surfaceContainer`       | Surface container color.           |
| `surfaceContainerHigh`   | Surface container high color.      |
| `surfaceContainerHighest`| Surface container highest color.   |
| `onSurfaceVariant`       | On-surface variant color.          |
| `outline`                | Outline color.                     |
| `outlineVariant`         | Outline variant color.             |
| `shadow`                 | Shadow color.                      |
| `scrim`                  | Scrim color.                       |
| `inverseSurface`         | Inverse surface color.             |
| `onInverseSurface`       | On-inverse surface color.          |
| `inversePrimary`         | Inverse primary color.             |
| `surfaceTint`            | Surface tint color.                |

### Theme Utilities

| Getter                        | Description                                   |
|-------------------------------|-----------------------------------------------|
| `theme`                        | Returns the current `ThemeData`.              |
| `iconTheme`                    | Returns the `IconThemeData`.                  |
| `brightness`                   | Returns the `Brightness` (light/dark theme).  |
| `appBarTheme`                  | Returns the `AppBarTheme`.                    |
| `appBarColor`                  | Returns the background color of the `AppBar`. |
| `bottomNavigationBarTheme`     | Returns the `BottomNavigationBarThemeData`.   |


## Benefits
Here’s a brief comparison of using custom `BuildContext` extensions versus the longer `Theme.of(context)` calls:

**1. Text Styles**:
- **Shortened (`context.displayLarge`)**: Cleaner and more readable for quick access to common text styles like titles or body text.
- **Longer (`Theme.of(context).textTheme.displayLarge`)**: Offers more flexibility if you need access to a variety of theme properties or need to make adjustments.

**2. Colors**:
- **Shortened (`context.primary`)**: Easier to use for accessing commonly used colors like the primary color.
- **Longer (`Theme.of(context).colorScheme.primary`)**: Provides more explicit control when working with multiple colors or complex theme data.

**3. AppBar Theme**:
- **Shortened (`context.appBarColor`)**: Convenient for accessing the AppBar color quickly across the app.
- **Longer (`Theme.of(context).appBarTheme.backgroundColor`)**: Offers greater flexibility if you need to tweak other properties of the AppBar.

**4. Icon Theme**:
- **Shortened (`context.iconColor`)**: Quick and easy way to access icon colors without needing the full `Theme.of(context)` call.
- **Longer (`Theme.of(context).iconTheme.color`)**: More control if you need to manage other icon properties beyond color.

In general, using **shortened methods** is **quicker and more readable**, while **longer methods** provide **more control** when you need flexibility or explicit access to a range of theme properties.


## Example

```dart
import 'package:flutter/material.dart';
import 'package:extensions_plus/extensions_plus.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example', style: context.titleLarge),
        backgroundColor: context.appBarColor,
      ),
      body: Center(
        child: Text(
          'Hello, Flutter!',
          style: context.displayMedium,
        ),
      ),
    );
  }
}
```

Enjoy simplified theme management in your Flutter projects!

Here's an improved version of your README with more engaging examples that better showcase the capabilities of your string extensions functions:

---


## DateTime Extensions

Extensions methods for `DateTime` that provide convenient utilities for working with dates and times.

#### `format({String format = 'dd-MM-yyyy', String? locale})`

Formats a `DateTime` object into a string using a custom pattern and optional locale.

- **Parameters:**
    - `format`: The date format pattern (default: `'dd-MM-yyyy'`).
    - `locale`: Optional locale for formatting.

- **Returns:**
    - A formatted date string.

**Example:**
```dart
DateTime.now().format(format: 'yyyy-MM-dd'); // "2025-01-28"
```

#### `isToday`

Checks if the date is today.

- **Returns:**
    - `true` if the date is today.

**Example:**
```dart
DateTime.now().isToday; // true
```

#### `isTomorrow`

Checks if the date is tomorrow.

- **Returns:**
    - `true` if the date is tomorrow.

**Example:**
```dart
DateTime.now().add(Duration(days: 1)).isTomorrow; // true
```

#### `isYesterday`

Checks if the date is yesterday.

- **Returns:**
    - `true` if the date is yesterday.

**Example:**
```dart
DateTime.now().subtract(Duration(days: 1)).isYesterday; // true
```

#### `isSameDay(DateTime? time)`

Checks if two dates are on the same day.

- **Parameters:**
    - `time`: The date to compare.

- **Returns:**
    - `true` if the dates are on the same day.

**Example:**
```dart
DateTime.now().isSameDay(DateTime.now()); // true
```

#### `isSameMonth(DateTime? time)`

Checks if two dates are in the same month.

- **Parameters:**
    - `time`: The date to compare.

- **Returns:**
    - `true` if the dates are in the same month.

**Example:**
```dart
DateTime.now().isSameMonth(DateTime.now().subtract(Duration(days: 5))); // true
```

#### `timeAgo()`

Calculates a human-readable time difference between the current date and time.

- **Returns:**
    - A string representing the time difference (e.g., "2 h", "3 d", "1 w").

**Example:**
```dart
DateTime.now().subtract(Duration(hours: 5)).timeAgo(); // "5 h ago"
```

#### `startOfDay`

Gets the start of the day for the current `DateTime` object.

- **Returns:**
    - A `DateTime` object representing the start of the day (00:00:00).

**Example:**
```dart
DateTime.now().startOfDay; // 2025-01-28 00:00:00
```

#### `endOfDay`

Gets the end of the day for the current `DateTime` object.

- **Returns:**
    - A `DateTime` object representing the end of the day (23:59:59.999).

**Example:**
```dart
DateTime.now().endOfDay; // 2025-01-28 23:59:59.999
```

#### `isPast`

Checks if the date is in the past.

- **Returns:**
    - `true` if the date is in the past.

**Example:**
```dart
DateTime.now().subtract(Duration(days: 1)).isPast; // true
```

#### `isFuture`

Checks if the date is in the future.

- **Returns:**
    - `true` if the date is in the future.

**Example:**
```dart
DateTime.now().add(Duration(days: 1)).isFuture; // true
```

#### `age`

Calculates the age based on the current date.

- **Returns:**
    - The age in years.

**Example:**
```dart
DateTime(1990, 5, 20).age; // 34 (if today's date is 2025-01-28)
```

#### `dayName({String? locale})`

Gets the name of the day of the week for the current `DateTime` object.

- **Parameters:**
    - `locale`: Optional locale for formatting.

- **Returns:**
    - A string representing the name of the day (e.g., "Monday").

**Example:**
```dart
DateTime.now().dayName; // "Monday"
```

#### `monthName({String? locale})`

Gets the name of the month for the current `DateTime` object.

- **Parameters:**
    - `locale`: Optional locale for formatting.

- **Returns:**
    - A string representing the name of the month (e.g., "January").

**Example:**
```dart
DateTime.now().monthName; // "January"
```
----


## Widget Extensions

This extensions adds a set of utility methods to the `Widget` class, making it easier to apply common UI customizations like padding, margin, tap gestures, scrollability, and more in a clean and reusable way.

### Installation

### Key Methods and Usage

#### 1. **Padding & Margin Extensions**

- **`paddingAll`**: Adds equal padding to all sides of the widget.

  ```dart
  Widget myWidget = Text('Hello, World!').paddingAll(16.0);
  ```

- **`paddingOnly`**: Adds custom padding to specific sides of the widget.

  ```dart
  Widget myWidget = Text('Hello, World!').paddingOnly(top: 8.0, left: 16.0);
  ```

- **`marginAll`**: Adds equal margin to all sides of the widget.

  ```dart
  Widget myWidget = Text('Hello, World!').marginAll(16.0);
  ```

- **`marginSymmetric`**: Adds symmetric margin horizontally and vertically.

  ```dart
  Widget myWidget = Text('Hello, World!').marginSymmetric(horizontal: 16.0, vertical: 8.0);
  ```

#### 2. **Gesture Detection**

- **`onTap`**: Adds a tap gesture detector to the widget.

  ```dart
  Widget myWidget = Text('Tap me!').onTap(() {
    print('Widget tapped!');
  });
  ```

#### 3. **Alignment & Centering**

- **`center`**: Centers the widget inside a `Center`.

  ```dart
  Widget myWidget = Text('Centered!').center();
  ```

- **`align`**: Aligns the widget using a custom alignment.

  ```dart
  Widget myWidget = Text('Aligned!').align(Alignment.topRight);
  ```

- **`expanded`**: Expands the widget within a flexible layout.

  ```dart
  Widget myWidget = Text('Expanding!').expanded();
  ```

#### 4. **Visibility & Opacity**

- **`visibility`**: Toggles the visibility of the widget.

  ```dart
  Widget myWidget = Text('Invisible!').visibility(visible: false);
  ```

- **`opacity`**: Applies opacity to the widget.

  ```dart
  Widget myWidget = Text('Faded!').opacity(0.5);
  ```

#### 5. **Scrollability**

- **`toScrollableList`**: Converts the widget into a scrollable list.

  ```dart
  Widget myWidget = Text('Item').toScrollableList(itemCount: 5);
  ```

- **`scrollable`**: Makes the widget scrollable with custom padding and scroll direction.

  ```dart
  Widget myWidget = Column(
    children: List.generate(10, (index) => Text('Item $index')),
  ).scrollable(padding: EdgeInsets.all(16.0));
  ```

#### 6. **Styling**

- **`background`**: Sets the background color of the widget.

  ```dart
  Widget myWidget = Text('With Background').background(Colors.blue);
  ```

- **`elevation`**: Adds elevation and shadow effects.

  ```dart
  Widget myWidget = Text('Elevated').elevation(elevation: 8.0);
  ```

- **`circular`**: Clips the widget with a circular border radius.

  ```dart
  Widget myWidget = Image.asset('image.png').circular(16.0);
  ```

- **`ripple`**: Adds a tap ripple effect with customizable splash and highlight colors.

  ```dart
  Widget myWidget = Text('Ripple Effect').ripple(splashColor: Colors.blue);
  ```

#### 7. **System UI & Layout**

- **`annotateRegion`**: Customizes the system UI overlays, like the status bar.

  ```dart
  Widget myWidget = Text('Annotated Region').annotateRegion(
    context,
    statusBarColor: Colors.red,
  );
  ```

- **`constrains`**: Adds constraints (like min/max size) to the widget.

  ```dart
  Widget myWidget = Text('Constrained').constrains(minWidth: 100.0);
  ```


```dart
Widget example = Column(
  children: [
    Text('Hello, World!')
        .paddingAll(16.0)
        .background(Colors.amber)
        .elevation(elevation: 4.0),
    Icon(Icons.star)
        .onTap(() => print('Star tapped!'))
        .circular(50.0),
    Text('Scrollable List')
        .toScrollableList(itemCount: 10),
  ],
).safeArea();
```

### Benefits

With these utility methods, you can make your Flutter widgets more customizable and readable, reducing the amount of repetitive code for common UI tasks. These methods also help maintain a clean, modular codebase.

----

## Collections
## Extensions Methods for `Iterable<T>`

The `IterableExtension<T>` adds several useful utility functions for working with iterables, enabling enhanced data manipulation and processing in Dart. Below are the key methods provided:

### 1. **`groupBy<K>`**
Groups the elements of the iterable by a specified key derived from each element.
- Example:
  ```dart
  final users = [
    {'name': 'John', 'age': 25},
    {'name': 'Jane', 'age': 25}
  ];
  final byAge = users.groupBy((user) => user['age']);
  ```
- Result: `{25: [{'name': 'John', 'age': 25}, {'name': 'Jane', 'age': 25}]}`

### 2. **`distinctBy<K>`**
Returns distinct elements based on a key function, ensuring that only unique values are kept.
- Example:
  ```dart
  final users = [
    {'id': 1, 'name': 'John'},
    {'id': 1, 'name': 'John Updated'}
  ];
  final unique = users.distinctBy((user) => user['id']);
  ```
- Result: `[{ 'id': 1, 'name': 'John' }]`

### 3. **`chunk(int size)`**
Splits the iterable into chunks of a specified size.
- Example:
  ```dart
  [1, 2, 3, 4, 5].chunk(2)
  ```
- Result: `[[1, 2], [3, 4], [5]]`

### 4. **`elementAtOrNull(int index)`**
Returns the element at the specified index, or `null` if the index is out of bounds.
- Example:
  ```dart
  [1, 2, 3].elementAtOrNull(5) // null
  ```

### 5. **`firstWhereOrNull(bool Function(T) test)`**
Returns the first element matching the provided predicate, or `null` if no match is found.
- Example:
  ```dart
  [1, 2, 3].firstWhereOrNull((e) => e > 5) // null
  ```

### 6. **`toIndexMap()`**
Converts the iterable into a map, where each element is indexed.
- Example:
  ```dart
  ['a', 'b', 'c'].toIndexMap()
  ```
- Result: `{0: 'a', 1: 'b', 2: 'c'}`

### 7. **`enumerate()`**
Returns an iterable of index-value pairs.
- Example:
  ```dart
  ['a', 'b'].enumerate() 
  ```
- Result: `[(0, 'a'), (1, 'b')]`

### 8. **`sum([num Function(T)? selector])`**
Calculates the sum of the elements or a transformation of the elements.
- Example:
  ```dart
  [1, 2, 3].sum() // 6
  ```

### 9. **`average([num Function(T)? selector])`**
Calculates the average of the elements or a transformation of the elements.
- Example:
  ```dart
  [1, 2, 3].average() // 2.0
  ```

### 10. **`partition(bool Function(T) predicate)`**
Splits the iterable into two lists based on a predicate.
- Example:
  ```dart
  final numbers = [1, 2, 3, 4, 5];
  final (evens, odds) = numbers.partition((n) => n.isEven);
  ```

### 11. **`maxBy<R extends Comparable<R>>(R Function(T) selector)`**
Returns the maximum element based on a comparison function.
- Example:
  ```dart
  ['cat', 'elephant', 'dog'].maxBy((s) => s.length) // 'elephant'
  ```

### 12. **`minBy<R extends Comparable<R>>(R Function(T) selector)`**
Returns the minimum element based on a comparison function.
- Example:
  ```dart
  ['cat', 'elephant', 'dog'].minBy((s) => s.length) // 'cat'
  ```

### 13. **`allEqual()`**
Checks if all elements in the iterable are equal.
- Example:
  ```dart
  [1, 1, 1].allEqual() // true
  ```

These utility functions significantly enhance the way iterables are handled in Dart, making it easier to manipulate data efficiently and effectively.

----

## Extensions Methods for `List<T>`


Extensions methods for `List<T>` that provide utility functions to manipulate and query list data efficiently.

#### `distinctBy<R>(R Function(T) selector)`

Removes duplicate elements in the list based on a selector function.

- **Parameters:**
    - `selector`: A function that determines the uniqueness of elements by returning a key for comparison.

- **Returns:**
    - A new list with distinct elements based on the selected key.

**Example:**
```dart
final users = [
  {'id': 1, 'name': 'John'},
  {'id': 1, 'name': 'John Updated'}
];
final uniqueUsers = users.distinctBy((user) => user['id']);
// Result: [{'id': 1, 'name': 'John'}]
```

#### `firstWhereOrNull(bool Function(T) predicate)`

Returns the first element in the list that matches a given predicate or `null` if no match is found.

- **Parameters:**
    - `predicate`: A function that defines the condition to match.

- **Returns:**
    - The first element that satisfies the condition or `null` if none match.

**Example:**
```dart
final numbers = [1, 2, 3];
final result = numbers.firstWhereOrNull((n) => n > 5);
// Result: null
```

#### `groupBy<R>(R Function(T) selector)`

Groups the elements of the list by a key derived from the selector function.

- **Parameters:**
    - `selector`: A function that extracts the key used to group elements.

- **Returns:**
    - A map where the keys are the group identifiers and the values are lists of elements that belong to each group.

**Example:**
```dart
final users = [
  {'name': 'John', 'age': 25},
  {'name': 'Jane', 'age': 25},
  {'name': 'Tom', 'age': 30}
];
final groupedByAge = users.groupBy((user) => user['age']);
// Result: {25: [{'name': 'John', 'age': 25}, {'name': 'Jane', 'age': 25}], 30: [{'name': 'Tom', 'age': 30}]}
```

#### `partition(bool Function(T) predicate)`

Splits the list into two sublists based on a given predicate.

- **Parameters:**
    - `predicate`: A function that defines the condition to separate elements.

- **Returns:**
    - A list of two lists: the first contains elements that match the predicate, and the second contains those that do not.

**Example:**
```dart
final numbers = [1, 2, 3, 4, 5];
final partitioned = numbers.partition((n) => n.isEven);
// Result: [[2, 4], [1, 3, 5]]
```

#### `chunk(int size)`

Splits the list into chunks of the specified size.

- **Parameters:**
    - `size`: The size of each chunk.

- **Returns:**
    - A list of sublists, each containing a chunk of the original list.

**Example:**
```dart
final numbers = [1, 2, 3, 4, 5];
final chunked = numbers.chunk(2);
// Result: [[1, 2], [3, 4], [5]]
```

#### `elementAtOrNull(int index)`

Safely retrieves the element at the specified index, returning `null` if the index is out of bounds.

- **Parameters:**
    - `index`: The index of the element to retrieve.

- **Returns:**
    - The element at the specified index or `null` if the index is invalid.

**Example:**
```dart
final numbers = [1, 2, 3];
final element = numbers.elementAtOrNull(5);
// Result: null
```

#### `shuffled()`

Returns a new list with the elements shuffled randomly.

- **Returns:**
    - A new list with the elements in random order.

**Example:**
```dart
final numbers = [1, 2, 3, 4, 5];
final shuffledNumbers = numbers.shuffled();
// Result: [3, 1, 4, 5, 2] (order may vary)
```
----

### Map Opertations

Extensions methods for `Map<K, V>` that provide utility functions to manipulate and query map data efficiently.

#### `groupByMultiple(List<dynamic> Function(V) keySelector)`

Groups the values in the map by multiple keys.

- **Parameters:**
    - `keySelector`: A function that takes an individual value and returns a list of keys to group that value by.

- **Returns:**
    - A map where the keys are string representations of the provided keys, and the values are lists of elements grouped by those keys.

**Example:**
```dart
final data = [
  {'name': 'John', 'age': 30, 'city': 'New York'},
  {'name': 'Jane', 'age': 25, 'city': 'London'},
  {'name': 'Bob', 'age': 35, 'city': 'New York'}
];
final groupedData = data.asMap().groupByMultiple((item) => [item['city'], item['age']]);
// Result: {
//   'New York': [
//     {'name': 'John', 'age': 30, 'city': 'New York'},
//     {'name': 'Bob', 'age': 35, 'city': 'New York'}
//   ],
//   'London': [
//     {'name': 'Jane', 'age': 25, 'city': 'London'}
//   ]
// }
```

#### `updateNested(List<dynamic> path, V Function(V?) update)`

Updates a nested value in the map.

- **Parameters:**
    - `path`: A list of keys that descend into the nested structure.
    - `update`: A function that takes the current value at the end of the path and returns the new value.

- **Returns:**
    - A new map with the nested value updated.

**Example:**
```dart
final data = {
  'user': {
    'name': 'John',
    'address': {
      'city': 'New York',
      'state': 'NY'
    }
  }
};
final updatedData = data.updateNested(['user', 'address', 'city'], (city) => 'Los Angeles');
// Result: {
//   'user': {
//     'name': 'John',
//     'address': {
//       'city': 'Los Angeles',
//       'state': 'NY'
//     }
//   }
// }
```

#### `toQueryParams()`

Serializes the map to a query parameter string.

- **Returns:**
    - A string representing the map entries as URI encoded query parameters, joined by `=` and `&`.

**Example:**
```dart
final params = {'name': 'John', 'age': 30};
final queryParams = params.toQueryParams();
// Result: 'name=John&age=30'
```
----


## Color Extensions

This extensions provides advanced color manipulation methods to easily adjust and customize colors in your Flutter application. You can darken, lighten, invert, generate shades, and more with simple method calls.


### Key Methods and Usage

#### 1. **Darken and Lighten Colors**

- **`darken([double amount = .1])`**: Darkens the color by reducing its lightness. The `amount` defines the reduction (default is 10%).

  ```dart
  Color darkBlue = Colors.blue.darken(0.2); // Darken by 20%
  ```

- **`lighten([double amount = .1])`**: Lightens the color by increasing its lightness. The `amount` defines the increase (default is 10%).

  ```dart
  Color lightBlue = Colors.blue.lighten(0.2); // Lighten by 20%
  ```

#### 2. **Invert Color**

- **`invert`**: Inverts the color's lightness and saturation while maintaining the hue.

  ```dart
  Color invertedColor = Colors.blue.invert; // Inverted color
  ```

#### 3. **Contrast Color for Text**

- **`onIt`**: Calculates and returns the most contrasting color for text (black or white) based on luminance.

  ```dart
  Color textColor = Colors.blue.onIt; // White text on blue
  ```

#### 4. **Hexadecimal Conversion**

- **`hexWithAlpha`**: Converts the color to a hex string, including the alpha (transparency) channel.

  ```dart
  String hexColor = Colors.blue.hexWithAlpha; // #FF0000FF
  ```

- **`hex`**: Converts the color to a hex string without the alpha channel.

  ```dart
  String hexColor = Colors.blue.hex; // #0000FF
  ```

#### 5. **Adjust Brightness**

- **`brightness(double factor)`**: Adjusts the brightness of the color by multiplying its lightness by the given factor. The result is clamped between 0.0 and 1.0.

  ```dart
  Color brighterBlue = Colors.blue.brightness(1.5); // Increase brightness by 50%
  ```

#### 6. **Adjust Saturation**

- **`saturation(double factor)`**: Modifies the color's saturation by multiplying the current saturation by the given factor.

  ```dart
  Color desaturatedBlue = Colors.blue.saturation(0.5); // Decrease saturation by 50%
  ```

#### 7. **Generate Color Shades**

- **`shades`**: Generates a list of 10 color shades, ranging from very light (50) to very dark (900).

  ```dart
  List<Color> blueShades = Colors.blue.shades; // Generates 10 shades of blue
  ```

- **Convenience Getters for Specific Shades**: You can access specific shades directly.

  ```dart
  Color shade50 = Colors.blue.shade50; // Very light blue
  Color shade100 = Colors.blue.shade100; // Light blue
  Color shade500 = Colors.blue.shade500; // Original blue
  Color shade900 = Colors.blue.shade900; // Very dark blue
  ```

---

### Example Usage

```dart
Widget example = Column(
  children: [
    Container(
      color: Colors.blue.darken(0.2), // Darkened color
      child: Text(
        'Hello!',
        style: TextStyle(color: Colors.blue.onIt), // Contrasting text color
      ),
    ),
    Container(
      color: Colors.blue.lighten(0.3), // Lightened color
      child: Text('This is light blue'),
    ),
    Icon(Icons.star).saturation(0.5), // Desaturated icon color
    Text('Shade 500').background(Colors.blue.shade500), // Background with a specific shade
  ],
);
```

### Benefits

With the `ColorExtension`, you can easily manipulate colors to create dynamic and visually appealing UI elements in your Flutter apps. Adjust the lightness, and saturation, generate multiple shades, and even calculate optimal text colors with just a few method calls.

----


## Strings

The **String Extensions Demo** screen showcases the functionality of custom string extensions implemented in this project. This interactive UI allows users to input a string and apply various transformations or validations to see real-time results.

### Features

- **Extensions Actions**: Several predefined actions are available, such as:
    - Capitalize the first letter.
    - Generate initials from names.
    - Convert to title case.
    - Validate email format.
    - Check if the string is numeric.
    - Reverse the string.
    - Convert to camel case or snake case.
    - Remove whitespaces or special characters.
    - And more...

### How to Use

1. **Input a String**: Enter any string in the provided text field.
2. **Select an Action**: Tap one of the action buttons to apply a specific string extensions.
3. **View Results**: The processed output will appear below the action buttons in real-time.

### Example Usage

- **Input**: `john doe`
    - **Capitalize First Letter**: `John doe`
    - **Generate Initials**: `JD`
    - **To Title Case**: `John Doe`
    - **Reverse String**: `eod nhoj`
    - **To Camel Case**: `johnDoe`
    - **To Snake Case**: `john_doe`
    - **Remove Whitespace**: `johndoe`
    - **Trim Special Characters**: `john doe`
    - **Word Count**: `2`

- **Input**: `flutteR demo_123`
    - **Capitalize First Letter**: `Flutter demo_123`
    - **Generate Initials**: `FD`
    - **To Title Case**: `Flutter Demo_123`
    - **Reverse String**: `321_omed rettulf`
    - **To Camel Case**: `flutterDemo123`
    - **To Snake Case**: `flutter_demo_123`
    - **Remove Whitespace**: `flutterdemo_123`
    - **Trim Special Characters**: `flutter demo123`
    - **Word Count**: `3`

- **Input**: `example@mail.com`
    - **Validate Email**: `true` (valid email format)
    - **To Base64**: `ZXhhbXBsZUBtYWlsLmNvbQ==`
    - **From Base64**: `example@mail.com`

- **Input**: `P@ssw0rd`
    - **Check Password Strength**: `true` (meets criteria for uppercase, lowercase, number, and special characters)

### Purpose

The String Extensions Demo aims to showcase how you can enhance and simplify string operations in Flutter using custom extensions. By using these extensions, developers can easily manipulate and validate strings without repetitive code. This tool helps in streamlining common tasks such as transforming text, validating email formats, generating initials, and more—all in a concise, reusable manner.

---




## Numeric Extensions: Simplified Numeric Operations

The `NumericExtension` provides a set of utility methods for working with numeric data types in Dart. These methods help format numbers, convert them to various representations, and perform common numeric operations efficiently.

### Features

- **Fixed Decimal Places**: Format numbers to a specific number of decimal places.
    - `3.14159.toFixed(2)` → `"3.14"`
    - `-123.456789.toFixed(3)` → `"-123.457"`

- **Percentage Formatting**: Easily convert numbers to percentage strings with optional decimal places.
    - `0.1234.toPercent()` → `"12%"`
    - `0.1234.toPercent(2)` → `"12.34%"`

- **Compact Notation**: Convert large numbers to compact notation (K, M, B).
    - `1234567.toCompact()` → `"1.2M"`
    - `1234567890.toCompact(decimals: 2)` → `"1.23B"`

- **Currency Formatting**: Format numbers as currency with optional symbol and decimal places.
    - `1234.56.toCurrency()` → `"$1234.56"`
    - `1234.56.toCurrency(symbol: '€', decimals: 1)` → `"€1234.6"`

- **Ordinal Conversion**: Convert numbers to their ordinal string representation.
    - `1.toOrdinal()` → `"1st"`
    - `22.toOrdinal()` → `"22nd"`
    - `123.toOrdinal()` → `"123rd"`

- **Value Clamping**: Clamp a number between a specified minimum and maximum range.


## Example Project

For detailed demonstrations of each extension, check out our [example project](https://github.com/azharbinanwar/extensions_plus/tree/master/example) which includes:

- BuildContext extensions usage
- String manipulation examples
- Collection operations
- Widget customization
- Navigation patterns
- Theme management
- Color manipulation
- Date/time formatting

## Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


## Documentation

For complete documentation and API reference, visit our [documentation site](https://pub.dev/documentation/extensions_plus/latest/).

## Support

- 📚 Read our [Wiki](https://github.com/azharbinanwar/extensions_plus/wiki) for detailed guides
- 🐛 Report bugs on our [Issue Tracker](https://github.com/azharbinanwar/extensions_plus/issues)
- 📝 Check our [Changelog](CHANGELOG.md) for recent updates



## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

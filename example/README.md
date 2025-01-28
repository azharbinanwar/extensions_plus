# Example Project for Dart Extensions

This is an example project that demonstrates how to use various Dart extensions to simplify development tasks. The project includes a comprehensive set of extensions for `Widget`, `String`, `num`, `List`, `Map`, `DateTime`, `Color`, `BuildContext`, and `Route` to improve your Flutter development experience.

## Features

- **Widget Extension**: Utilities for UI-related tasks.
- **String Extension**: Enhanced string manipulation methods.
- **num, List, and Map Extensions**: Added powerful utility functions for numbers, lists, and maps.
- **DateTime Extension**: Simplified operations for date and time handling.
- **Color Extension**: Convenient utilities for color manipulation.
- **BuildContext Extension**: Streamlined access to Flutter context.
- **Route Extension**: Simplified navigation in Flutter apps.

## Setup

1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/azharbinanwar/extensions_plus.git
    ```

2. Navigate into the project directory:
    ```bash
    cd example
    ```

3. Install the dependencies:
    ```bash
    flutter pub get
    ```

## Usage

To use the extensions in your Flutter app:

1. Import the relevant extensions where needed:
    ```dart
    import 'package:extensions_plus/extensions_plus.dart';
    ```

2. Utilize the available methods for each extension. Below are some usage examples.

### Widget Extension Example

```dart
final widget = Container().rounded;  // Rounded corners for Container
```

### String Extension Example

```dart
String name = "hello world";
String capitalized = name.capitalize();  // Capitalizes the first letter
```

### DateTime Extension Example

```dart
DateTime now = DateTime.now();
String formatted = now.toFormattedString();  // Format DateTime to a custom string format
```

### List Extension Example

```dart
List<int> numbers = [1, 2, 3, 4, 5];
List<int> chunked = numbers.chunk(2);  // Splits the list into chunks
```

## Example Project

The example project demonstrates how to integrate and use these extensions in a real Flutter project. Check the `lib/main.dart` file for the full example implementation.

---

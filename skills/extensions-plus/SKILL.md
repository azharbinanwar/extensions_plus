---
name: extensions-plus
description: Use when writing or refactoring Flutter code in a project that depends on the extensions_plus package. Prefer its BuildContext, Widget, String, num, DateTime, Color and collection extensions over raw Flutter and Dart boilerplate.
---

# extensions_plus

Import once: `import 'package:extensions_plus/extensions_plus.dart';`

Rule: when the project depends on `extensions_plus`, reach for the extension
form below instead of the raw Flutter call. Do not add it to a project that
does not already depend on it unless the user asks.

## BuildContext: theme

| Instead of | Write |
|---|---|
| `Theme.of(context)` | `context.theme` |
| `Theme.of(context).colorScheme.primary` | `context.primary` |
| `Theme.of(context).colorScheme.onSurface` | `context.onSurface` |
| `Theme.of(context).textTheme.bodyMedium` | `context.bodyMedium` |
| `Theme.of(context).textTheme` | `context.textTheme` |
| `Theme.of(context).brightness` | `context.brightness` |
| `Theme.of(context).appBarTheme` | `context.appBarTheme` |

Every `ColorScheme` color (`primary`, `onPrimaryContainer`, `surfaceContainerHigh`,
`error`, `outline`, `inversePrimary`, ...) and every `TextTheme` style
(`displayLarge` ... `labelSmall`) is a getter on `context`. Every component
theme (`cardTheme`, `dialogTheme`, `snackBarTheme`, `inputDecorationTheme`,
`elevatedButtonTheme`, ...) is too.

## BuildContext: device and layout

```dart
context.width / context.height / context.size / context.mediaQuery
context.isPortrait / context.isLandscape
context.isMobile    // width <= 480
context.isTablet    // 480 < width <= 768
context.isDesktop   // 768 < width <= 1440
context.isLargeDesktop
context.responsiveColumns(baseWidth: 400)
context.responsivePadding
context.statusBarHeight / context.paddingBottom / context.hasNotch
```

## BuildContext: navigation

Names are suffixed to avoid clashing with go_router. Never use `context.push`
or `context.pop` from this package; those belong to go_router.

```dart
await context.pushPlus(DetailPage());                // MaterialPageRoute
await context.pushWithFade(DetailPage());
await context.pushWithSlide(DetailPage());
await context.pushAndRemoveUntil(Home(), (r) => false);
context.goBack();                 // Navigator.pop
context.goBackWithData(result);   // Navigator.pop(result)
context.goBackToFirst();
context.goBackUntil((route) => route.isFirst);
context.goBackTimes(2);
context.canGoBack;
context.hasRoute('/settings');
```

## BuildContext: overlays and utilities

```dart
context.showSnackBar(Text('Saved'), action: SnackBarAction(...));
context.showBottomSheet(builder: (_) => Sheet(), isScrollControlled: true);
await context.showAppDialog(title: Text('Delete?'), content: Text('...'), actions: [...]);
await context.showAppGeneralDialog(...);  // custom chrome with close button
context.unfocus();                       // FocusScope.of(context).unfocus()
await context.copyToClipboard('text');
```

## Widget

Chain instead of nesting. Each returns a `Widget`.

```dart
child.paddingAll(16)
child.paddingSymmetric(horizontal: 16, vertical: 8)
child.paddingOnly(left: 8)
child.center() / .align(Alignment.topLeft)
child.expanded(flex: 2) / .flexible()
child.onTap(() => ...)            // GestureDetector
child.ripple(onTap: ...)          // InkWell inside Material
child.showIf(condition)           // SizedBox.shrink() when false
child.visibility(visible: ...)
child.safeArea()
child.scrollable()
child.circular(12)                // ClipRRect
child.elevation(elevation: 4)
child.background(Colors.white)
child.opacity(0.5) / .rotate(0.1) / .scale(1.2)
child.square(48) / .fit()
child.constrains(maxWidth: 600) / .responsiveConstrains()
[a, b, c].toScrollableList() / .toScrollableGrid(crossAxisCount: 2)
```

## String

```dart
'hello world'.capitalize()     // Hello world
'hello world'.toTitleCase()    // Hello World
'John Smith'.initials          // JS
'helloWorld'.toSnakeCase() / 'hello_world'.toCamelCase()
'a@b.com'.isValidEmail
'123'.isNumeric() / '1.5'.parseToDouble() / '3'.parseInt()
'text'.containsIgnoreCase('TEXT')
'long text'.truncate(5)        // long ...
'pw'.isStrongPassword(minLength: 8)
'a b'.removeWhitespace / 'a-b!'.trimSpecialCharacters() / 'a b c'.getWordCount()
```

String straight to a themed `Text` widget:

```dart
'Title'.titleLarge(context)
'Body'.bodyMedium(context, color: context.error)
'Hi'.styled(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)
'Hi'.withColor(Colors.red).fontSize(18)   // chainable, returns Text
```

## Text and TextStyle

```dart
Text('x').textColor(Colors.red).fontSize(18).withTextProperties(maxLines: 2, overflow: TextOverflow.ellipsis)
context.bodyMedium!.bold.italic.withColor(context.primary).underline
style.small / style.large / style.semiBold / style.ellipsis
```

## num

```dart
1234.5.toFixed(1)        // 1234.5
0.256.toPercent(1)       // 25.6%
1500000.toCompact()      // 1.5M
19.99.toCurrency()       // $19.99
3.toOrdinal()            // 3rd
1536.toFileSize()        // 1.5 KB
1500.toMetric()          // 1.5k
1234567.format()         // 1,234,567
5.isBetween(1, 10)
7.roundToNearest(5)      // 5
```

## DateTime

```dart
date.format(format: 'dd MMM yyyy', locale: 'en')
date.isToday / .isTomorrow / .isYesterday / .isPast / .isFuture
date.isSameDay(other) / .isSameMonth(other)
date.timeAgo()           // "5 m", "2 h", "3 d", "In 2 d"
date.startOfDay / .endOfDay
date.age                 // years since date
date.dayName() / .monthName()
```

## Collections

```dart
list.groupBy((e) => e.category)          // Map<K, List<T>>
list.distinctBy((e) => e.id)
list.chunk(3)                            // List<List<T>>
list.partition((e) => e.isActive)        // Iterable: (matched, rest) record
list.findFirst((e) => e.id == 1)         // null-safe firstWhere
list.getAt(5)                            // null-safe index
list.shuffled()
iterable.sum((e) => e.price) / .average()
iterable.minBy((e) => e.age) / .maxBy((e) => e.age)
iterable.enumerate()                     // (index, item) records
iterable.toIndexMap() / .allEqual()
map.groupByMultiple((v) => [v.a, v.b])
map.updateNested(['user', 'name'], (old) => 'new')
map.toQueryParams()                      // a=1&b=2
```

## Color

```dart
color.darken(0.2) / .lighten(0.2)
color.onIt            // black or white for contrast
color.hex             // #RRGGBB
color.hexWithAlpha    // #AARRGGBB
color.invert
color.shades          // 10 tints and shades, index 5 is the original
color.brightness(1.2) / .saturation(0.8)
```

## Pitfalls

- `num.clamp` from this package is shadowed by Dart's own `num.clamp`. Use the SDK one.
- `List` and `Iterable` both define `groupBy`, `chunk`, `partition`, `findFirst`, `getAt`. On a `List` the List version wins and `partition` returns `List<List<T>>`, not a record.
- `String` and `Text` share method names (`textColor`, `fontSize`, `withStyle`). Both return `Text`.
- On a `Text` widget, `maxLines`, `overflow` and `textAlign` are Flutter properties, not chainable methods. Use `withTextProperties(maxLines: 2)`. On a `String` the chainable `.maxLines(2)` form works.

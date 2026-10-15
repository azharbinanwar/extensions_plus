import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:extensions_plus/extensions_plus.dart';

Future<BuildContext> pump(
  WidgetTester tester, {
  ThemeData? theme,
  Size? size,
  TextDirection direction = TextDirection.ltr,
}) async {
  late BuildContext ctx;
  if (size != null) {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }
  await tester.pumpWidget(
    MaterialApp(
      theme: theme,
      builder: (_, child) =>
          Directionality(textDirection: direction, child: child!),
      home: Scaffold(
        body: Builder(
          builder: (c) {
            ctx = c;
            return const SizedBox();
          },
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return ctx;
}

void main() {
  group('BuildContextTheme', () {
    testWidgets('mirrors Theme.of', (tester) async {
      final theme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      );
      final c = await pump(tester, theme: theme);
      final t = Theme.of(c);
      expect(c.theme, t);
      expect(c.primary, t.colorScheme.primary);
      expect(c.onSurface, t.colorScheme.onSurface);
      expect(c.surfaceContainerHigh, t.colorScheme.surfaceContainerHigh);
      expect(c.bodyMedium, t.textTheme.bodyMedium);
      expect(c.textTheme, t.textTheme);
      expect(c.brightness, t.brightness);
      expect(c.cardTheme, t.cardTheme);
      expect(c.inputDecorationTheme, t.inputDecorationTheme);
      expect(c.platform, t.platform);
    });
  });

  group('DeviceContextExtension', () {
    testWidgets('mobile breakpoint', (tester) async {
      final c = await pump(tester, size: const Size(400, 800));
      expect(c.width, 400);
      expect(c.height, 800);
      expect(c.isMobile, isTrue);
      expect(c.isTablet, isFalse);
      expect(c.isPortrait, isTrue);
      expect(c.responsiveColumns(), 1);
    });

    testWidgets('tablet and desktop breakpoints', (tester) async {
      var c = await pump(tester, size: const Size(700, 500));
      expect(c.isTablet, isTrue);
      expect(c.isLandscape, isTrue);
      c = await pump(tester, size: const Size(1200, 800));
      expect(c.isDesktop, isTrue);
      expect(c.responsiveColumns(), 3);
      c = await pump(tester, size: const Size(1600, 900));
      expect(c.isLargeDesktop, isTrue);
    });
  });

  group('UtilityContextExtension', () {
    testWidgets('isDarkMode, isRtl, locale', (tester) async {
      var c = await pump(tester, theme: ThemeData.dark());
      expect(c.isDarkMode, isTrue);
      expect(c.isRtl, isFalse);
      expect(c.locale, const Locale('en', 'US'));
      c = await pump(
        tester,
        theme: ThemeData.light(),
        direction: TextDirection.rtl,
      );
      expect(c.isDarkMode, isFalse);
      expect(c.isRtl, isTrue);
    });
  });

  group('NavigationExtension', () {
    testWidgets('pushPlus, goBack, canGoBack, goBackWithData', (tester) async {
      final c = await pump(tester);
      expect(c.canGoBack, isFalse);
      final result = c.pushPlus<String>(const Scaffold(body: Text('second')));
      await tester.pumpAndSettle();
      expect(find.text('second'), findsOneWidget);
      final c2 = tester.element(find.text('second'));
      expect(c2.canGoBack, isTrue);
      c2.goBackWithData('done');
      await tester.pumpAndSettle();
      expect(await result, 'done');
      expect(find.text('second'), findsNothing);
    });

    testWidgets('pushWithFade, pushWithSlide, goBackTimes, goBackToFirst', (
      tester,
    ) async {
      final c = await pump(tester);
      c.pushWithFade(const Scaffold(body: Text('a')));
      await tester.pumpAndSettle();
      tester
          .element(find.text('a'))
          .pushWithSlide(const Scaffold(body: Text('b')));
      await tester.pumpAndSettle();
      tester.element(find.text('b')).pushPlus(const Scaffold(body: Text('c')));
      await tester.pumpAndSettle();
      expect(find.text('c'), findsOneWidget);
      tester.element(find.text('c')).goBackTimes(2);
      await tester.pumpAndSettle();
      expect(find.text('a'), findsOneWidget);
      tester.element(find.text('a')).goBackToFirst();
      await tester.pumpAndSettle();
      expect(find.text('a'), findsNothing);
    });

    testWidgets('hasRoute and pushAndRemoveUntil', (tester) async {
      final c = await pump(tester);
      c.pushPlus(
        const Scaffold(body: Text('x')),
        settings: const RouteSettings(name: '/x'),
      );
      await tester.pumpAndSettle();
      final cx = tester.element(find.text('x'));
      expect(cx.hasRoute('/x'), isTrue);
      expect(cx.hasRoute('/nope'), isFalse);
      cx.pushAndRemoveUntil(const Scaffold(body: Text('home')), (_) => false);
      await tester.pumpAndSettle();
      expect(tester.element(find.text('home')).canGoBack, isFalse);
    });
  });

  group('OverlayUtilitiesBuildContext', () {
    testWidgets('snackbar, bottom sheet, dialog', (tester) async {
      final c = await pump(tester);
      c.showSnackBar(const Text('snack'));
      await tester.pump();
      expect(find.text('snack'), findsOneWidget);

      c.showBottomSheet(builder: (_) => const Text('sheet'));
      await tester.pumpAndSettle();
      expect(find.text('sheet'), findsOneWidget);
      c.goBack();
      await tester.pumpAndSettle();

      c.showAppDialog(title: const Text('title'), content: const Text('body'));
      await tester.pumpAndSettle();
      expect(find.text('title'), findsOneWidget);
      expect(find.text('body'), findsOneWidget);
    });
  });
}

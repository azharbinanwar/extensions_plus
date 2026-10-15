import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:extensions_plus/extensions_plus.dart';

Future<void> pump(WidgetTester tester, Widget w) =>
    tester.pumpWidget(MaterialApp(home: Scaffold(body: w)));

void main() {
  group('WidgetExtension', () {
    testWidgets('padding wrappers', (tester) async {
      await pump(tester, const Text('t').paddingAll(8));
      expect(
        tester.widget<Padding>(find.byType(Padding).first).padding,
        const EdgeInsets.all(8),
      );
      await pump(tester, const Text('t').paddingSymmetric(horizontal: 4));
      expect(
        tester.widget<Padding>(find.byType(Padding).first).padding,
        const EdgeInsets.symmetric(horizontal: 4),
      );
      await pump(tester, const Text('t').paddingOnly(left: 2));
      expect(
        tester.widget<Padding>(find.byType(Padding).first).padding,
        const EdgeInsets.only(left: 2),
      );
    });

    testWidgets('layout wrappers', (tester) async {
      await pump(tester, const Text('t').center());
      expect(find.byType(Center), findsOneWidget);
      await pump(tester, const Text('t').align(Alignment.topLeft));
      expect(
        tester.widget<Align>(find.byType(Align).first).alignment,
        Alignment.topLeft,
      );
      await pump(tester, Row(children: [const Text('t').expanded(flex: 2)]));
      expect(tester.widget<Expanded>(find.byType(Expanded)).flex, 2);
      await pump(tester, const Text('t').square(40));
      expect(tester.getSize(find.byType(SizedBox).first), const Size(40, 40));
      await pump(tester, const Text('t').circular(8));
      expect(find.byType(ClipRRect), findsOneWidget);
      await pump(tester, const Text('t').opacity(0.5));
      expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 0.5);
    });

    testWidgets('showIf and visibility', (tester) async {
      await pump(tester, const Text('t').showIf(false));
      expect(find.text('t'), findsNothing);
      await pump(tester, const Text('t').showIf(true));
      expect(find.text('t'), findsOneWidget);
      await pump(tester, const Text('t').visibility(visible: false));
      expect(find.text('t'), findsNothing);
    });

    testWidgets('gestures', (tester) async {
      var taps = 0, longs = 0;
      await pump(
        tester,
        Column(
          children: [
            const Text('tap').onTap(() => taps++),
            const Text('long').onLongPress(() => longs++),
            const Text('ripple').ripple(),
          ],
        ),
      );
      await tester.tap(find.text('tap'));
      await tester.longPress(find.text('long'));
      expect(find.byType(InkWell), findsOneWidget);
      expect(taps, 1);
      expect(longs, 1);
    });

    testWidgets('hero, tooltip, semantics', (tester) async {
      await pump(
        tester,
        Column(
          children: [
            const Text('h').hero('tag'),
            const Icon(Icons.info).tooltip('info'),
            const Text('s').semantics('label', button: true),
          ],
        ),
      );
      expect(tester.widget<Hero>(find.byType(Hero)).tag, 'tag');
      expect(tester.widget<Tooltip>(find.byType(Tooltip)).message, 'info');
      expect(
        find.byWidgetPredicate(
          (w) => w is Semantics && w.properties.label == 'label',
        ),
        findsOneWidget,
      );
    });

    testWidgets('scrollable list and grid', (tester) async {
      await pump(
        tester,
        const Text('i')
            .toScrollableList(itemCount: 3, separator: const Divider()),
      );
      expect(find.text('i'), findsNWidgets(3));
      expect(find.byType(Divider), findsNWidgets(3));
      await pump(tester, const Text('g').toScrollableGrid(itemCount: 4));
      expect(find.byType(GridView), findsOneWidget);
    });
  });

  group('Text and String text extensions', () {
    testWidgets('Text chain merges style', (tester) async {
      await pump(
        tester,
        const Text(
          'x',
          style: TextStyle(fontSize: 10),
        ).textColor(Colors.red).fontSize(20).withTextProperties(maxLines: 2),
      );
      final t = tester.widget<Text>(find.byType(Text));
      expect(t.style!.color, Colors.red);
      expect(t.style!.fontSize, 20);
      expect(t.maxLines, 2);
    });

    testWidgets('String to Text', (tester) async {
      late BuildContext c;
      await pump(
        tester,
        Builder(
          builder: (ctx) {
            c = ctx;
            return 'hello'.titleLarge(ctx, color: Colors.blue);
          },
        ),
      );
      final t = tester.widget<Text>(find.text('hello'));
      expect(t.style!.color, Colors.blue);
      expect(t.style!.fontSize, Theme.of(c).textTheme.titleLarge!.fontSize);
      await pump(tester, 'hi'.withColor(Colors.red).fontSize(18));
      final t2 = tester.widget<Text>(find.text('hi'));
      expect(t2.style!.color, Colors.red);
      expect(t2.style!.fontSize, 18);
    });

    test('TextStyle chain', () {
      final s = const TextStyle(fontSize: 14).bold.italic
          .withColor(Colors.green)
          .underline;
      expect(s.fontWeight, FontWeight.bold);
      expect(s.fontStyle, FontStyle.italic);
      expect(s.color, Colors.green);
      expect(s.decoration, TextDecoration.underline);
      expect(const TextStyle(fontSize: 14).small.fontSize, 12);
      expect(const TextStyle(fontSize: 14).large.fontSize, 16);
      expect(const TextStyle().semiBold.fontWeight, FontWeight.w600);
    });
  });
}

import 'package:example/pages/color_extension_page.dart';
import 'package:example/navigator_page.dart';
import 'package:example/pages/date_time_extension_demo_page.dart';
import 'package:example/pages/list_extension_page.dart';
import 'package:example/pages/map_extension_page.dart';
import 'package:example/pages/num_extension_demo_page.dart';
import 'package:example/pages/string_extension_page.dart';
import 'package:example/pages/theme_extension_page.dart';
import 'package:example/pages/widget_demo_page.dart';
import 'package:extensions_plus/extensions_plus.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Extension Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExtensionUsagePage(),
    );
  }
}

class ExtensionUsagePage extends StatelessWidget {
  const ExtensionUsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extension plus')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 12.0,
          children: [
            ListTile(
              title: const Text('Theme Extension'),
              onTap: () => context.push(ThemeExtensionPage()),
            ),
            ListTile(
              title: const Text('Color Extension'),
              onTap: () => context.push(ColorExtensionPage()),
            ),
            ListTile(
              title: const Text('Navigation'),
              onTap: () => context.push(NavigatorPage()),
            ),
            ListTile(
              title: const Text('Map extension'),
              onTap: () => context.push(MapExtensionPage()),
            ),
            ListTile(
              title: const Text('List extension'),
              onTap: () => context.push(ListExtensionPage()),
            ),
            ListTile(
              title: const Text('Num extension'),
              onTap: () => context.push(NumericExtensionDemoPage()),
            ),
            ListTile(
              title: const Text('DateTime extension'),
              onTap: () => context.push(DateTimeExtensionDemoPage()),
            ),
            ListTile(
              title: const Text('Widget extension'),
              onTap: () => context.push(WidgetExtensionDemo()),
            ),
            ListTile(
              title: const Text('String extension'),
              onTap: () => context.push(StringExtensionPage()),
            ),
          ],
        ),
      ),
    );
  }
}

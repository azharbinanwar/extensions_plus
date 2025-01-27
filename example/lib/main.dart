import 'package:example/color_extension_page.dart';
import 'package:example/navigator_page.dart';
import 'package:extensions_plus/extensions/build_context/build_context_extension.dart';
import 'package:extensions_plus/extensions/color_extension.dart';
import 'package:extensions_plus/extensions/widget_extension.dart';
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
              title: const Text('Color Extension'),
              onTap: () => context.push(ColorExtensionPage()),
            ),
            ListTile(
              title: const Text('Navigation'),
              onTap: () => context.push(NavigatorPage()),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:extensions_plus/extensions_plus.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator Extension Example')),
      body: SingleChildScrollView(
        child: Column(
          spacing: 12.0,
          children: [
            ListTile(
              title: const Text('Navigator Extension'),
              onTap: () => context.push(FirstPage()),
            ),

            // with transitions
            ListTile(
              title: const Text('Navigation Fade'),
              onTap: () => context.pushWithFade(FirstPage()),
            ),
            ListTile(
              title: const Text('Navigation Slide'),
              onTap: () => context.pushWithSlide(FirstPage()),
            ),
          ],
        ),
      ),
    );
  }
}

/// Mock pages for testing
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('First Page')),
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.push(SecondPage()),
            child: Text('Go to Second Page'),
          ),
        ),
      );
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Second Page')),
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.pop(),
            child: Text('Go Back'),
          ),
        ),
      );
}

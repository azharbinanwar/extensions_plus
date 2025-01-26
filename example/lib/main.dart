import 'package:extensions_plus/extensions/color_extension.dart';
import 'package:extensions_plus/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorExtensionExample());
}

class ColorExtensionExample extends StatelessWidget {
  const ColorExtensionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Extension Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ColorShadesPage(),
    );
  }
}

class ColorShadesPage extends StatelessWidget {
  final Color baseColor = Colors.green;

  const ColorShadesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> defaultShade = [
      Colors.green,
      Colors.green.shade50,
      Colors.green.shade100,
      Colors.green.shade200,
      Colors.green.shade300,
      Colors.green.shade400,
      Colors.green.shade500,
      Colors.green.shade600,
      Colors.green.shade700,
      Colors.green.shade800,
      Colors.green.shade900
    ];
    Color color1 = Color(0xff0fcced);
    Color color2 = Color(0xff7a0fed);
    final List<Color> shad1 = [color1, ...color1.shades];
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Shades Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: [],
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  color: color1,
                  child: Center(
                    child: Text(
                      'Base Color',
                      style: TextStyle(
                        color: color1.darken(),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ).expanded(),
                Container(
                  height: 200,
                  color: color1.brightness(0.2),
                  child: Center(
                    child: Text(
                      'Base Color - Brightness - 0.2',
                      style: TextStyle(
                        color: color1.brightness(0.2).lighten(0.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ).expanded(),
                Container(
                  height: 200,
                  color: color1.brightness(0.9).darken(),
                  child: Center(
                    child: Text(
                      'Base Color - warmShade',
                      style: TextStyle(
                        color: color1.invert.brightness(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ).expanded(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: shad1.length,
                itemBuilder: (context, index) {
                  final shade = shad1[index];
                  return ColorTile(color: shade, label: 'shad1 ${index + 1}');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: defaultShade.length,
                itemBuilder: (context, index) {
                  final shade = defaultShade[index];
                  return ColorTile(color: shade, label: 'defaultShade ${index + 1}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorTile extends StatelessWidget {
  final double? height;
  final double? width;
  final Color color;
  final String label;

  const ColorTile({
    super.key,
    required this.color,
    required this.label,
    this.height = 100,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black26),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: color.onIt,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

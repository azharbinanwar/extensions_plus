import 'package:extensions_plus/extensions/color_extension.dart';
import 'package:extensions_plus/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class ColorExtensionPage extends StatelessWidget {
  final Color baseColor = Colors.green;

  const ColorExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color color1 = Color(0xff0fcced);
    Color color2 = Color(0xff7a0fed);
    final List<Color> color1Shades = [color1, ...color1.shades];
    final List<Color> color2Shades = [color2, ...color2.shades];
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
                        color: color1.onIt,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ).expanded(),
                Container(
                  height: 200,
                  color: color1.brightness(0.2),
                  child: Center(
                    child: Text(
                      'Base Color\nBrightness - 0.2',
                      style: TextStyle(
                        color: color1.brightness(0.2).onIt,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ).expanded(),
                Container(
                  height: 200,
                  color: color1.brightness(0.9).darken(),
                  child: Center(
                    child: Text(
                      'Base Color\nBrightness - 0.9\nDarken',
                      style: TextStyle(
                        color: color1.brightness(0.9).darken().onIt,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ).expanded(),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  color: color2,
                  child: Center(
                    child: Text(
                      'Base Color',
                      style: TextStyle(
                        color: color2.onIt,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ).expanded(),
                Container(
                  height: 200,
                  color: color2.invert,
                  child: Center(
                    child: Text(
                      'Base Color\nInvert',
                      style: TextStyle(
                        color: color2.invert.onIt,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ).expanded(),
                Container(
                  height: 200,
                  color: color2.saturation(0.5),
                  child: Center(
                    child: Text(
                      'Base Color\nSaturation - 0.5',
                      style: TextStyle(
                        color: color2.saturation(0.5).onIt,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ).expanded(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(color1Shades.length, (index) {
                  final shade = color1Shades[index];
                  if (index == 0) {
                    return ColorTile(color: shade, label: 'Base Color');
                  } else {
                    return ColorTile(color: shade, label: 'Shades $index');
                  }
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(color2Shades.length, (index) {
                  final shade = color2Shades[index];
                  if (index == 0) {
                    return ColorTile(color: shade, label: 'Base Color');
                  } else {
                    return ColorTile(color: shade, label: 'Shades $index');
                  }
                }),
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

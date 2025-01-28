import 'package:extensions_plus/extensions_plus.dart';
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
        title: Text('Color Shades and Manipulation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Displaying Color Manipulations with Text Labels
            buildColorRow(
              context,
              color1,
              [
                'Base Color',
                'Brightness +0.2',
                'Brightness +0.9 & Darken',
              ],
              [
                color1,
                color1.brightness(1.2),
                color1.brightness(0.9).darken(),
              ],
            ),
            buildColorRow(
              context,
              color2,
              [
                'Base Color',
                'Inverted Color',
                'Saturation - 0.5',
              ],
              [
                color2,
                color2.invert,
                color2.saturation(0.5),
              ],
            ),
            buildColorShades(color1Shades, 'Color 1 Shades'),
            buildColorShades(color2Shades, 'Color 2 Shades'),
          ],
        ),
      ),
    );
  }

  // Helper to build rows of colors
  Widget buildColorRow(BuildContext context, Color baseColor,
      List<String> labels, List<Color> colors) {
    return Row(
      children: List.generate(colors.length, (index) {
        return Expanded(
          child: ColorTile(
            color: colors[index],
            label: '${labels[index]}\n${colors[index].hex}',
          ),
        );
      }),
    );
  }

  // Helper to build color shades list
  Widget buildColorShades(List<Color> shades, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(shades.length, (index) {
              final shade = shades[index];
              return ColorTile(color: shade, label: 'Shade ${index * 100}');
            }),
          ),
        ],
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

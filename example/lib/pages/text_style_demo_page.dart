import 'package:extensions_plus/extensions_plus.dart';
import 'package:flutter/material.dart';

class TextStyleDemoPage extends StatelessWidget {
  const TextStyleDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextStyle Extension Demo')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color Variations',
              style: TextStyle(fontSize: 20).bold,
            ),
            SizedBox(height: 10),
            Text(
              'Original Color',
              style: TextStyle(color: Colors.blue),
            ),
            Row(
              children: [
                Text('Hidden Text => '),
                Text(
                  'Transparent Color',
                  style: TextStyle(color: Colors.blue).transparent,
                ),
              ],
            ),
            Text(
              'Opaque Color',
              style: TextStyle(color: Colors.blue).opaque,
            ),
            Divider(height: 30),
            Text(
              'Size Variations',
              style: TextStyle(fontSize: 20).bold,
            ),
            SizedBox(height: 10),
            Text(
              'Small Text',
              style: TextStyle(fontSize: 16).small,
            ),
            Text(
              'Large Text',
              style: TextStyle(fontSize: 16).large,
            ),
            Text(
              'Extra Large Text',
              style: TextStyle(fontSize: 16).extraLarge,
            ),
            Divider(height: 30),
            Text(
              'Font Weight',
              style: TextStyle(fontSize: 20).bold,
            ),
            SizedBox(height: 10),
            Text(
              'Thin Text',
              style: TextStyle(fontSize: 16).thin,
            ),
            Text(
              'Light Text',
              style: TextStyle(fontSize: 16).light,
            ),
            Text(
              'Normal Text',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Medium Text',
              style: TextStyle(fontSize: 16).medium,
            ),
            Text(
              'Bold Text',
              style: TextStyle(fontSize: 16).bold,
            ),
            Text(
              'Semi-Bold Text',
              style: TextStyle(fontSize: 16).semiBold,
            ),
            Divider(height: 30),
            Text(
              'Text Decorations',
              style: TextStyle(fontSize: 20).bold,
            ),
            SizedBox(height: 10),
            Text(
              'Underline Text',
              style: TextStyle(color: Colors.green).underline,
            ),
            Text(
              'Line Through Text',
              style: TextStyle(color: Colors.red).lineThrough,
            ),
            Text(
              'Overline Text',
              style: TextStyle(color: Colors.purple).overline,
            ),
            Divider(height: 30),
            Text(
              'Font Style',
              style: TextStyle(fontSize: 20).bold,
            ),
            SizedBox(height: 10),
            Text(
              'Italic Text',
              style: TextStyle(fontSize: 16).italic,
            ),
          ],
        ),
      ),
    );
  }
}

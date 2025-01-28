import 'package:flutter/material.dart';
import 'package:extensions_plus/extensions_plus.dart';  // Import your extension file

class WidgetExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Extension Demo')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding and Centering Example
            Text('Padding and Centering Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              color: Colors.blue,
              height: 100,
              width: double.infinity,
            ).paddingAll(16).center(),
            SizedBox(height: 20),

            // OnTap Gesture Example
            Text('OnTap Gesture Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              color: Colors.green,
              height: 100,
              width: double.infinity,
              child: Center(child: Text('Tap Me!', style: TextStyle(color: Colors.white))),
            ).onTap(() => context.showSnackBar(Text('Container Tapped'))),
            SizedBox(height: 20),

            // Scrollable List Example
            Text('Scrollable List Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SizedBox(
              height: 200.0,
              child: Text('Scrollable List:')
                  .paddingSymmetric(vertical: 8)
                  .toScrollableList(itemCount: 100, separator: Divider()),
            ),
            SizedBox(height: 20),

            // Visibility and Opacity Example
            Text('Visibility and Opacity Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Text('This text is visible')
                    .visibility(visible: true)
                    .opacity(0.8),
                SizedBox(width: 10),
                Text('Invisible Text => ')
                    .opacity(0.0),
                Text('This text is invisible')
                    .visibility(visible: false),
              ],
            ),
            SizedBox(height: 20),

            // Elevation and Material Example
            Text('Elevation and Material Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.orange,
              child: Center(child: Text('Elevated Container', style: TextStyle(color: Colors.white))),
            ).elevation(elevation: 6, shadowColor: Colors.black),
            SizedBox(height: 20),

            // Responsive Constraint Example
            Text('Responsive Constraint Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              color: Colors.purple,
              height: 100,
              width: double.infinity,
              child: Center(child: Text('Responsive Constraint')),
            ).responsiveConstrains(minWidth: 0.0, maxWidth: 300.0),
            SizedBox(height: 20),

            // Rotation and Scaling Example
            Text('Rotation and Scaling Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
              child: Center(child: Text('Rotated Box', style: TextStyle(color: Colors.white))),
            ).rotate(45).scale(1.5),
            SizedBox(height: 20),

            // Materialized Widget with Border Radius Example
            Text('Materialized Widget with Border Radius Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.amber,
              child: Center(child: Text('Rounded Box', style: TextStyle(color: Colors.white))),
            ).materialized(borderRadius: BorderRadius.circular(12)),
            SizedBox(height: 20),

            // Color Filter and Gradient Example
            Text('Color Filter and Gradient Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

          ],
        ),
      ),
    );
  }
}


import 'dart:convert';
import 'package:flutter/material.dart';

class JsonViewer extends StatelessWidget {
  final dynamic jsonData;
  final double fontSize;
  final Color backgroundColor;

  const JsonViewer({
    super.key,
    required this.jsonData,
    this.fontSize = 14.0,
    this.backgroundColor = const Color(0xFFF5F5F5),
  });

  String _formatJson() {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SelectableText(
          _formatJson(),
          style: TextStyle(
            fontFeatures: [
              const FontFeature.tabularFigures(),
            ],
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
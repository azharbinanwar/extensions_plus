import 'package:extensions_plus/extensions_plus.dart';
import 'package:flutter/material.dart';

class NumericExtensionDemoPage extends StatelessWidget {
  const NumericExtensionDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final demoNumber = 1234567.89;
    final smallNumber = 0.1234;
    final byteSize = 1024 * 1024;

    final examples = [
      {
        'value': demoNumber.toString(),
        'function': 'toFixed(2)',
        'result': demoNumber.toFixed(2),
      },
      {
        'value': smallNumber.toString(),
        'function': 'toPercent(1)',
        'result': smallNumber.toPercent(1),
      },
      {
        'value': demoNumber.toString(),
        'function': 'toCompact()',
        'result': demoNumber.toCompact(),
      },
      {
        'value': demoNumber.toString(),
        'function': 'toCurrency()',
        'result': demoNumber.toCurrency(),
      },
      {
        'value': '22',
        'function': 'toOrdinal()',
        'result': 22.toOrdinal(),
      },
      {
        'value': demoNumber.toString(),
        'function': 'clamp(100, 500)',
        'result': demoNumber.clamp(100, 500).toString(),
      },
      {
        'value': demoNumber.toString(),
        'function': 'isBetween(0, 2M)',
        'result': demoNumber.isBetween(0, 2000000).toString(),
      },
      {
        'value': demoNumber.toString(),
        'function': 'roundToNearest(100)',
        'result': demoNumber.roundToNearest(100).toString(),
      },
      {
        'value': demoNumber.toString(),
        'function': 'toMetric()',
        'result': demoNumber.toMetric(),
      },
      {
        'value': byteSize.toString(),
        'function': 'toFileSize()',
        'result': byteSize.toFileSize(),
      },
      {
        'value': demoNumber.toString(),
        'function': 'format(",", ".")',
        'result':
            demoNumber.format(thousandSeparator: ',', decimalSeparator: '.'),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Numeric Extension Demo'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: examples.length,
        itemBuilder: (context, index) {
          final example = examples[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                'Value: ${example['value']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Function: ${example['function']}'),
                  Text('Result: ${example['result']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

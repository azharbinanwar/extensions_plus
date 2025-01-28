import 'package:extensions_plus/extensions_plus.dart';
import 'package:flutter/material.dart';

class DateTimeExtensionDemoPage extends StatelessWidget {
  const DateTimeExtensionDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final tomorrow = now.add(const Duration(days: 1));
    final specificDate = DateTime(2000, 5, 15);

    final examples = [
      {
        'value': now.toIso8601String(),
        'function': 'format("dd-MM-yyyy")',
        'result': now.format(format: 'dd-MM-yyyy'),
      },
      {
        'value': now.toIso8601String(),
        'function': 'isToday',
        'result': now.isToday.toString(),
      },
      {
        'value': yesterday.toIso8601String(),
        'function': 'isYesterday',
        'result': yesterday.isYesterday.toString(),
      },
      {
        'value': tomorrow.toIso8601String(),
        'function': 'isTomorrow',
        'result': tomorrow.isTomorrow.toString(),
      },
      {
        'value': specificDate.toIso8601String(),
        'function': 'age',
        'result': specificDate.age.toString(),
      },
      {
        'value': now.toIso8601String(),
        'function': 'startOfDay',
        'result': now.startOfDay.toIso8601String(),
      },
      {
        'value': now.toIso8601String(),
        'function': 'endOfDay',
        'result': now.endOfDay.toIso8601String(),
      },
      {
        'value': now.toIso8601String(),
        'function': 'timeAgo()',
        'result': now.subtract(const Duration(hours: 2)).timeAgo(),
      },
      {
        'value': specificDate.toIso8601String(),
        'function': 'dayName',
        'result': specificDate.dayName(),
      },
      {
        'value': specificDate.toIso8601String(),
        'function': 'monthName',
        'result': specificDate.monthName(),
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('DateTime Extension Demo')),
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

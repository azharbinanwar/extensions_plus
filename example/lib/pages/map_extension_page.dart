import 'package:example/widgets/json_viewer.dart';
import 'package:extensions_plus/extensions_plus.dart';
import 'package:flutter/material.dart';

class MapExtensionPage extends StatefulWidget {
  const MapExtensionPage({super.key});

  @override
  State<MapExtensionPage> createState() => _MapExtensionPageState();
}

class _MapExtensionPageState extends State<MapExtensionPage> {
  // Sample data for demonstrations
  final List<Map<String, dynamic>> _data = [
    {
      'name': 'John',
      'age': 30,
      'city': 'New York',
      'role': 'developer',
      'details': {'experience': 5, 'department': 'IT'}
    },
    {
      'name': 'Jane',
      'age': 25,
      'city': 'London',
      'role': 'designer',
      'details': {'experience': 3, 'department': 'Design'}
    },
    {
      'name': 'Bob',
      'age': 35,
      'city': 'New York',
      'role': 'manager',
      'details': {'experience': 8, 'department': 'Management'}
    },
  ];

  String _selectedGroupingKey = 'city';
  final TextEditingController _pathController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _nestedPathController = TextEditingController();
  Map<String, List<Map<String, dynamic>>> _groupedData = {};

  @override
  void initState() {
    super.initState();
    _updateGroupedData();
  }

  void _updateGroupedData() {
    setState(() {
      _groupedData = _data
          .asMap()
          .groupByMultiple((item) => [item[_selectedGroupingKey].toString()]);
    });
  }

  @override
  void dispose() {
    _pathController.dispose();
    _valueController.dispose();
    _nestedPathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Extension Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          JsonViewer(jsonData: _data),
          _buildGroupBySection(),
          const SizedBox(height: 20),
          _buildNestedUpdateSection(),
          const SizedBox(height: 20),
          _buildQueryParamsSection(),
        ],
      ),
    );
  }

  Widget _buildGroupBySection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Group By Multiple Keys',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedGroupingKey,
              items: const [
                DropdownMenuItem(value: 'city', child: Text('City')),
                DropdownMenuItem(value: 'role', child: Text('Role')),
                DropdownMenuItem(value: 'age', child: Text('Age')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedGroupingKey = value;
                    _updateGroupedData();
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('Grouped Results'),
              children: [
                JsonViewer(jsonData: _groupedData),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNestedUpdateSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update Nested Values',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nestedPathController,
              decoration: const InputDecoration(
                labelText: 'Nested Path (e.g., 0.details.experience)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _valueController,
              decoration: const InputDecoration(
                labelText: 'New Value',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final path = _nestedPathController.text.split('.');
                if (path.isNotEmpty) {
                  final index = int.tryParse(path[0]);
                  if (index != null && index < _data.length) {
                    setState(() {
                      _data[index] = _data[index].updateNested(
                        path.sublist(1),
                        (_) => _valueController.text,
                      );
                    });
                  }
                }
              },
              child: const Text('Update Nested Value'),
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('Current Data'),
              children: [
                JsonViewer(jsonData: _data),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQueryParamsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Query Parameters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<int>(
                    value: 0,
                    items: List.generate(_data.length, (index) {
                      return DropdownMenuItem(
                        value: index,
                        child: Text('Data ${index + 1}'),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                _data[0].toQueryParams(),
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

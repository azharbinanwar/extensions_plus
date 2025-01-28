import 'package:flutter/material.dart';
import 'package:extensions_plus/extensions/collections/list_extension.dart';

class ListExtensionPage extends StatefulWidget {
  const ListExtensionPage({super.key});

  @override
  State<ListExtensionPage> createState() => _ListExtensionPageState();
}

class _ListExtensionPageState extends State<ListExtensionPage> {
  final List<Map<String, dynamic>> _users = [
    {'id': 1, 'name': 'John', 'age': 30, 'city': 'New York'},
    {'id': 2, 'name': 'Jane', 'age': 25, 'city': 'London'},
    {'id': 3, 'name': 'Bob', 'age': 30, 'city': 'New York'},
    {'id': 4, 'name': 'Alice', 'age': 28, 'city': 'London'},
    {'id': 5, 'name': 'Charlie', 'age': 35, 'city': 'Paris'},
  ];

  int _chunkSize = 2;
  String _groupByKey = 'city';
  String _distinctByKey = 'age';
  int _elementAtIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Extension Examples'),
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildOriginalDataSection(),
          const SizedBox(height: 16),
          _buildDistinctBySection(),
          const SizedBox(height: 16),
          _buildFirstWhereSection(),
          const SizedBox(height: 16),
          _buildGroupBySection(),
          const SizedBox(height: 16),
          _buildPartitionSection(),
          const SizedBox(height: 16),
          _buildChunkSection(),
          const SizedBox(height: 16),
          _buildElementAtSection(),
          const SizedBox(height: 16),
          _buildShuffleSection(),
        ],
      ),
    );
  }

  Widget _buildOriginalDataSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Original Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Age')),
                  DataColumn(label: Text('City')),
                ],
                rows: _users.map((user) {
                  return DataRow(cells: [
                    DataCell(Text('${user['id']}')),
                    DataCell(Text('${user['name']}')),
                    DataCell(Text('${user['age']}')),
                    DataCell(Text('${user['city']}')),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDistinctBySection() {
    final distinctUsers = _users.distinctBy((u) => u[_distinctByKey]);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Distinct By',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Filter by: '),
                DropdownButton<String>(
                  value: _distinctByKey,
                  items: const [
                    DropdownMenuItem(value: 'age', child: Text('Age')),
                    DropdownMenuItem(value: 'city', child: Text('City')),
                  ],
                  onChanged: (value) {
                    if (value != null) setState(() => _distinctByKey = value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Value')),
                ],
                rows: distinctUsers.map((user) {
                  return DataRow(cells: [
                    DataCell(Text('${user['name']}')),
                    DataCell(Text('${user[_distinctByKey]}')),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstWhereSection() {
    final firstUser = _users.firstWhereOrNull((u) => u['city'] == 'New York');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'First Where Or Null',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('First user from New York:',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  if (firstUser != null) ...[
                    const SizedBox(height: 8),
                    Text('Name: ${firstUser['name']}'),
                    Text('Age: ${firstUser['age']}'),
                    Text('City: ${firstUser['city']}'),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupBySection() {
    final grouped = _users.groupBy((u) => u[_groupByKey]);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Group By',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Group by: '),
                DropdownButton<String>(
                  value: _groupByKey,
                  items: const [
                    DropdownMenuItem(value: 'city', child: Text('City')),
                    DropdownMenuItem(value: 'age', child: Text('Age')),
                  ],
                  onChanged: (value) {
                    if (value != null) setState(() => _groupByKey = value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...grouped.entries.map((entry) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${_groupByKey.toUpperCase()}: ${entry.key}',
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: entry.value.map((user) => Chip(
                      label: Text('${user['name']}'),
                      backgroundColor: Colors.blue.shade100,
                    )).toList(),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPartitionSection() {
    final partitioned = _users.partition((user) => user['age'] > 30);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Partition',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Age > 30',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        const SizedBox(height: 8),
                        ...partitioned[0].map((user) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text('${user['name']} (${user['age']})'),
                        )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Age ≤ 30',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        const SizedBox(height: 8),
                        ...partitioned[1].map((user) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text('${user['name']} (${user['age']})'),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChunkSection() {
    final chunks = _users.chunk(_chunkSize);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chunk',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Chunk size: '),
                Expanded(
                  child: Slider(
                    value: _chunkSize.toDouble(),
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: _chunkSize.toString(),
                    onChanged: (value) {
                      setState(() => _chunkSize = value.round());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: chunks.asMap().entries.map((entry) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chunk ${entry.key + 1}',
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      ...entry.value.map((user) => Text('${user['name']}')),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElementAtSection() {
    final element = _users.elementAtOrNull(_elementAtIndex);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Element At Or Null',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Index: '),
                Expanded(
                  child: Slider(
                    value: _elementAtIndex.toDouble(),
                    min: 0,
                    max: 6,
                    divisions: 6,
                    label: _elementAtIndex.toString(),
                    onChanged: (value) {
                      setState(() => _elementAtIndex = value.round());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: element != null ? Colors.green.shade100 : Colors.red.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Element at index $_elementAtIndex:',
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  if (element != null) ...[
                    const SizedBox(height: 8),
                    Text('Name: ${element['name']}'),
                    Text('Age: ${element['age']}'),
                    Text('City: ${element['city']}'),
                  ] else
                    const Text('No element found at this index'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShuffleSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shuffled',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() {}),
                  icon: const Icon(Icons.shuffle),
                  label: const Text('Shuffle List'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _users.shuffled().map((user) => Chip(
                label: Text('${user['name']}'),
                backgroundColor: Colors.purple.shade100,
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
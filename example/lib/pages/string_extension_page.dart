import 'package:extensions_plus/extensions_plus.dart';
import 'package:flutter/material.dart';

class StringExtensionPage extends StatefulWidget {
  const StringExtensionPage({super.key});

  @override
  State<StringExtensionPage> createState() => _StringExtensionPageState();
}

class _StringExtensionPageState extends State<StringExtensionPage> {
  final TextEditingController _inputController = TextEditingController();
  String _result = "";

  void _applyExtension(String extensionName) {
    final inputText = _inputController.text;
    if (inputText.isEmpty) {
      setState(() {
        _result = "Input is empty.";
      });
      return;
    }

    setState(() {
      switch (extensionName) {
        case 'Capitalize':
          _result = inputText.capitalize();
          break;
        case 'Initials':
          _result = inputText.initials;
          break;
        case 'To Title Case':
          _result = inputText.toTitleCase();
          break;
        case 'Is Valid Email':
          _result = inputText.isValidEmail ? "Valid Email" : "Invalid Email";
          break;
        case 'Is Numeric':
          _result = inputText.isNumeric() ? "Is Numeric" : "Not Numeric";
          break;
        case 'Reverse':
          _result = inputText.reverse;
          break;
        case 'To Camel Case':
          _result = inputText.toCamelCase();
          break;
        case 'To Snake Case':
          _result = inputText.toSnakeCase();
          break;
        case 'Remove Whitespace':
          _result = inputText.removeWhitespace;
          break;
        case 'Trim Special Characters':
          _result = inputText.trimSpecialCharacters();
          break;
        default:
          _result = "Unknown extension.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("String Extensions Demo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: "Enter a string",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Choose an action:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                ElevatedButton(
                  onPressed: () => _applyExtension('Capitalize'),
                  child: Text("Capitalize"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('Initials'),
                  child: Text("Initials"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('To Title Case'),
                  child: Text("To Title Case"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('Is Valid Email'),
                  child: Text("Is Valid Email"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('Is Numeric'),
                  child: Text("Is Numeric"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('Reverse'),
                  child: Text("Reverse"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('To Camel Case'),
                  child: Text("To Camel Case"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('To Snake Case'),
                  child: Text("To Snake Case"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('Remove Whitespace'),
                  child: Text("Remove Whitespace"),
                ),
                ElevatedButton(
                  onPressed: () => _applyExtension('Trim Special Characters'),
                  child: Text("Trim Special Characters"),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Result:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                _result,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

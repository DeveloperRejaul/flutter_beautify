import 'package:flutter/material.dart';

import '../widgets/dropdown.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBDropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Outlined Dropdown',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBDropdown<String>(
              value: _selectedValue,
              items: [
                const DropdownMenuItem(
                  value: 'flutter',
                  child: Text('Flutter'),
                ),
                const DropdownMenuItem(
                  value: 'dart',
                  child: Text('Dart'),
                ),
                const DropdownMenuItem(
                  value: 'javascript',
                  child: Text('JavaScript'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              labelText: 'Select Language',
              hintText: 'Choose a language',
            ),
            const SizedBox(height: 32),
            const Text(
              'Filled Dropdown',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBDropdown<String>.filled(
              value: _selectedValue,
              items: [
                const DropdownMenuItem(
                  value: 'frontend',
                  child: Text('Frontend'),
                ),
                const DropdownMenuItem(
                  value: 'backend',
                  child: Text('Backend'),
                ),
                const DropdownMenuItem(
                  value: 'fullstack',
                  child: Text('Full Stack'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              labelText: 'Select Role',
              hintText: 'Choose your role',
            ),
          ],
        ),
      ),
    );
  }
}

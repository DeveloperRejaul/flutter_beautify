import 'package:flutter/material.dart';

import '../widgets/radio_button.dart';

class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({super.key});

  @override
  State<RadioButtonExample> createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  String? _selectedOption;
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBRadioButton Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Radio Buttons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBRadioButton<String>(
              value: 'option1',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
              label: 'Option 1',
            ),
            FBRadioButton<String>(
              value: 'option2',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
              label: 'Option 2',
            ),
            FBRadioButton<String>(
              value: 'option3',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
              label: 'Option 3',
            ),
            const SizedBox(height: 32),
            const Text(
              'Outlined Radio Buttons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBRadioButton<String>.outlined(
              value: 'category1',
              groupValue: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              label: 'Category 1',
            ),
            FBRadioButton<String>.outlined(
              value: 'category2',
              groupValue: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              label: 'Category 2',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/date_picker.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBDatePicker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Outlined Date Picker',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBDatePicker(
              selectedDate: _selectedDate,
              onDateChanged: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
              labelText: 'Birth Date',
              hintText: 'Select your birth date',
            ),
            const SizedBox(height: 32),
            const Text(
              'Filled Date Picker',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBDatePicker.filled(
              selectedDate: _selectedDate,
              onDateChanged: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
              labelText: 'Appointment Date',
              hintText: 'Select appointment date',
            ),
            const SizedBox(height: 24),
            if (_selectedDate != null)
              Text(
                'Selected: ${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

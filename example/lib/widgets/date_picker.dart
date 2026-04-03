import 'package:flutter/material.dart';

class FBDatePicker extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime?>? onDateChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  final String hintText;
  final String labelText;
  final InputDecoration decoration;
  final bool showTime;
  final double? width;

  const FBDatePicker._({
    super.key,
    this.selectedDate,
    this.onDateChanged,
    required this.firstDate,
    required this.lastDate,
    this.hintText = 'Select date',
    this.labelText = '',
    required this.decoration,
    this.showTime = false,
    this.width,
  });

  // Default → outlined
  factory FBDatePicker({
    Key? key,
    DateTime? selectedDate,
    ValueChanged<DateTime?>? onDateChanged,
    DateTime? firstDate,
    DateTime? lastDate,
    String hintText = 'Select date',
    String labelText = '',
    bool showTime = false,
    double? width,
  }) {
    return FBDatePicker.outlined(
      key: key,
      selectedDate: selectedDate,
      onDateChanged: onDateChanged,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
      hintText: hintText,
      labelText: labelText,
      showTime: showTime,
      width: width,
    );
  }

  // -------- OUTLINED --------
  factory FBDatePicker.outlined({
    Key? key,
    DateTime? selectedDate,
    ValueChanged<DateTime?>? onDateChanged,
    DateTime? firstDate,
    DateTime? lastDate,
    String hintText = 'Select date',
    String labelText = '',
    bool showTime = false,
    double? width,
  }) {
    return FBDatePicker._(
      key: key,
      selectedDate: selectedDate,
      onDateChanged: onDateChanged,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
      hintText: hintText,
      labelText: labelText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText.isEmpty ? null : labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        suffixIcon: const Icon(Icons.calendar_today),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
      showTime: showTime,
      width: width,
    );
  }

  // -------- FILLED --------
  factory FBDatePicker.filled({
    Key? key,
    DateTime? selectedDate,
    ValueChanged<DateTime?>? onDateChanged,
    DateTime? firstDate,
    DateTime? lastDate,
    String hintText = 'Select date',
    String labelText = '',
    bool showTime = false,
    double? width,
  }) {
    return FBDatePicker._(
      key: key,
      selectedDate: selectedDate,
      onDateChanged: onDateChanged,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
      hintText: hintText,
      labelText: labelText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText.isEmpty ? null : labelText,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        suffixIcon: const Icon(Icons.calendar_today),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
      showTime: showTime,
      width: width,
    );
  }

  @override
  State<FBDatePicker> createState() => _FBDatePickerState();
}

class _FBDatePickerState extends State<FBDatePicker> {
  late DateTime? _selectedDate;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
    _controller = TextEditingController(
      text: _selectedDate != null ? _formatDate(_selectedDate!) : '',
    );
  }

  String _formatDate(DateTime date) {
    if (widget.showTime) {
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    }
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _formatDate(picked);
      });
      widget.onDateChanged?.call(picked);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextFormField(
        controller: _controller,
        decoration: widget.decoration,
        readOnly: true,
        onTap: () => _selectDate(context),
      ),
    );
  }
}

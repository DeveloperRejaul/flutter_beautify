import 'package:flutter/material.dart';

class FBDropdown<T> extends StatefulWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String hintText;
  final String labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final InputDecoration decoration;
  final bool isExpanded;
  final double? width;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry contentPadding;

  const FBDropdown._({
    super.key,
    required this.value,
    required this.items,
    this.onChanged,
    this.hintText = 'Select an option',
    this.labelText = '',
    this.hintStyle,
    this.labelStyle,
    required this.decoration,
    this.isExpanded = true,
    this.width,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  });

  // Default → outlined
  factory FBDropdown({
    Key? key,
    T? value,
    required List<DropdownMenuItem<T>> items,
    ValueChanged<T?>? onChanged,
    String hintText = 'Select an option',
    String labelText = '',
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    bool isExpanded = true,
    double? width,
  }) {
    return FBDropdown.outlined(
      key: key,
      value: value,
      items: items,
      onChanged: onChanged,
      hintText: hintText,
      labelText: labelText,
      hintStyle: hintStyle,
      labelStyle: labelStyle,
      isExpanded: isExpanded,
      width: width,
    );
  }

  // -------- OUTLINED --------
  factory FBDropdown.outlined({
    Key? key,
    T? value,
    required List<DropdownMenuItem<T>> items,
    ValueChanged<T?>? onChanged,
    String hintText = 'Select an option',
    String labelText = '',
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    bool isExpanded = true,
    double? width,
  }) {
    return FBDropdown._(
      key: key,
      value: value,
      items: items,
      onChanged: onChanged,
      hintText: hintText,
      labelText: labelText,
      hintStyle: hintStyle,
      labelStyle: labelStyle,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText.isEmpty ? null : labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      isExpanded: isExpanded,
      width: width,
    );
  }

  // -------- FILLED --------
  factory FBDropdown.filled({
    Key? key,
    T? value,
    required List<DropdownMenuItem<T>> items,
    ValueChanged<T?>? onChanged,
    String hintText = 'Select an option',
    String labelText = '',
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    bool isExpanded = true,
    double? width,
  }) {
    return FBDropdown._(
      key: key,
      value: value,
      items: items,
      onChanged: onChanged,
      hintText: hintText,
      labelText: labelText,
      hintStyle: hintStyle,
      labelStyle: labelStyle,
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      isExpanded: isExpanded,
      width: width,
    );
  }

  @override
  State<FBDropdown<T>> createState() => _FBDropdownState<T>();
}

class _FBDropdownState<T> extends State<FBDropdown<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: DropdownButtonFormField<T>(
        value: _selectedValue,
        items: widget.items,
        onChanged: (T? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
          widget.onChanged?.call(newValue);
        },
        decoration: widget.decoration,
        isExpanded: widget.isExpanded,
      ),
    );
  }
}

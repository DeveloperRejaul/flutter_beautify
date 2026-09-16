import 'package:flutter/material.dart';

class FBDropdown<T> extends StatefulWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String hintText;
  final String labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool isExpanded;
  final double? width;
  final bool filled;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
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
    this.isExpanded = true,
    this.width,
    this.filled = false,
    this.borderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.borderWidth = 1.0,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 16,
    ),
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
      isExpanded: isExpanded,
      width: width,
      filled: true,
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
    final colorScheme = Theme.of(context).colorScheme;
    final borderColor = widget.borderColor ?? colorScheme.outline;
    final focusedColor = widget.focusedBorderColor ?? colorScheme.primary;
    final fillColor = widget.filled
        ? (widget.fillColor ?? colorScheme.surfaceContainerHighest)
        : null;

    final decoration = InputDecoration(
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      labelText: widget.labelText.isEmpty ? null : widget.labelText,
      labelStyle: widget.labelStyle,
      filled: widget.filled,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: widget.filled
            ? BorderSide.none
            : BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: widget.filled
            ? BorderSide.none
            : BorderSide(color: borderColor, width: widget.borderWidth),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: focusedColor, width: 2),
      ),
      contentPadding: widget.contentPadding,
    );

    return SizedBox(
      width: widget.width ?? double.infinity,
      child: DropdownButtonFormField<T>(
        initialValue: _selectedValue,
        items: widget.items,
        onChanged: (T? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
          widget.onChanged?.call(newValue);
        },
        decoration: decoration,
        isExpanded: widget.isExpanded,
      ),
    );
  }
}

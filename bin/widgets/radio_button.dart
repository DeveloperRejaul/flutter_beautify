import 'package:flutter/material.dart';

class FBRadioButton<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String label;
  final TextStyle? labelStyle;
  final Color? activeColor;
  final Color? inactiveColor;
  final double size;
  final CrossAxisAlignment alignment;
  final EdgeInsetsGeometry padding;

  const FBRadioButton._({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label = '',
    this.labelStyle,
    this.activeColor,
    this.inactiveColor,
    this.size = 20.0,
    this.alignment = CrossAxisAlignment.center,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
  });

  // Default → standard
  factory FBRadioButton({
    Key? key,
    required T value,
    T? groupValue,
    ValueChanged<T?>? onChanged,
    String label = '',
    TextStyle? labelStyle,
    Color? activeColor,
    double? size,
  }) {
    return FBRadioButton.standard(
      key: key,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      label: label,
      labelStyle: labelStyle,
      activeColor: activeColor,
      size: size,
    );
  }

  // -------- STANDARD --------
  factory FBRadioButton.standard({
    Key? key,
    required T value,
    T? groupValue,
    ValueChanged<T?>? onChanged,
    String label = '',
    TextStyle? labelStyle,
    Color? activeColor,
    double? size,
  }) {
    return FBRadioButton._(
      key: key,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      label: label,
      labelStyle: labelStyle,
      activeColor: activeColor ?? Colors.blue,
      inactiveColor: Colors.grey,
      size: size ?? 20.0,
    );
  }

  // -------- OUTLINED --------
  factory FBRadioButton.outlined({
    Key? key,
    required T value,
    T? groupValue,
    ValueChanged<T?>? onChanged,
    String label = '',
    TextStyle? labelStyle,
    Color? activeColor,
    double? size,
  }) {
    return FBRadioButton._(
      key: key,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      label: label,
      labelStyle: labelStyle,
      activeColor: activeColor ?? Colors.blue,
      inactiveColor: Colors.grey.shade400,
      size: size ?? 24.0,
      padding: const EdgeInsets.all(12.0),
    );
  }

  @override
  State<FBRadioButton<T>> createState() => _FBRadioButtonState<T>();
}

class _FBRadioButtonState<T> extends State<FBRadioButton<T>> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.value == widget.groupValue;

    return Padding(
      padding: widget.padding,
      child: Row(
        crossAxisAlignment: widget.alignment,
        children: [
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: Radio<T>(
              value: widget.value,
              // ignore: deprecated_member_use
              groupValue: widget.groupValue,
              // ignore: deprecated_member_use
              onChanged: widget.onChanged,
              fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.selected)) {
                  return widget.activeColor ?? Colors.blue;
                }
                return widget.inactiveColor ?? Colors.grey;
              }),
            ),
          ),
          if (widget.label.isNotEmpty) ...[
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () => widget.onChanged?.call(widget.value),
                child: Text(
                  widget.label,
                  style: widget.labelStyle ??
                      TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.black87 : Colors.black54,
                      ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

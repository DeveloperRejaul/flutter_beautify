import 'package:flutter/material.dart';

class FBCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;
  final Color? boxColor;
  final Color? checkColor;
  final Color? errorCheckColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? errorBoxColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final FocusNode? focusNode;
  final bool? autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final bool? isError;
  final String? semanticLabel;
  final TextStyle? labelStyle;
  final bool? disable;

  const FBCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.boxColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus,
    this.shape,
    this.side,
    this.isError,
    this.semanticLabel,
    this.errorBoxColor,
    this.errorCheckColor,
    this.labelStyle,
    this.disable,
  });

  @override
  Widget build(BuildContext context) {
    final isFBError = isError ?? false;
    final isFBDisable = disable ?? false;

    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (v) {
            if (!isFBDisable) onChanged(v);
          },
          activeColor: isFBError ? errorBoxColor ?? Colors.red : boxColor,
          checkColor: isFBError ? errorCheckColor ?? Colors.white : checkColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          materialTapTargetSize: materialTapTargetSize,
          visualDensity: visualDensity,
          focusNode: focusNode,
          autofocus: autofocus ?? false,
          shape: shape,
          side: side,
          semanticLabel: semanticLabel,
          isError: isError ?? false,
        ),
        if (label != null)
          Text(
            label ?? "",
            style:
                labelStyle ??
                TextStyle(
                  color: isFBError ? (errorBoxColor ?? Colors.red) : null,
                ),
          ),
      ],
    );
  }
}

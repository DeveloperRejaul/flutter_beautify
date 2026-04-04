import 'package:flutter/material.dart';

class FBTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final Offset offset;
  final Duration showDuration;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const FBTooltip._({
    super.key,
    required this.child,
    required this.message,
    this.textStyle,
    this.backgroundColor = Colors.grey,
  })  : offset = const Offset(0, -40),
        showDuration = const Duration(milliseconds: 1500),
        borderRadius = const BorderRadius.all(Radius.circular(8)),
        padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4);

  // Default → standard
  factory FBTooltip({
    Key? key,
    required Widget child,
    required String message,
  }) {
    return FBTooltip.standard(key: key, message: message, child: child);
  }

  // -------- STANDARD --------
  factory FBTooltip.standard({
    Key? key,
    required Widget child,
    required String message,
  }) {
    return FBTooltip._(
      key: key,
      message: message,
      backgroundColor: Colors.grey.shade800,
      textStyle: const TextStyle(color: Colors.white, fontSize: 12),
      child: child,
    );
  }

  // -------- DARK --------
  factory FBTooltip.dark({
    Key? key,
    required Widget child,
    required String message,
  }) {
    return FBTooltip._(
      key: key,
      message: message,
      backgroundColor: Colors.black87,
      textStyle: const TextStyle(color: Colors.white, fontSize: 12),
      child: child,
    );
  }

  @override
  State<FBTooltip> createState() => _FBTooltipState();
}

class _FBTooltipState extends State<FBTooltip> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.message,
      showDuration: widget.showDuration,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      ),
      textStyle: widget.textStyle ?? const TextStyle(color: Colors.white),
      padding: widget.padding,
      child: widget.child,
    );
  }
}

import 'package:flutter/material.dart';

class FBTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final Offset offset;
  final Duration showDuration;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const FBTooltip._({
    super.key,
    required this.child,
    required this.message,
    this.textStyle,
    this.backgroundColor,
  }) : offset = const Offset(0, -40),
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

  // -------- STANDARD (follows the ambient Theme's inverse surface) --------
  factory FBTooltip.standard({
    Key? key,
    required Widget child,
    required String message,
  }) {
    return FBTooltip._(key: key, message: message, child: child);
  }

  // -------- DARK (deliberately always-dark, regardless of app theme) --------
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
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedBackground =
        widget.backgroundColor ?? colorScheme.inverseSurface;
    final resolvedTextStyle =
        widget.textStyle ??
        TextStyle(color: colorScheme.onInverseSurface, fontSize: 12);

    return Tooltip(
      message: widget.message,
      showDuration: widget.showDuration,
      decoration: BoxDecoration(
        color: resolvedBackground,
        borderRadius: widget.borderRadius,
      ),
      textStyle: resolvedTextStyle,
      padding: widget.padding,
      child: widget.child,
    );
  }
}

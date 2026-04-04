import 'package:flutter/material.dart';

class FBButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle style;
  final Icon? leading;

  const FBButton._({
    super.key,
    required this.onPressed,
    required this.child,
    required this.style,
    this.leading,
  });

  // Default → solid
  factory FBButton({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
    Color color = Colors.blue,
    ButtonStyle? style,
    Icon? leading,
  }) {
    return FBButton.solid(
      key: key,
      onPressed: onPressed,
      title: title,
      color: color,
      style: style,
      leading: leading,
      child: child,
    );
  }

  // -------- SOLID --------
  factory FBButton.solid({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
    Color color = Colors.blue,
    ButtonStyle? style,
    Icon? leading,
  }) {
    final base = ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    return FBButton._(
      key: key,
      onPressed: onPressed,
      style: _resolveStyle(base, style),
      leading: leading,
      child: child ?? Text(title ?? ""),
    );
  }

  // -------- OUTLINE --------
  factory FBButton.outline({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
    Color color = Colors.blue,
    ButtonStyle? style,
    Icon? leading,
  }) {
    final base = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: color,
      elevation: 0,
      side: BorderSide(color: color),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    return FBButton._(
      key: key,
      onPressed: onPressed,
      style: _resolveStyle(base, style),
      leading: leading,
      child: child ?? Text(title ?? ""),
    );
  }

  // -------- LINK --------
  factory FBButton.link({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
    Color color = Colors.blue,
    ButtonStyle? style,
    Icon? leading,
  }) {
    final base =
        ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: color,
          shadowColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ).copyWith(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
        );

    return FBButton._(
      key: key,
      onPressed: onPressed,
      style: _resolveStyle(base, style),
      leading: leading,
      child: child ?? Text(title ?? ""),
    );
  }

  // -------- STYLE RESOLVER --------
  static ButtonStyle _resolveStyle(ButtonStyle base, ButtonStyle? override) {
    if (override == null) return base;

    return base.copyWith(
      backgroundColor: override.backgroundColor,
      foregroundColor: override.foregroundColor,
      padding: override.padding,
      shape: override.shape,
      elevation: override.elevation,
      side: override.side,
      textStyle: override.textStyle,
      overlayColor: override.overlayColor,
      alignment: override.alignment,
      minimumSize: override.minimumSize,
      maximumSize: override.maximumSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: leading != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [leading!, const SizedBox(width: 8), child],
            )
          : child,
    );
  }
}

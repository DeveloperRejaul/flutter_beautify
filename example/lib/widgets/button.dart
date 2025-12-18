import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle style;
  final Icon? leading; 

  const Button._({
    super.key,
    required this.onPressed,
    required this.child,
    required this.style,
    this.leading,
  });

  // Default → solid
  factory Button({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
    Color color = Colors.blue,
    ButtonStyle? style,
    Icon? leading,
  }) {
    return Button.solid(
      key: key,
      onPressed: onPressed,
      title: title,
      child: child,
      color: color,
      style: style,
      leading: leading,
    );
  }

  // -------- SOLID --------
  factory Button.solid({
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Button._(
      key: key,
      onPressed: onPressed,
      style: _resolveStyle(base, style),
      leading: leading,
      child: child ?? Text(title ?? ""),
    );
  }

  // -------- OUTLINE --------
  factory Button.outline({
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Button._(
      key: key,
      onPressed: onPressed,
      style: _resolveStyle(base, style),
      leading: leading,
      child: child ?? Text(title ?? ""),
    );
  }

  // -------- LINK --------
  factory Button.link({
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
      shadowColor: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ).copyWith(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      elevation: MaterialStateProperty.all(0),
    );

    return Button._(
      key: key,
      onPressed: onPressed,
      style: _resolveStyle(base, style),
      leading: leading,
      child: child ?? Text(title ?? ""),
    );
  }

  // -------- STYLE RESOLVER --------
  static ButtonStyle _resolveStyle(
    ButtonStyle base,
    ButtonStyle? override,
  ) {
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
              children: [
                leading!,
                const SizedBox(width: 8),
                child,
              ],
            )
          : child,
    );
  }
}

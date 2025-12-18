import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle style;

  const Button._({
    super.key,
    required this.onPressed,
    required this.child,
    required this.style,
  });

  factory Button.solid({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
    Color color = Colors.blue,
  }) {
    return Button._(
      key: key,
      onPressed: onPressed,
      child: child ?? Text(title ?? ""),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  factory Button.outline({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
    Color color = Colors.blue,
  }) {
    return Button._(
      key: key,
      onPressed: onPressed,
      child: child ?? Text(title ?? ""),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: color,
        elevation: 0,
        side: BorderSide(color: color),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  factory Button.text({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
  }) {
    return Button._(
      key: key,
      onPressed: onPressed,
      child: child ?? Text(title ?? ""),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}

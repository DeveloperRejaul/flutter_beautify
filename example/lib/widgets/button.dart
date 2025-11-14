import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? title;

  const Button({super.key, this.onPressed, this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child ?? Text(title ?? ""),
    );
  }
}

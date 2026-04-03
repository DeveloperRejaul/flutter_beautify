import 'package:flutter/material.dart';

class FBBadge extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final TextStyle? textStyle;
  final Widget? icon;
  final BadgeSize size;

  const FBBadge._({
    super.key,
    required this.label,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.textStyle,
    this.size = BadgeSize.medium,
  }) : borderRadius = 12,
       icon = null;

  // Default → standard
  factory FBBadge({
    Key? key,
    required String label,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
  }) {
    return FBBadge.standard(
      key: key,
      label: label,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  // -------- STANDARD --------
  factory FBBadge.standard({
    Key? key,
    required String label,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
  }) {
    return FBBadge._(
      key: key,
      label: label,
      backgroundColor: backgroundColor,
      textColor: textColor,
      size: BadgeSize.medium,
    );
  }

  // -------- SMALL --------
  factory FBBadge.small({
    Key? key,
    required String label,
    Color backgroundColor = Colors.red,
  }) {
    return FBBadge._(
      key: key,
      label: label,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      size: BadgeSize.small,
    );
  }

  // -------- LARGE --------
  factory FBBadge.large({
    Key? key,
    required String label,
    Color backgroundColor = Colors.red,
  }) {
    return FBBadge._(
      key: key,
      label: label,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      size: BadgeSize.large,
    );
  }

  // -------- OUTLINED --------
  factory FBBadge.outlined({
    Key? key,
    required String label,
    Color borderColor = Colors.red,
    Color textColor = Colors.red,
  }) {
    return FBBadge._(
      key: key,
      label: label,
      backgroundColor: Colors.transparent,
      textColor: textColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      size: BadgeSize.medium,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: backgroundColor == Colors.transparent
            ? Border.all(color: textColor, width: 1)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            SizedBox(width: 4, child: icon),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style:
                textStyle ??
                TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

enum BadgeSize { small, medium, large }

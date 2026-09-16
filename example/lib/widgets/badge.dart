import 'package:flutter/material.dart';

class FBBadge extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final TextStyle? textStyle;
  final Widget? icon;
  final BadgeSize size;
  final bool outlined;

  const FBBadge._({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.textStyle,
    this.size = BadgeSize.medium,
    this.outlined = false,
  }) : borderRadius = 12,
       icon = null;

  // Default → standard
  factory FBBadge({
    Key? key,
    required String label,
    Color? backgroundColor,
    Color? textColor,
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
    Color? backgroundColor,
    Color? textColor,
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
    Color? backgroundColor,
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
    Color? backgroundColor,
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
    Color? borderColor,
    Color? textColor,
  }) {
    return FBBadge._(
      key: key,
      label: label,
      backgroundColor: borderColor,
      textColor: textColor ?? borderColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      size: BadgeSize.medium,
      outlined: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedColor = backgroundColor ?? colorScheme.error;
    final resolvedTextColor = outlined
        ? (textColor ?? resolvedColor)
        : (textColor ?? colorScheme.onError);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : resolvedColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: outlined ? Border.all(color: resolvedColor, width: 1) : null,
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
                  color: resolvedTextColor,
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

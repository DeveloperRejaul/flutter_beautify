import 'package:flutter/material.dart';

class FBCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadius borderRadius;
  final Border? border;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const FBCard._({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(8),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.border,
    this.onTap,
    this.width,
    this.height,
  });

  // Default → elevated
  factory FBCard({
    Key? key,
    required Widget child,
    Color backgroundColor = Colors.white,
    Color shadowColor = Colors.grey,
    double elevation = 2.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    EdgeInsetsGeometry margin = const EdgeInsets.all(8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    Border? border,
    VoidCallback? onTap,
    double? width,
    double? height,
  }) {
    return FBCard.elevated(
      key: key,
      child: child,
      backgroundColor: backgroundColor,
      elevation: elevation,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      onTap: onTap,
      width: width,
      height: height,
    );
  }

  // -------- ELEVATED --------
  factory FBCard.elevated({
    Key? key,
    required Widget child,
    Color backgroundColor = Colors.white,
    double elevation = 4.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    EdgeInsetsGeometry margin = const EdgeInsets.all(8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    VoidCallback? onTap,
    double? width,
    double? height,
  }) {
    return FBCard._(
      key: key,
      child: child,
      backgroundColor: backgroundColor,
      elevation: elevation,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      onTap: onTap,
      width: width,
      height: height,
    );
  }

  // -------- OUTLINED --------
  factory FBCard.outlined({
    Key? key,
    required Widget child,
    Color backgroundColor = Colors.white,
    Color borderColor = Colors.grey,
    double borderWidth = 1,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    EdgeInsetsGeometry margin = const EdgeInsets.all(8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    VoidCallback? onTap,
    double? width,
    double? height,
  }) {
    return FBCard._(
      key: key,
      child: child,
      backgroundColor: backgroundColor,
      elevation: 0,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      border: Border.all(color: borderColor, width: borderWidth),
      onTap: onTap,
      width: width,
      height: height,
    );
  }

  // -------- FLAT --------
  factory FBCard.flat({
    Key? key,
    required Widget child,
    Color backgroundColor = const Color(0xFFF5F5F5),
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    EdgeInsetsGeometry margin = const EdgeInsets.all(8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
    VoidCallback? onTap,
    double? width,
    double? height,
  }) {
    return FBCard._(
      key: key,
      child: child,
      backgroundColor: backgroundColor,
      elevation: 0,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      onTap: onTap,
      width: width,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = Card(
      color: backgroundColor,
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: border?.bottom ?? BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: card,
      );
    }

    return card;
  }
}

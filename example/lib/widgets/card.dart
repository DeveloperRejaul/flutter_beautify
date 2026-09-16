import 'package:flutter/material.dart';

enum _FBCardVariant { elevated, outlined, flat }

class FBCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadius borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final _FBCardVariant _variant;

  const FBCard._({
    super.key,
    required this.child,
    required _FBCardVariant variant,
    this.backgroundColor,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(8),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.borderColor,
    this.borderWidth = 1,
    this.onTap,
    this.width,
    this.height,
  }) : _variant = variant;

  // Default → elevated
  factory FBCard({
    Key? key,
    required Widget child,
    Color? backgroundColor,
    double elevation = 2.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    EdgeInsetsGeometry margin = const EdgeInsets.all(8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    VoidCallback? onTap,
    double? width,
    double? height,
  }) {
    return FBCard.elevated(
      key: key,
      backgroundColor: backgroundColor,
      elevation: elevation,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      onTap: onTap,
      width: width,
      height: height,
      child: child,
    );
  }

  // -------- ELEVATED --------
  factory FBCard.elevated({
    Key? key,
    required Widget child,
    Color? backgroundColor,
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
      variant: _FBCardVariant.elevated,
      backgroundColor: backgroundColor,
      elevation: elevation,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      onTap: onTap,
      width: width,
      height: height,
      child: child,
    );
  }

  // -------- OUTLINED --------
  factory FBCard.outlined({
    Key? key,
    required Widget child,
    Color? backgroundColor,
    Color? borderColor,
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
      variant: _FBCardVariant.outlined,
      backgroundColor: backgroundColor,
      elevation: 0,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      onTap: onTap,
      width: width,
      height: height,
      child: child,
    );
  }

  // -------- FLAT --------
  factory FBCard.flat({
    Key? key,
    required Widget child,
    Color? backgroundColor,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    EdgeInsetsGeometry margin = const EdgeInsets.all(8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
    VoidCallback? onTap,
    double? width,
    double? height,
  }) {
    return FBCard._(
      key: key,
      variant: _FBCardVariant.flat,
      backgroundColor: backgroundColor,
      elevation: 0,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      onTap: onTap,
      width: width,
      height: height,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedBackground =
        backgroundColor ??
        (_variant == _FBCardVariant.flat
            ? colorScheme.surfaceContainerHighest
            : colorScheme.surface);
    final resolvedBorder = _variant == _FBCardVariant.outlined
        ? Border.all(
            color: borderColor ?? colorScheme.outline,
            width: borderWidth,
          )
        : null;

    final card = Card(
      color: resolvedBackground,
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: resolvedBorder?.bottom ?? BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: resolvedBorder,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(onTap: onTap, borderRadius: borderRadius, child: card);
    }

    return card;
  }
}

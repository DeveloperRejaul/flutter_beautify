import 'package:flutter/material.dart';

enum _FBButtonVariant { solid, outline, link }

class FBButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? color;
  final ButtonStyle? styleOverride;
  final Icon? leading;
  final _FBButtonVariant _variant;

  const FBButton._({
    super.key,
    required this.onPressed,
    required this.child,
    required _FBButtonVariant variant,
    this.color,
    this.styleOverride,
    this.leading,
  }) : _variant = variant;

  // Default → solid
  factory FBButton({
    Key? key,
    required VoidCallback? onPressed,
    String? title,
    Widget? child,
    Color? color,
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
    Color? color,
    ButtonStyle? style,
    Icon? leading,
  }) {
    return FBButton._(
      key: key,
      onPressed: onPressed,
      variant: _FBButtonVariant.solid,
      color: color,
      styleOverride: style,
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
    Color? color,
    ButtonStyle? style,
    Icon? leading,
  }) {
    return FBButton._(
      key: key,
      onPressed: onPressed,
      variant: _FBButtonVariant.outline,
      color: color,
      styleOverride: style,
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
    Color? color,
    ButtonStyle? style,
    Icon? leading,
  }) {
    return FBButton._(
      key: key,
      onPressed: onPressed,
      variant: _FBButtonVariant.link,
      color: color,
      styleOverride: style,
      leading: leading,
      child: child ?? Text(title ?? ""),
    );
  }

  // -------- BASE STYLE (per variant, resolved against the ambient Theme) --------
  ButtonStyle _baseStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedColor = color ?? colorScheme.primary;

    switch (_variant) {
      case _FBButtonVariant.solid:
        return ElevatedButton.styleFrom(
          backgroundColor: resolvedColor,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      case _FBButtonVariant.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: resolvedColor,
          elevation: 0,
          side: BorderSide(color: resolvedColor),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      case _FBButtonVariant.link:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: resolvedColor,
          shadowColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ).copyWith(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
        );
    }
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
      style: _resolveStyle(_baseStyle(context), styleOverride),
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

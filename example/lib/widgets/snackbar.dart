import 'package:flutter/material.dart';

class FBSnackbar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? onAction,
    String? actionLabel,
    Color? backgroundColor,
    Color? textColor,
    double? elevation,
    EdgeInsets margin = const EdgeInsets.all(0),
    ShapeBorder? shape,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedBackground = backgroundColor ?? colorScheme.inverseSurface;
    final resolvedText = textColor ?? colorScheme.onInverseSurface;

    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: resolvedText)),
      duration: duration,
      backgroundColor: resolvedBackground,
      action: actionLabel != null
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onAction ?? () {},
              textColor: resolvedText,
            )
          : null,
      elevation: elevation,
      margin: margin,
      shape: shape,
      behavior: behavior,
    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> success(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return show(
      context,
      message: message,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
      backgroundColor: Colors.green,
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> error(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return show(
      context,
      message: message,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
      backgroundColor: Theme.of(context).colorScheme.error,
      textColor: Theme.of(context).colorScheme.onError,
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> warning(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return show(
      context,
      message: message,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
      backgroundColor: Colors.orange,
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> info(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return show(
      context,
      message: message,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
      backgroundColor: Theme.of(context).colorScheme.primary,
      textColor: Theme.of(context).colorScheme.onPrimary,
    );
  }
}

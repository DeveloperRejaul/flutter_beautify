import 'package:flutter/material.dart';

class FBDialog {
  // -------- ALERT --------
  static Future<T?> alert<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText = 'OK',
    VoidCallback? onPressed,
    bool barrierDismissible = false,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onPressed?.call();
            },
            child: Text(buttonText ?? 'OK'),
          ),
        ],
      ),
    );
  }

  // -------- CONFIRMATION --------
  static Future<T?> confirmation<T>({
    required BuildContext context,
    required String title,
    required String message,
    String positiveButtonText = 'Yes',
    String negativeButtonText = 'No',
    VoidCallback? onPositive,
    VoidCallback? onNegative,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onNegative?.call();
            },
            child: Text(
              negativeButtonText,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onPositive?.call();
            },
            child: Text(positiveButtonText),
          ),
        ],
      ),
    );
  }

  // -------- CUSTOM --------
  static Future<T?> custom<T>({
    required BuildContext context,
    required Widget title,
    required Widget content,
    List<Widget>? actions,
    bool barrierDismissible = true,
    ShapeBorder? shape,
    EdgeInsets? insetPadding,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => AlertDialog(
        shape:
            shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: title,
        content: content,
        actions: actions ?? [],
        insetPadding:
            insetPadding ??
            const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      ),
    );
  }

  // Deprecated: Use alert() instead
  @Deprecated('Use alert() instead')
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? positiveButtonText,
    String? negativeButtonText,
    VoidCallback? onPositive,
    VoidCallback? onNegative,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (negativeButtonText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onNegative?.call();
              },
              child: Text(
                negativeButtonText,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          if (positiveButtonText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onPositive?.call();
              },
              child: Text(positiveButtonText),
            ),
        ],
      ),
    );
  }

  // Deprecated: Use custom() instead
  @Deprecated('Use custom() instead')
  static Future<T?> showCustom<T>({
    required BuildContext context,
    required Widget title,
    required Widget content,
    List<Widget>? actions,
    bool barrierDismissible = true,
    ShapeBorder? shape,
    EdgeInsets? insetPadding,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => AlertDialog(
        shape:
            shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: title,
        content: content,
        actions: actions ?? [],
        insetPadding:
            insetPadding ??
            const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      ),
    );
  }
}

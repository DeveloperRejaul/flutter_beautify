import 'package:flutter/material.dart';

class FBBottomSheet {
  // -------- STANDARD --------
  static Future<T?> standard<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isDismissible = true,
    bool enableDrag = true,
    double? height,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) => Container(
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            if (title != null) ...[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(height: 1),
            ],
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  // -------- SCROLLABLE --------
  static Future<T?> scrollable<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isDismissible = true,
    double? height,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 0.95,
        minChildSize: 0.25,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              if (title != null) ...[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(height: 1),
              ],
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -------- FULLSCREEN --------
  static Future<T?> fullscreen<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    VoidCallback? onClose,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(title ?? 'Options'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
              onClose?.call();
            },
          ),
        ),
        body: child,
      ),
    );
  }
}

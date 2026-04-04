import 'package:flutter/material.dart';

class FBToast {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    ToastPosition position = ToastPosition.bottom,
    Color backgroundColor = const Color(0xFF333333),
    Color textColor = Colors.white,
    double fontSize = 14,
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
    double? maxWidth,
  }) {
    _overlayEntry?.remove();

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: position == ToastPosition.bottom ? 50 : null,
        top: position == ToastPosition.top ? 50 : null,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: FadeInOutToast(
            duration: duration,
            onDismiss: () => _overlayEntry?.remove(),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: maxWidth ?? double.infinity,
              ),
              padding: padding,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: fontSize),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  static void success(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      context,
      message: message,
      duration: duration,
      backgroundColor: Colors.green,
    );
  }

  static void error(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      duration: duration,
      backgroundColor: Colors.red,
    );
  }

  static void warning(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      duration: duration,
      backgroundColor: Colors.orange,
    );
  }

  static void dismiss() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

enum ToastPosition { top, bottom }

class FadeInOutToast extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback? onDismiss;

  const FadeInOutToast({
    super.key,
    required this.child,
    required this.duration,
    this.onDismiss,
  });

  @override
  State<FadeInOutToast> createState() => _FadeInOutToastState();
}

class _FadeInOutToastState extends State<FadeInOutToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          widget.onDismiss?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}

import 'package:flutter/material.dart';

class FBCircularProgress extends StatefulWidget {
  final double value; // 0.0 to 1.0, null for indeterminate
  final double size;
  final double strokeWidth;
  final Color backgroundColor;
  final Color valueColor;
  final String? label;
  final TextStyle? labelStyle;
  final bool isIndeterminate;

  const FBCircularProgress._({
    super.key,
    required this.value,
    this.size = 80,
    this.strokeWidth = 4,
    this.valueColor = Colors.blue,
    this.label,
    this.labelStyle,
    this.isIndeterminate = false,
  }) : backgroundColor = const Color(0xFFE0E0E0);

  // Default → standard
  factory FBCircularProgress({
    Key? key,
    required double value,
    double size = 80,
  }) {
    return FBCircularProgress.standard(key: key, value: value, size: size);
  }

  // -------- STANDARD --------
  factory FBCircularProgress.standard({
    Key? key,
    required double value,
    double size = 80,
    Color valueColor = Colors.blue,
  }) {
    return FBCircularProgress._(
      key: key,
      value: value,
      size: size,
      strokeWidth: 4,
      valueColor: valueColor,
    );
  }

  // -------- WITH LABEL --------
  factory FBCircularProgress.withLabel({
    Key? key,
    required double value,
    double size = 100,
    Color valueColor = Colors.blue,
  }) {
    return FBCircularProgress._(
      key: key,
      value: value,
      size: size,
      strokeWidth: 5,
      valueColor: valueColor,
      label: '${(value * 100).toStringAsFixed(0)}%',
      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  // -------- SPINNER/LOADING --------
  factory FBCircularProgress.spinner({
    Key? key,
    double size = 80,
    Color valueColor = Colors.blue,
    double strokeWidth = 4,
  }) {
    return FBCircularProgress._(
      key: key,
      value: 0,
      size: size,
      strokeWidth: strokeWidth,
      valueColor: valueColor,
      isIndeterminate: true,
    );
  }

  @override
  State<FBCircularProgress> createState() => _FBCircularProgressState();
}

class _FBCircularProgressState extends State<FBCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.isIndeterminate) {
      _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      )..repeat();
    }
  }

  @override
  void dispose() {
    if (widget.isIndeterminate) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isIndeterminate) {
      return SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: CircularProgressIndicator(
                strokeWidth: widget.strokeWidth,
                backgroundColor: widget.backgroundColor,
                valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
              ),
            ),
            if (widget.label != null)
              Text(
                widget.label!,
                style:
                    widget.labelStyle ??
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      );
    }

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: widget.value,
            strokeWidth: widget.strokeWidth,
            backgroundColor: widget.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
          ),
          if (widget.label != null)
            Text(
              widget.label!,
              style:
                  widget.labelStyle ??
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FBLinearProgress extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final double height;
  final Color backgroundColor;
  final Color valueColor;
  final BorderRadius borderRadius;
  final String? label;
  final bool showValue;

  const FBLinearProgress._({
    super.key,
    required this.value,
    this.height = 6,
    required this.backgroundColor,
    required this.valueColor,
    required this.borderRadius,
    this.label,
    this.showValue = false,
  });

  // Default → standard
  factory FBLinearProgress({
    Key? key,
    required double value,
    double height = 6,
  }) {
    return FBLinearProgress.standard(key: key, value: value, height: height);
  }

  // -------- STANDARD --------
  factory FBLinearProgress.standard({
    Key? key,
    required double value,
    double height = 6,
    Color valueColor = Colors.blue,
  }) {
    return FBLinearProgress._(
      key: key,
      value: value,
      height: height,
      backgroundColor: Colors.grey.shade300,
      valueColor: valueColor,
      borderRadius: BorderRadius.circular(3),
    );
  }

  // -------- WITH LABEL --------
  factory FBLinearProgress.withLabel({
    Key? key,
    required double value,
    String? label,
    double height = 8,
    Color valueColor = Colors.blue,
  }) {
    return FBLinearProgress._(
      key: key,
      value: value,
      height: height,
      backgroundColor: Colors.grey.shade300,
      valueColor: valueColor,
      borderRadius: BorderRadius.circular(4),
      label: label,
      showValue: true,
    );
  }

  // -------- STRIPED --------
  factory FBLinearProgress.striped({
    Key? key,
    required double value,
    double height = 8,
    Color valueColor = Colors.blue,
  }) {
    return FBLinearProgress._(
      key: key,
      value: value,
      height: height,
      backgroundColor: Colors.grey.shade200,
      valueColor: valueColor,
      borderRadius: BorderRadius.circular(4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (showValue)
                  Text(
                    '${(value * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
              ],
            ),
          ),
        ClipRRect(
          borderRadius: borderRadius,
          child: LinearProgressIndicator(
            value: value,
            minHeight: height,
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class FBLinearProgress extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final double height;
  final Color? backgroundColor;
  final Color? valueColor;
  final BorderRadius borderRadius;
  final String? label;
  final bool showValue;

  const FBLinearProgress._({
    super.key,
    required this.value,
    this.height = 6,
    this.backgroundColor,
    this.valueColor,
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
    Color? valueColor,
    Color? backgroundColor,
  }) {
    return FBLinearProgress._(
      key: key,
      value: value,
      height: height,
      valueColor: valueColor,
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.circular(3),
    );
  }

  // -------- WITH LABEL --------
  factory FBLinearProgress.withLabel({
    Key? key,
    required double value,
    String? label,
    double height = 8,
    Color? valueColor,
  }) {
    return FBLinearProgress._(
      key: key,
      value: value,
      height: height,
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
    Color? valueColor,
  }) {
    return FBLinearProgress._(
      key: key,
      value: value,
      height: height,
      valueColor: valueColor,
      borderRadius: BorderRadius.circular(4),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedValueColor = valueColor ?? colorScheme.primary;
    final resolvedBackground =
        backgroundColor ?? colorScheme.surfaceContainerHighest;

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
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (showValue)
                  Text(
                    '${(value * 100).toStringAsFixed(0)}%',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: resolvedValueColor,
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
            backgroundColor: resolvedBackground,
            valueColor: AlwaysStoppedAnimation<Color>(resolvedValueColor),
          ),
        ),
      ],
    );
  }
}

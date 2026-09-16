import 'package:flutter/material.dart';

class FBSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double height;
  final bool showValue;
  final String Function(double)? valueFormatter;

  const FBSlider._({
    super.key,
    required this.value,
    this.onChanged,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.height = 8.0,
    this.showValue = true,
    this.valueFormatter,
  });

  // Default → standard
  factory FBSlider({
    Key? key,
    required double value,
    ValueChanged<double>? onChanged,
    double min = 0.0,
    double max = 100.0,
    int? divisions,
    String? label,
    Color? activeColor,
  }) {
    return FBSlider.standard(
      key: key,
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      label: label,
      activeColor: activeColor,
    );
  }

  // -------- STANDARD --------
  factory FBSlider.standard({
    Key? key,
    required double value,
    ValueChanged<double>? onChanged,
    double min = 0.0,
    double max = 100.0,
    int? divisions,
    String? label,
    Color? activeColor,
  }) {
    return FBSlider._(
      key: key,
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      label: label,
      activeColor: activeColor,
      thumbColor: activeColor,
      height: 6.0,
      showValue: true,
    );
  }

  // -------- DISCRETE --------
  factory FBSlider.discrete({
    Key? key,
    required double value,
    ValueChanged<double>? onChanged,
    double min = 0.0,
    double max = 100.0,
    int divisions = 10,
    String? label,
    Color? activeColor,
  }) {
    return FBSlider._(
      key: key,
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      label: label,
      activeColor: activeColor,
      thumbColor: activeColor,
      height: 8.0,
      showValue: true,
      valueFormatter: (val) => val.toStringAsFixed(0),
    );
  }

  // -------- COLORED --------
  factory FBSlider.colored({
    Key? key,
    required double value,
    ValueChanged<double>? onChanged,
    double min = 0.0,
    double max = 100.0,
    required Color activeColor,
    Color? inactiveColor,
  }) {
    return FBSlider._(
      key: key,
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      thumbColor: activeColor,
      height: 8.0,
      showValue: true,
    );
  }

  @override
  State<FBSlider> createState() => _FBSliderState();
}

class _FBSliderState extends State<FBSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  void didUpdateWidget(FBSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _currentValue = widget.value;
    }
  }

  String _formatValue(double value) {
    if (widget.valueFormatter != null) {
      return widget.valueFormatter!(value);
    }
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedActive = widget.activeColor ?? colorScheme.primary;
    final resolvedInactive =
        widget.inactiveColor ?? colorScheme.surfaceContainerHighest;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showValue)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.label != null)
                Text(
                  widget.label!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              Text(
                _formatValue(_currentValue),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: resolvedActive,
                ),
              ),
            ],
          ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: widget.height,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 10.0,
              elevation: 4.0,
            ),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
          ),
          child: Slider(
            value: _currentValue,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            label: widget.label ?? _formatValue(_currentValue),
            activeColor: resolvedActive,
            inactiveColor: resolvedInactive,
            onChanged: (double newValue) {
              setState(() {
                _currentValue = newValue;
              });
              widget.onChanged?.call(newValue);
            },
          ),
        ),
      ],
    );
  }
}

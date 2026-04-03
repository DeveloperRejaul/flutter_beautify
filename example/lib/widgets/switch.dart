import 'package:flutter/material.dart';

class FBSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String label;
  final String? subtitle;
  final TextStyle? labelStyle;
  final TextStyle? subtitleStyle;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? trackActiveColor;
  final Color? trackInactiveColor;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment alignment;
  final bool enabled;

  const FBSwitch._({
    super.key,
    required this.value,
    this.onChanged,
    this.label = '',
    this.subtitle,
    this.labelStyle,
    this.subtitleStyle,
    this.activeColor,
    this.inactiveColor,
    this.trackActiveColor,
    this.trackInactiveColor,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.alignment = MainAxisAlignment.spaceBetween,
    this.enabled = true,
  });

  // Default → standard
  factory FBSwitch({
    Key? key,
    required bool value,
    ValueChanged<bool>? onChanged,
    String label = '',
    String? subtitle,
    TextStyle? labelStyle,
    Color? activeColor,
  }) {
    return FBSwitch.standard(
      key: key,
      value: value,
      onChanged: onChanged,
      label: label,
      subtitle: subtitle,
      labelStyle: labelStyle,
      activeColor: activeColor,
    );
  }

  // -------- STANDARD --------
  factory FBSwitch.standard({
    Key? key,
    required bool value,
    ValueChanged<bool>? onChanged,
    String label = '',
    String? subtitle,
    TextStyle? labelStyle,
    Color? activeColor,
  }) {
    return FBSwitch._(
      key: key,
      value: value,
      onChanged: onChanged,
      label: label,
      subtitle: subtitle,
      labelStyle: labelStyle,
      activeColor: activeColor ?? Colors.blue,
      inactiveColor: Colors.grey.shade400,
      trackActiveColor: (activeColor ?? Colors.blue).withOpacity(0.5),
      trackInactiveColor: Colors.grey.shade300,
      enabled: true,
    );
  }

  // -------- TILE --------
  factory FBSwitch.tile({
    Key? key,
    required bool value,
    ValueChanged<bool>? onChanged,
    String label = '',
    String? subtitle,
    TextStyle? labelStyle,
    TextStyle? subtitleStyle,
    Color? activeColor,
  }) {
    return FBSwitch._(
      key: key,
      value: value,
      onChanged: onChanged,
      label: label,
      subtitle: subtitle,
      labelStyle: labelStyle,
      subtitleStyle: subtitleStyle,
      activeColor: activeColor ?? Colors.blue,
      inactiveColor: Colors.grey.shade400,
      trackActiveColor: (activeColor ?? Colors.blue).withOpacity(0.5),
      trackInactiveColor: Colors.grey.shade300,
      padding: const EdgeInsets.all(12.0),
      alignment: MainAxisAlignment.spaceBetween,
      enabled: true,
    );
  }

  // -------- ANDROID --------
  factory FBSwitch.android({
    Key? key,
    required bool value,
    ValueChanged<bool>? onChanged,
    String label = '',
    String? subtitle,
    TextStyle? labelStyle,
    Color? activeColor,
  }) {
    return FBSwitch._(
      key: key,
      value: value,
      onChanged: onChanged,
      label: label,
      subtitle: subtitle,
      labelStyle: labelStyle,
      activeColor: activeColor ?? Colors.green,
      inactiveColor: Colors.grey.shade500,
      trackActiveColor: (activeColor ?? Colors.green).withOpacity(0.6),
      trackInactiveColor: Colors.grey.shade400,
      enabled: true,
    );
  }

  @override
  State<FBSwitch> createState() => _FBSwitchState();
}

class _FBSwitchState extends State<FBSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(FBSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        mainAxisAlignment: widget.alignment,
        children: [
          if (widget.label.isNotEmpty)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style:
                        widget.labelStyle ??
                        const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle!,
                      style:
                          widget.subtitleStyle ??
                          TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ],
              ),
            ),
          Switch(
            value: _value,
            onChanged: widget.enabled
                ? (bool newValue) {
                    setState(() {
                      _value = newValue;
                    });
                    widget.onChanged?.call(newValue);
                  }
                : null,
            activeColor: widget.activeColor ?? Colors.blue,
            inactiveThumbColor: widget.inactiveColor ?? Colors.grey.shade400,
            activeTrackColor: widget.trackActiveColor,
            inactiveTrackColor: widget.trackInactiveColor,
          ),
        ],
      ),
    );
  }
}

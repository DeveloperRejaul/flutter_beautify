import 'package:flutter/material.dart';

class FBAccordion extends StatefulWidget {
  final List<AccordionItem> items;
  final bool allowMultipleOpen;
  final BorderRadius borderRadius;
  final Color? backgroundColor;
  final Color? expandedBackgroundColor;

  const FBAccordion._({
    super.key,
    required this.items,
    this.allowMultipleOpen = false,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor,
    this.expandedBackgroundColor,
  });

  // Default → standard
  factory FBAccordion({
    Key? key,
    required List<AccordionItem> items,
    bool allowMultipleOpen = false,
  }) {
    return FBAccordion.standard(
      key: key,
      items: items,
      allowMultipleOpen: allowMultipleOpen,
    );
  }

  // -------- STANDARD --------
  factory FBAccordion.standard({
    Key? key,
    required List<AccordionItem> items,
    bool allowMultipleOpen = false,
    Color? backgroundColor,
    Color? expandedBackgroundColor,
  }) {
    return FBAccordion._(
      key: key,
      items: items,
      allowMultipleOpen: allowMultipleOpen,
      backgroundColor: backgroundColor,
      expandedBackgroundColor: expandedBackgroundColor,
      borderRadius: BorderRadius.zero,
    );
  }

  // -------- OUTLINED --------
  factory FBAccordion.outlined({
    Key? key,
    required List<AccordionItem> items,
    bool allowMultipleOpen = false,
    Color? expandedBackgroundColor,
  }) {
    return FBAccordion._(
      key: key,
      items: items,
      allowMultipleOpen: allowMultipleOpen,
      backgroundColor: Colors.transparent,
      expandedBackgroundColor: expandedBackgroundColor,
      borderRadius: BorderRadius.zero,
    );
  }

  @override
  State<FBAccordion> createState() => _FBAccordionState();
}

class _FBAccordionState extends State<FBAccordion> {
  late List<bool> _isExpanded;
  late List<ExpansibleController> _controllers;

  @override
  void initState() {
    super.initState();
    _isExpanded = List<bool>.filled(widget.items.length, false);
    _controllers = List.generate(
      widget.items.length,
      (index) => ExpansibleController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = widget.backgroundColor ?? colorScheme.surface;
    final expandedBackgroundColor =
        widget.expandedBackgroundColor ?? colorScheme.surfaceContainerHighest;

    return Column(
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        final isExpanded = _isExpanded[index];

        return Container(
          decoration: BoxDecoration(
            color: isExpanded ? expandedBackgroundColor : backgroundColor,
            borderRadius: widget.borderRadius,
            border: Border(
              bottom: BorderSide(color: colorScheme.outlineVariant),
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              controller: _controllers[index],
              shape: const Border(),
              collapsedShape: const Border(),
              title: item.title,
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded[index] = expanded;
                  if (expanded && !widget.allowMultipleOpen) {
                    for (int i = 0; i < _isExpanded.length; i++) {
                      if (i != index && _isExpanded[i]) {
                        _controllers[i].collapse();
                        _isExpanded[i] = false;
                      }
                    }
                  }
                });
              },
              children: [
                Padding(padding: const EdgeInsets.all(16), child: item.content),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AccordionItem {
  final Widget title;
  final Widget content;

  AccordionItem({required this.title, required this.content});
}

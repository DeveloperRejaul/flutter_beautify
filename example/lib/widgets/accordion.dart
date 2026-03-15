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
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.backgroundColor = Colors.white,
    this.expandedBackgroundColor = const Color(0xFFF5F5F5),
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
  }) {
    return FBAccordion._(
      key: key,
      items: items,
      allowMultipleOpen: allowMultipleOpen,
      backgroundColor: Colors.white,
      expandedBackgroundColor: const Color(0xFFF5F5F5),
    );
  }

  // -------- OUTLINED --------
  factory FBAccordion.outlined({
    Key? key,
    required List<AccordionItem> items,
    bool allowMultipleOpen = false,
  }) {
    return FBAccordion._(
      key: key,
      items: items,
      allowMultipleOpen: allowMultipleOpen,
      backgroundColor: Colors.transparent,
      expandedBackgroundColor: Colors.blue.shade50,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }

  @override
  State<FBAccordion> createState() => _FBAccordionState();
}

class _FBAccordionState extends State<FBAccordion> {
  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = List<bool>.filled(widget.items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        final isExpanded = _isExpanded[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: isExpanded ? widget.expandedBackgroundColor : widget.backgroundColor,
            borderRadius: widget.borderRadius,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ExpansionTile(
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            onExpansionChanged: (expanded) {
              setState(() {
                if (!widget.allowMultipleOpen) {
                  for (int i = 0; i < _isExpanded.length; i++) {
                    _isExpanded[i] = i == index && expanded;
                  }
                } else {
                  _isExpanded[index] = expanded;
                }
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: item.content,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class AccordionItem {
  final String title;
  final Widget content;

  AccordionItem({required this.title, required this.content});
}

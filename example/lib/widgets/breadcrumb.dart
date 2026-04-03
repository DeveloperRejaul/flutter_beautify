import 'package:flutter/material.dart';

class FBBreadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final Widget separator;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;
  final EdgeInsetsGeometry padding;

  const FBBreadcrumb._({
    super.key,
    required this.items,
    required this.separator,
    this.textStyle,
    this.activeTextStyle,
  }) : padding = const EdgeInsets.symmetric(vertical: 12);

  // Default → standard
  factory FBBreadcrumb({Key? key, required List<BreadcrumbItem> items}) {
    return FBBreadcrumb.standard(key: key, items: items);
  }

  // -------- STANDARD --------
  factory FBBreadcrumb.standard({
    Key? key,
    required List<BreadcrumbItem> items,
  }) {
    return FBBreadcrumb._(
      key: key,
      items: items,
      separator: const Text(' / ', style: TextStyle(color: Colors.grey)),
      textStyle: const TextStyle(color: Colors.grey, fontSize: 12),
      activeTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // -------- ARROW --------
  factory FBBreadcrumb.arrow({Key? key, required List<BreadcrumbItem> items}) {
    return FBBreadcrumb._(
      key: key,
      items: items,
      separator: const Icon(
        Icons.arrow_forward_ios,
        size: 12,
        color: Colors.grey,
      ),
      textStyle: const TextStyle(color: Colors.grey, fontSize: 12),
      activeTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(items.length * 2 - 1, (index) {
            if (index.isEven) {
              final itemIndex = index ~/ 2;
              final item = items[itemIndex];
              final isActive = itemIndex == items.length - 1;

              return InkWell(
                onTap: item.onTap,
                child: Text(
                  item.label,
                  style: isActive ? activeTextStyle : textStyle,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: separator,
              );
            }
          }),
        ),
      ),
    );
  }
}

class BreadcrumbItem {
  final String label;
  final VoidCallback? onTap;

  BreadcrumbItem({required this.label, this.onTap});
}

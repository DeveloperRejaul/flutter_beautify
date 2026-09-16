import 'package:flutter/material.dart';

enum _FBBreadcrumbSeparator { slash, arrow }

class FBBreadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final _FBBreadcrumbSeparator _separator;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;
  final EdgeInsetsGeometry padding;

  const FBBreadcrumb._({
    super.key,
    required this.items,
    required _FBBreadcrumbSeparator separator,
    this.textStyle,
    this.activeTextStyle,
  }) : _separator = separator,
       padding = const EdgeInsets.symmetric(vertical: 12);

  // Default → standard
  factory FBBreadcrumb({Key? key, required List<BreadcrumbItem> items}) {
    return FBBreadcrumb.standard(key: key, items: items);
  }

  // -------- STANDARD --------
  factory FBBreadcrumb.standard({
    Key? key,
    required List<BreadcrumbItem> items,
    TextStyle? textStyle,
    TextStyle? activeTextStyle,
  }) {
    return FBBreadcrumb._(
      key: key,
      items: items,
      separator: _FBBreadcrumbSeparator.slash,
      textStyle: textStyle,
      activeTextStyle: activeTextStyle,
    );
  }

  // -------- ARROW --------
  factory FBBreadcrumb.arrow({
    Key? key,
    required List<BreadcrumbItem> items,
    TextStyle? textStyle,
    TextStyle? activeTextStyle,
  }) {
    return FBBreadcrumb._(
      key: key,
      items: items,
      textStyle: textStyle,
      activeTextStyle: activeTextStyle,
      separator: _FBBreadcrumbSeparator.arrow,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedTextStyle =
        textStyle ??
        TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 12);
    final resolvedActiveStyle =
        activeTextStyle ??
        TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        );
    final separator = _separator == _FBBreadcrumbSeparator.arrow
        ? Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: colorScheme.onSurfaceVariant,
          )
        : Text(' / ', style: TextStyle(color: colorScheme.onSurfaceVariant));

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
                  style: isActive ? resolvedActiveStyle : resolvedTextStyle,
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

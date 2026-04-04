import 'package:flutter/material.dart';

class FBAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final bool showBackButton;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double toolbarHeight;
  final EdgeInsets contentPadding;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final ShapeBorder? shape;

  const FBAppBar({
    super.key,
    this.title = '',
    this.titleWidget,
    this.actions,
    this.onBackPressed,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
    this.elevation = 0.0,
    this.showBackButton = true,
    this.leading,
    this.bottom,
    this.toolbarHeight = kToolbarHeight,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.titleStyle,
    this.centerTitle = false,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          Text(
            title,
            style: titleStyle ??
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: foregroundColor,
                ),
          ),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      leading: leading ??
          (showBackButton
              ? BackButton(
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                )
              : null),
      actions: actions,
      bottom: bottom,
      toolbarHeight: toolbarHeight,
      centerTitle: centerTitle,
      shape: shape,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (bottom?.preferredSize.height ?? 0));
}

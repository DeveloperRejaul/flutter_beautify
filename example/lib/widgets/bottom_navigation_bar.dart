import 'package:flutter/material.dart';

class FBBottomNavigationBar extends StatefulWidget {
  final List<BottomNavItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? backgroundColor;
  final double elevation;

  const FBBottomNavigationBar._({
    super.key,
    required this.items,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    this.elevation = 8,
  });

  // Default → standard
  factory FBBottomNavigationBar({
    Key? key,
    required List<BottomNavItem> items,
    int selectedIndex = 0,
    ValueChanged<int>? onItemSelected,
  }) {
    return FBBottomNavigationBar.standard(
      key: key,
      items: items,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
    );
  }

  // -------- STANDARD --------
  factory FBBottomNavigationBar.standard({
    Key? key,
    required List<BottomNavItem> items,
    int selectedIndex = 0,
    ValueChanged<int>? onItemSelected,
    Color? activeColor,
    Color? inactiveColor,
    Color? backgroundColor,
  }) {
    return FBBottomNavigationBar._(
      key: key,
      items: items,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      backgroundColor: backgroundColor,
    );
  }

  // -------- ELEVATED --------
  factory FBBottomNavigationBar.elevated({
    Key? key,
    required List<BottomNavItem> items,
    int selectedIndex = 0,
    ValueChanged<int>? onItemSelected,
    Color? activeColor,
  }) {
    return FBBottomNavigationBar._(
      key: key,
      items: items,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
      activeColor: activeColor,
      elevation: 16,
    );
  }

  @override
  State<FBBottomNavigationBar> createState() => _FBBottomNavigationBarState();
}

class _FBBottomNavigationBarState extends State<FBBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      items: widget.items.map((item) {
        return BottomNavigationBarItem(
          icon: item.icon,
          activeIcon: item.activeIcon ?? item.icon,
          label: item.label,
        );
      }).toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: widget.activeColor ?? colorScheme.primary,
      unselectedItemColor: widget.inactiveColor ?? colorScheme.onSurfaceVariant,
      backgroundColor: widget.backgroundColor ?? colorScheme.surface,
      elevation: widget.elevation,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onItemSelected?.call(index);
      },
    );
  }
}

class BottomNavItem {
  final Widget icon;
  final Widget? activeIcon;
  final String label;

  BottomNavItem({required this.icon, this.activeIcon, required this.label});
}

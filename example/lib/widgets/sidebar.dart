import 'package:flutter/material.dart';

class FBSidebar extends StatefulWidget {
  final List<SidebarItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final double width;
  final bool collapsible;
  final bool isCollapsed;
  final ValueChanged<bool>? onCollapsedChanged;

  const FBSidebar._({
    super.key,
    required this.items,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.width = 250,
    this.collapsible = false,
    this.isCollapsed = false,
    this.onCollapsedChanged,
  });

  // Default → standard
  factory FBSidebar({
    Key? key,
    required List<SidebarItem> items,
    int selectedIndex = 0,
    ValueChanged<int>? onItemSelected,
  }) {
    return FBSidebar.standard(
      key: key,
      items: items,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
    );
  }

  // -------- STANDARD --------
  factory FBSidebar.standard({
    Key? key,
    required List<SidebarItem> items,
    int selectedIndex = 0,
    ValueChanged<int>? onItemSelected,
    Color activeColor = Colors.blue,
  }) {
    return FBSidebar._(
      key: key,
      items: items,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
      activeColor: activeColor,
      width: 250,
    );
  }

  // -------- COLLAPSIBLE --------
  factory FBSidebar.collapsible({
    Key? key,
    required List<SidebarItem> items,
    int selectedIndex = 0,
    ValueChanged<int>? onItemSelected,
    bool isCollapsed = false,
    ValueChanged<bool>? onCollapsedChanged,
    Color activeColor = Colors.blue,
  }) {
    return FBSidebar._(
      key: key,
      items: items,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
      activeColor: activeColor,
      collapsible: true,
      isCollapsed: isCollapsed,
      onCollapsedChanged: onCollapsedChanged,
      width: 250,
    );
  }

  // -------- DARK --------
  factory FBSidebar.dark({
    Key? key,
    required List<SidebarItem> items,
    int selectedIndex = 0,
    ValueChanged<int>? onItemSelected,
  }) {
    return FBSidebar._(
      key: key,
      items: items,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
      activeColor: Colors.blueAccent,
      inactiveColor: Colors.grey.shade400,
      backgroundColor: Colors.grey.shade900,
      width: 250,
    );
  }

  @override
  State<FBSidebar> createState() => _FBSidebarState();
}

class _FBSidebarState extends State<FBSidebar> {
  late int _selectedIndex;
  late bool _isCollapsed;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _isCollapsed = widget.isCollapsed;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveWidth = _isCollapsed ? 80.0 : widget.width;

    return Container(
      width: effectiveWidth,
      color: widget.backgroundColor,
      child: Column(
        children: [
          if (widget.collapsible)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  _isCollapsed ? Icons.menu : Icons.close,
                  color: widget.activeColor,
                ),
                onPressed: () {
                  setState(() {
                    _isCollapsed = !_isCollapsed;
                  });
                  widget.onCollapsedChanged?.call(_isCollapsed);
                },
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = index == _selectedIndex;

                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onItemSelected?.call(index);
                  },
                  child: Container(
                    color: isSelected
                        ? widget.activeColor.withOpacity(0.1)
                        : null,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    child: _isCollapsed
                        ? Tooltip(
                            message: item.label,
                            child: Icon(
                              item.icon,
                              color: isSelected
                                  ? widget.activeColor
                                  : widget.inactiveColor,
                            ),
                          )
                        : Row(
                            children: [
                              Icon(
                                item.icon,
                                color: isSelected
                                    ? widget.activeColor
                                    : widget.inactiveColor,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  item.label,
                                  style: TextStyle(
                                    color: isSelected
                                        ? widget.activeColor
                                        : widget.inactiveColor,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  SidebarItem({required this.icon, required this.label, this.onTap});
}

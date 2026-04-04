import 'package:flutter/material.dart';

class FBTabs extends StatefulWidget {
  final List<TabItem> tabs;
  final int initialIndex;
  final TabBarPosition position;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final bool isScrollable;

  const FBTabs._({
    super.key,
    required this.tabs,
    this.initialIndex = 0,
    this.position = TabBarPosition.top,
    this.activeColor = Colors.blue,
    this.isScrollable = false,
  }) : inactiveColor = Colors.grey,
       backgroundColor = Colors.white;

  // Default → standard
  factory FBTabs({
    Key? key,
    required List<TabItem> tabs,
    int initialIndex = 0,
  }) {
    return FBTabs.standard(key: key, tabs: tabs, initialIndex: initialIndex);
  }

  // -------- STANDARD --------
  factory FBTabs.standard({
    Key? key,
    required List<TabItem> tabs,
    int initialIndex = 0,
    Color activeColor = Colors.blue,
  }) {
    return FBTabs._(
      key: key,
      tabs: tabs,
      initialIndex: initialIndex,
      activeColor: activeColor,
      position: TabBarPosition.top,
    );
  }

  // -------- SCROLLABLE --------
  factory FBTabs.scrollable({
    Key? key,
    required List<TabItem> tabs,
    int initialIndex = 0,
    Color activeColor = Colors.blue,
  }) {
    return FBTabs._(
      key: key,
      tabs: tabs,
      initialIndex: initialIndex,
      activeColor: activeColor,
      position: TabBarPosition.top,
      isScrollable: true,
    );
  }

  @override
  State<FBTabs> createState() => _FBTabsState();
}

class _FBTabsState extends State<FBTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: widget.isScrollable,
          labelColor: widget.activeColor,
          unselectedLabelColor: widget.inactiveColor,
          indicatorColor: widget.activeColor,
          tabs: widget.tabs.map((tab) => Tab(text: tab.label)).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabs.map((tab) => tab.content).toList(),
          ),
        ),
      ],
    );
  }
}

class TabItem {
  final String label;
  final Widget content;

  TabItem({required this.label, required this.content});
}

enum TabBarPosition { top, bottom }

import 'package:flutter/material.dart';

import '../widgets/sidebar.dart';

class SidebarExample extends StatefulWidget {
  const SidebarExample({super.key});

  @override
  State<SidebarExample> createState() => _SidebarExampleState();
}

class _SidebarExampleState extends State<SidebarExample> {
  int _selectedIndex = 0;
  bool _isCollapsed = false;

  final _pages = [
    const Center(child: Text('Dashboard', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Users', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Products', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Reports', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FBSidebar Example')),
      body: Row(
        children: [
          FBSidebar.collapsible(
            items: [
              SidebarItem(icon: Icons.dashboard, label: 'Dashboard'),
              SidebarItem(icon: Icons.people, label: 'Users'),
              SidebarItem(icon: Icons.shopping_bag, label: 'Products'),
              SidebarItem(icon: Icons.assessment, label: 'Reports'),
              SidebarItem(icon: Icons.settings, label: 'Settings'),
            ],
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            isCollapsed: _isCollapsed,
            onCollapsedChanged: (collapsed) {
              setState(() {
                _isCollapsed = collapsed;
              });
            },
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

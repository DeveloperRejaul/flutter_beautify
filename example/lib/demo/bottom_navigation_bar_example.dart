import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  final _pages = [
    const Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Search', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Add', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBBottomNavigationBar Example'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: FBBottomNavigationBar(
        items: [
          BottomNavItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavItem(
            icon: const Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavItem(
            icon: const Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

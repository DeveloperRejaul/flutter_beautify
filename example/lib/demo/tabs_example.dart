import 'package:flutter/material.dart';

import '../widgets/tabs.dart';

class TabsExample extends StatelessWidget {
  const TabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TabItem(
        label: 'Home',
        content: const Center(
          child: Text('Home Content', style: TextStyle(fontSize: 18)),
        ),
      ),
      TabItem(
        label: 'Profile',
        content: const Center(
          child: Text('Profile Content', style: TextStyle(fontSize: 18)),
        ),
      ),
      TabItem(
        label: 'Settings',
        content: const Center(
          child: Text('Settings Content', style: TextStyle(fontSize: 18)),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('FBTabs Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FBTabs(
              tabs: tabs,
              initialIndex: 0,
            ),
          ),
        ],
      ),
    );
  }
}

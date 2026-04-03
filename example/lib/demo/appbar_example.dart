import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class AppbarExample extends StatefulWidget {
  const AppbarExample({super.key});

  @override
  State<AppbarExample> createState() => _AppbarExampleState();
}

class _AppbarExampleState extends State<AppbarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FBAppBar(
        title: 'AppBar Example',
        backgroundColor: Colors.blue,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Search tapped')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('More options tapped')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FBAppBar Features:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('✓ Customizable title and background'),
                      Text('✓ Built-in back button'),
                      Text('✓ Action buttons support'),
                      Text('✓ Custom elevation'),
                      Text('✓ Flexible styling'),
                    ],
                  ),
                ),
                const Text(
                  'The FBAppBar widget provides a flexible and customizable AppBar for Flutter applications.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/bottom_sheet.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FBBottomSheet Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Bottom Sheet',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                FBBottomSheet.standard(
                  context: context,
                  title: 'Options',
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text('Edit'),
                        onTap: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text('Delete'),
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show Standard'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Scrollable Bottom Sheet',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                FBBottomSheet.scrollable(
                  context: context,
                  title: 'Scrollable Content',
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Item $index'),
                        onTap: () => Navigator.pop(context),
                      );
                    },
                  ),
                );
              },
              child: const Text('Show Scrollable'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Fullscreen Bottom Sheet',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                FBBottomSheet.fullscreen(
                  context: context,
                  title: 'Settings',
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const ListTile(title: Text('Setting 1')),
                      const ListTile(title: Text('Setting 2')),
                      const ListTile(title: Text('Setting 3')),
                    ],
                  ),
                );
              },
              child: const Text('Show Fullscreen'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/avatar.dart';

class AvatarExample extends StatelessWidget {
  const AvatarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBAvatar Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Circular Avatar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              spacing: 16,
              children: [
                FBAvatar.circular(
                  initials: 'JD',
                  size: 48,
                  backgroundColor: Colors.blue,
                ),
                FBAvatar.circular(
                  initials: 'AK',
                  size: 56,
                  backgroundColor: Colors.red,
                ),
                FBAvatar.circular(
                  initials: 'MJ',
                  size: 64,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Square Avatar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              spacing: 16,
              children: [
                FBAvatar.square(
                  initials: 'AB',
                  size: 48,
                  backgroundColor: Colors.purple,
                ),
                FBAvatar.square(
                  initials: 'CD',
                  size: 56,
                  backgroundColor: Colors.orange,
                ),
                FBAvatar.square(
                  initials: 'EF',
                  size: 64,
                  backgroundColor: Colors.teal,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Rounded Avatar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              spacing: 16,
              children: [
                FBAvatar.rounded(
                  initials: 'GH',
                  size: 48,
                  backgroundColor: Colors.indigo,
                ),
                FBAvatar.rounded(
                  initials: 'IJ',
                  size: 56,
                  backgroundColor: Colors.cyan,
                ),
                FBAvatar.rounded(
                  initials: 'KL',
                  size: 64,
                  backgroundColor: Colors.pink,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

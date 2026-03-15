import 'package:flutter/material.dart';

import '../widgets/badge.dart';

class BadgeExample extends StatelessWidget {
  const BadgeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBBadge Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Badges',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FBBadge(label: 'New'),
                FBBadge(
                  label: 'Hot',
                  backgroundColor: Colors.orange,
                ),
                FBBadge(
                  label: 'Sale',
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Small Badges',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FBBadge.small(label: 'NEW'),
                FBBadge.small(label: 'HOT', backgroundColor: Colors.orange),
                FBBadge.small(label: 'SALE', backgroundColor: Colors.red),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Large Badges',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FBBadge.large(label: 'Premium'),
                FBBadge.large(
                  label: 'Featured',
                  backgroundColor: Colors.blue,
                ),
                FBBadge.large(
                  label: 'Trending',
                  backgroundColor: Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Outlined Badges',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FBBadge.outlined(label: 'Info'),
                FBBadge.outlined(
                  label: 'Success',
                  borderColor: Colors.green,
                  textColor: Colors.green,
                ),
                FBBadge.outlined(
                  label: 'Warning',
                  borderColor: Colors.orange,
                  textColor: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

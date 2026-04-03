import 'package:flutter/material.dart';

import '../widgets/breadcrumb.dart';

class BreadcrumbExample extends StatelessWidget {
  const BreadcrumbExample({super.key});

  @override
  Widget build(BuildContext context) {
    final breadcrumbs = [
      BreadcrumbItem(label: 'Home'),
      BreadcrumbItem(label: 'Products'),
      BreadcrumbItem(label: 'Electronics'),
      BreadcrumbItem(label: 'Phones'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('FBBreadcrumb Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Breadcrumb',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBBreadcrumb(items: breadcrumbs),
            const SizedBox(height: 32),
            const Text(
              'Arrow Breadcrumb',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBBreadcrumb.arrow(items: breadcrumbs),
            const SizedBox(height: 32),
            const Text(
              'Breadcrumb with Actions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBBreadcrumb(
              items: [
                BreadcrumbItem(
                  label: 'Home',
                  onTap: () => print('Home tapped'),
                ),
                BreadcrumbItem(
                  label: 'Products',
                  onTap: () => print('Products tapped'),
                ),
                BreadcrumbItem(
                  label: 'Electronics',
                  onTap: () => print('Electronics tapped'),
                ),
                BreadcrumbItem(label: 'Phones'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

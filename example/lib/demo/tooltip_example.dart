import 'package:flutter/material.dart';

import '../widgets/tooltip.dart';

class TooltipExample extends StatelessWidget {
  const TooltipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBTooltip Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Tooltip',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Center(
              child: FBTooltip(
                message: 'This is a helpful tooltip',
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Hover here',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              'Dark Tooltip',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Center(
              child: FBTooltip.dark(
                message: 'This is a dark tooltip',
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.info, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              'Tooltip on Different Widgets',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FBTooltip(
                  message: 'Settings button',
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ),
                FBTooltip(
                  message: 'Refresh data',
                  child: IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {},
                  ),
                ),
                FBTooltip(
                  message: 'Delete item',
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/switch.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool _standardValue = false;
  bool _tileValue = false;
  bool _androidValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FBSwitch Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Switch',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBSwitch(
              value: _standardValue,
              onChanged: (value) {
                setState(() {
                  _standardValue = value;
                });
              },
              label: 'Notifications',
              subtitle: 'Enable notifications',
            ),
            const SizedBox(height: 32),
            const Text(
              'Tile Switch',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBSwitch.tile(
              value: _tileValue,
              onChanged: (value) {
                setState(() {
                  _tileValue = value;
                });
              },
              label: 'Dark Mode',
              subtitle: 'Enable dark theme',
            ),
            const SizedBox(height: 32),
            const Text(
              'Android Switch',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBSwitch.android(
              value: _androidValue,
              onChanged: (value) {
                setState(() {
                  _androidValue = value;
                });
              },
              label: 'WiFi',
              subtitle: 'Connect to WiFi',
            ),
          ],
        ),
      ),
    );
  }
}

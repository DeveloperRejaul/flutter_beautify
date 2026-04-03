import 'package:flutter/material.dart';

import '../widgets/slider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _standardValue = 50;
  double _discreteValue = 5;
  double _coloredValue = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FBSlider Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Slider',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBSlider(
              value: _standardValue,
              onChanged: (value) {
                setState(() {
                  _standardValue = value;
                });
              },
              min: 0,
              max: 100,
              label: 'Volume',
            ),
            const SizedBox(height: 32),
            const Text(
              'Discrete Slider (Steps)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBSlider.discrete(
              value: _discreteValue,
              onChanged: (value) {
                setState(() {
                  _discreteValue = value;
                });
              },
              min: 0,
              max: 10,
              divisions: 10,
              label: 'Rating',
            ),
            const SizedBox(height: 32),
            const Text(
              'Colored Slider',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            FBSlider.colored(
              value: _coloredValue,
              onChanged: (value) {
                setState(() {
                  _coloredValue = value;
                });
              },
              min: 0,
              max: 100,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

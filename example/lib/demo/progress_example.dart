import 'package:flutter/material.dart';

import '../widgets/circular_progress.dart';
import '../widgets/linear_progress.dart';

class ProgressExample extends StatefulWidget {
  const ProgressExample({super.key});

  @override
  State<ProgressExample> createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  double _circularProgress = 0.65;
  double _linearProgress = 0.45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBProgress Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Circular Progress',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FBCircularProgress(
                      value: 0.35,
                      size: 80,
                    ),
                    FBCircularProgress(
                      value: 0.65,
                      size: 100,
                    ),
                    FBCircularProgress.withLabel(
                      value: _circularProgress,
                      size: 120,
                      valueColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _circularProgress = (_circularProgress + 0.1).clamp(0.0, 1.0);
                      });
                    },
                    child: const Text('Increase'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _circularProgress = (_circularProgress - 0.1).clamp(0.0, 1.0);
                      });
                    },
                    child: const Text('Decrease'),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              const Text(
                'Circular Progress Spinner (Loading)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FBCircularProgress.spinner(
                      size: 60,
                    ),
                    FBCircularProgress.spinner(
                      size: 80,
                      valueColor: Colors.green,
                    ),
                    FBCircularProgress.spinner(
                      size: 100,
                      valueColor: Colors.red,
                      strokeWidth: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                'Linear Progress',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              FBLinearProgress.standard(
                value: 0.3,
                height: 6,
              ),
              const SizedBox(height: 24),
              FBLinearProgress.withLabel(
                value: _linearProgress,
                label: 'Download',
                height: 8,
              ),
              const SizedBox(height: 24),
              FBLinearProgress.striped(
                value: 0.75,
                height: 8,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _linearProgress = (_linearProgress + 0.1).clamp(0.0, 1.0);
                      });
                    },
                    child: const Text('Progress'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

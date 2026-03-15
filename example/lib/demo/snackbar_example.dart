import 'package:flutter/material.dart';
import '../widgets/snackbar.dart';

class SnackbarExample extends StatefulWidget {
  const SnackbarExample({super.key});

  @override
  State<SnackbarExample> createState() => _SnackbarExampleState();
}

class _SnackbarExampleState extends State<SnackbarExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {
                  FBSnackbar.show(
                    context,
                    message: 'This is a basic snackbar message',
                  );
                },
                child: const Text('Basic Snackbar'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  FBSnackbar.success(
                    context,
                    message: 'Operation completed successfully! ✓',
                  );
                },
                child: const Text('Success Snackbar'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  FBSnackbar.error(
                    context,
                    message: 'An error occurred! ✗',
                  );
                },
                child: const Text('Error Snackbar'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                  FBSnackbar.warning(
                    context,
                    message: 'Warning: Please check your input!',
                  );
                },
                child: const Text('Warning Snackbar'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  FBSnackbar.info(
                    context,
                    message: 'Information: New update available',
                  );
                },
                child: const Text('Info Snackbar'),
              ),
              ElevatedButton(
                onPressed: () {
                  FBSnackbar.show(
                    context,
                    message: 'Snackbar with action',
                    actionLabel: 'Undo',
                    onAction: () {
                      FBSnackbar.show(
                        context,
                        message: 'Action was undone',
                      );
                    },
                  );
                },
                child: const Text('Snackbar with Action'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/dialog.dart';

class DialogExample extends StatefulWidget {
  const DialogExample({super.key});

  @override
  State<DialogExample> createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
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
                  FBDialog.show(
                    context: context,
                    title: 'Simple Dialog',
                    message: 'This is a simple dialog with title and message',
                    positiveButtonText: 'OK',
                    onPositive: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('OK pressed')),
                      );
                    },
                  );
                },
                child: const Text('Simple Dialog'),
              ),
              ElevatedButton(
                onPressed: () {
                  FBDialog.show(
                    context: context,
                    title: 'Confirm Action',
                    message: 'Are you sure you want to proceed?',
                    positiveButtonText: 'Yes',
                    negativeButtonText: 'No',
                    onPositive: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Action confirmed')),
                      );
                    },
                    onNegative: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Action cancelled')),
                      );
                    },
                  );
                },
                child: const Text('Confirmation Dialog'),
              ),
              ElevatedButton(
                onPressed: () {
                  FBDialog.showCustom(
                    context: context,
                    title: const Text('Custom Dialog'),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 48),
                        SizedBox(height: 16),
                        Text('Operation completed successfully!'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
                child: const Text('Custom Dialog'),
              ),
              ElevatedButton(
                onPressed: () {
                  FBDialog.show(
                    context: context,
                    title: 'Delete Item',
                    message: 'This action cannot be undone.',
                    positiveButtonText: 'Delete',
                    negativeButtonText: 'Cancel',
                    onPositive: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item deleted')),
                      );
                    },
                    barrierDismissible: false,
                  );
                },
                child: const Text('Non-Dismissible Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

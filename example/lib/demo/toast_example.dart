import 'package:flutter/material.dart';
import '../widgets/toast.dart';

class ToastExample extends StatefulWidget {
  const ToastExample({super.key});

  @override
  State<ToastExample> createState() => _ToastExampleState();
}

class _ToastExampleState extends State<ToastExample> {
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
                  FBToast.show(
                    context,
                    message: 'This is a basic toast message',
                  );
                },
                child: const Text('Basic Toast'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  FBToast.success(
                    context,
                    message: 'Success! Operation completed',
                  );
                },
                child: const Text('Success Toast'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  FBToast.error(
                    context,
                    message: 'Error! Something went wrong',
                  );
                },
                child: const Text('Error Toast'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                  FBToast.warning(
                    context,
                    message: 'Warning: Check your input',
                  );
                },
                child: const Text('Warning Toast'),
              ),
              ElevatedButton(
                onPressed: () {
                  FBToast.show(
                    context,
                    message: 'Toast at top',
                    position: ToastPosition.top,
                  );
                },
                child: const Text('Top Toast'),
              ),
              ElevatedButton(
                onPressed: () {
                  FBToast.show(
                    context,
                    message: 'Long duration toast',
                    duration: const Duration(seconds: 4),
                  );
                },
                child: const Text('Long Duration Toast'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/accordion.dart';

class AccordionExample extends StatelessWidget {
  const AccordionExample({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      AccordionItem(
        title: const Text(
          'What is Flutter?',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: const Text(
          'Flutter is an open-source UI software development kit created by Google. '
          'It is used to develop cross platform applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
        ),
      ),
      AccordionItem(
        title: const Text(
          'What is Dart?',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: const Text(
          'Dart is a programming language optimized for multi-platform development. '
          'Dart is a language optimized for building fast apps on any platform.',
        ),
      ),
      AccordionItem(
        title: const Text(
          'How to learn Flutter?',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: const Text(
          'You can learn Flutter by following the official documentation, '
          'watching tutorials on YouTube, and practicing by building real projects.',
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('FBAccordion Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Accordion',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: FBAccordion.standard(
                items: items,
                allowMultipleOpen: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/card.dart';

class CardExample extends StatefulWidget {
  const CardExample({super.key});

  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Simple card
        FBCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Simple Card',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              const Text('This is a simple card with default styling.'),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Elevated card
        FBCard(
          elevation: 8,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Elevated Card',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              const Text('This card has high elevation for more depth.'),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Clickable card
        FBCard(
          elevation: 4,
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Card tapped!')));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Clickable Card',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              const Text('Tap this card to see action'),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Card with image
        FBCard(
          padding: EdgeInsets.zero,
          elevation: 6,
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Image Area',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card with Image',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const Text('This card has custom content layout.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/theme.dart';

class ButtonExample extends StatefulWidget {
  const ButtonExample({super.key});

  @override
  State<ButtonExample> createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: <Widget>[
        const Text('You have pushed the button this many times:'),
        Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),

        // No `color` passed → picks up the ambient Theme's primary color
        // automatically (FBTheme.lightTheme()/darkTheme() if you're using it).
        FBButton.solid(
          onPressed: () {
            _incrementCounter();
          },
          leading: const Icon(Icons.save, size: 20),
          child: const Text("Solid Button"),
        ),
        // Pass `color` to override per-button — use FBColors instead of a
        // raw Material color so it stays in sync with your palette.
        FBButton.outline(
          title: "Outline Button",
          onPressed: () {
            _incrementCounter();
          },
          color: FBColors.accent,
        ),
        FBButton.link(
          title: "Link Button",
          onPressed: () {
            _incrementCounter();
          },
          color: FBColors.accent,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/button.dart';

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

        // apply widgets
        FBButton.solid(
          onPressed: () {
            _incrementCounter();
          },
          color: Colors.deepOrange,
          leading: const Icon(Icons.save, size: 20),
          child: const Text("Solid Button"),
        ),
        FBButton.outline(
          title: "Outline Button",
          onPressed: () {
            _incrementCounter();
          },
          color: Colors.deepOrange,
        ),
        FBButton.link(
          title: "Link Button",
          onPressed: () {
            _incrementCounter();
          },
          color: Colors.deepOrange,
        ),
      ],
    );
  }
}

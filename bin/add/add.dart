import 'dart:io';
import './button.dart';

Future<void> handleAdd(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: flutter_beautify add [name]');
    print('Available: button');
    exit(1);
  }

  final name = args[0];

  switch (name) {
    case 'button':
      await createButton(name);
      break;
    default:
      print('Unknown add target: $name');
      print('Available: button');
      exit(1);
  }
}

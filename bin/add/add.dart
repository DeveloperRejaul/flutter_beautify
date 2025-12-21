import 'dart:io';
import '../utils/create.dart';

final Create create = Create();


Future<void> handleAdd(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: flutter_beautify add [name]');
    exit(1);
  }

  final name = args[0];

  switch (name) {
    case 'button':
      await create.widget(name);
      break;
    case 'checkbox':
      await create.widget(name);
      break;
    default:
      print('Unknown add target: $name');
      exit(1);
  }
}

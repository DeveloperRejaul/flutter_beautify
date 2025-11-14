import 'dart:io';
import 'add/add.dart';

void main(List<String> args) async {
  if (args.isEmpty) {
    _printUsage();
    exit(0);
  }

  final command = args.first;

  switch (command) {
    case 'add':
      await handleAdd(args.skip(1).toList());
      break;
    case 'hello':
      print('👋 Hello from flutter_beautify!');
      break;
    case 'version':
      print('flutter_beautify version 1.0.0');
      break;
    case 'help':
      _printUsage();
      break;
    default:
      print('Unknown command: $command');
      _printUsage();
      exit(1);
  }
}

void _printUsage() {
  print('''
Usage: flutter_beautify <command> [args]

Commands:
  add <thing> [name]   Add a thing to your project. Available: button
  hello                Quick hello message
  version              Print version
  help                 Show this message
''');
}

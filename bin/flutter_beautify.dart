import 'dart:io';
import 'add/add.dart';
import 'init/init.dart';

void main(List<String> args) async {
  if (args.isEmpty) {
    _printUsage();
    exit(0);
  }

  final command = args.first;

  switch (command) {
    case 'init':
      final configManager = ConfigManager();
      await configManager.init();
      break;
    case 'config':
      final configManager = ConfigManager();
      await configManager.showConfig();
      break;
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
╔════════════════════════════════════════════════════════════════╗
║         🎨 Flutter Beautify - Beautiful Widget CLI             ║
╚════════════════════════════════════════════════════════════════╝

Usage: flutter_beautify <command> [args]

Available Commands:
  init                     Initialize Flutter Beautify configuration
  config                   Show current configuration
  add <component>          Add a component to your project
  version                  Print version
  help                     Show this message

Run "flutter_beautify add" with no component to see the full list.

Examples:
  flutter_beautify init
  flutter_beautify config
  flutter_beautify add button
  flutter_beautify add checkbox
  flutter_beautify add textfield

📚 Documentation: https://github.com/DeveloperRejaul/flutter_beautify
''');
}

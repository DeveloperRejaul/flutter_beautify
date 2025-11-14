import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: my_cli_tool <command>');
    exit(0);
  }

  final command = args.first;

  switch (command) {
    case 'hello':
      print('👋 Hello from my_cli_tool!');
      break;
    case 'version':
      print('my_cli_tool version 1.0.0');
      break;
    default:
      print('Unknown command: $command');
      exit(1);
  }
}

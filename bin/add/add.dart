import 'dart:io';
import '../utils/create.dart';

final Create create = Create();

const validComponents = [
  'button',
  'checkbox',
  'textfield',
  'card',
  'dialog',
  'snackbar',
  'toast',
  'appbar',
  'dropdown',
  'date-picker',
  'radio-button',
  'slider',
  'switch',
  'bottom-sheet',
  'accordion',
  'avatar',
  'badge',
  'breadcrumb',
  'circular-progress',
  'linear-progress',
  'tooltip',
  'tabs',
  'pagination',
  'bottom-navigation-bar',
  'sidebar',
  'calendar',
  'theme',
  'responsive',
];

Future<void> handleAdd(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: flutter_beautify add <component>');
    print('');
    print('Available components:');
    for (var comp in validComponents) {
      print('  • $comp');
    }
    exit(1);
  }

  final name = args[0];

  if (!validComponents.contains(name)) {
    print('❌ Unknown component: $name');
    print('');
    print('Available components:');
    for (var comp in validComponents) {
      print('  • $comp');
    }
    exit(1);
  }

  await create.widget(name);
}

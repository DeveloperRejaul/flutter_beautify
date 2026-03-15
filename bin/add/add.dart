import 'dart:io';
import '../utils/create.dart';

final Create create = Create();

Future<void> handleAdd(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: flutter_beautify add <component>');
    print('');
    print('Available components:');
    print('  • button');
    print('  • checkbox');
    print('  • textfield');
    print('  • card');
    print('  • dialog');
    print('  • snackbar');
    print('  • toast');
    print('  • appbar');
    print('  • dropdown');
    print('  • date-picker');
    print('  • radio-button');
    print('  • slider');
    print('  • switch');
    print('  • bottom-sheet');
    print('  • accordion');
    print('  • avatar');
    print('  • badge');
    print('  • breadcrumb');
    print('  • circular-progress');
    print('  • linear-progress');
    print('  • tooltip');
    print('  • tabs');
    print('  • pagination');
    print('  • bottom-navigation-bar');
    print('  • sidebar');
    print('  • calendar');
    exit(1);
  }

  final name = args[0];

  final validComponents = [
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
  ];

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

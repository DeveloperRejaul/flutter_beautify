import 'dart:io';
import 'package:flutter_beautify/src/resource_locator.dart';
import 'string.dart';
import '../init/init.dart';

class Create {
  Future<void> widget(String name) async {
    final fileName = toSnakeCase(name);

    final config = await ConfigManager().loadConfig();
    final widgetPath = (config['widgetPath'] as String?) ?? 'lib/widgets';
    final dir = Directory(widgetPath);

    if (!await dir.exists()) {
      await dir.create(recursive: true);
      print('Created directory: ${dir.path}');
    }

    final newFile = File('${dir.path}/$fileName.dart');
    if (await newFile.exists()) {
      print('File already exists: ${newFile.path}');
      print('Aborting. Remove the file if you want to overwrite.');
      return;
    }

    final templateFile = File(
      '${(await templatesDir()).path}/$fileName.dart',
    );
    if (!await templateFile.exists()) {
      print('Template file missing: ${templateFile.path}');
      exit(1);
    }

    final content = await templateFile.readAsString();
    await newFile.writeAsString(content);

    final importPath = widgetPath.startsWith('lib/')
        ? widgetPath.substring(4)
        : widgetPath;

    print('Created $fileName widget from template: ${newFile.path}');
    print("Import it: import 'package:your_package/$importPath/$fileName.dart';");
  }
}

import 'dart:io';

class Create {
  final dir = Directory('lib/widgets');

  Future<void> widget(String name) async {
    // crate directory if not exists
    if (!await _isDirExists()) {
      await dir.create(recursive: true);
      print('Created directory: ${dir.path}');
    }

    // Create a new file in the widget directory
    if (await _isWidgetExists(name)) {
      return;
    }

    // Create a new file in the widget directory
    if (!await _isDataExists(name)) {
      return;
    }

    // read template content
    String content = await _read(name);
    await _write(name, content);

    print('Created $name widget from template: ${dir.path}/$name.dart');
    print("Import it: import 'package:your_package/widgets/$name.dart';");
  }

  Future<bool> _isDirExists() async {
    return await dir.exists();
  }

  Future<bool> _isWidgetExists(String name) async {
    final filename = '$name.dart';
    final newFile = File('${dir.path}/$filename');

    if (await newFile.exists()) {
      print('File already exists: ${newFile.path}');
      print('Aborting. Remove the file if you want to overwrite.');
      return true;
    }

    return false;
  }

  Future<bool> _isDataExists(String name) async {
    // source template file
    final templateFile = File('example/lib/widgets/$name.dart');

    if (!await templateFile.exists()) {
      print('Template file missing: ${templateFile.path}');
      return false;
    }
    return true;
  }

  Future<String> _read(String name) async {
    final templateFile = File('example/lib/widgets/$name.dart');
    return await templateFile.readAsString();
  }

  Future<void> _write(String name, String content) async {
    final filename = '$name.dart';
    final newFile = File('${dir.path}/$filename');
    await newFile.writeAsString(content);
  }
}

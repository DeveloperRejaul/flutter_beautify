import 'dart:io';

Future<void> createButton(String name) async {
  final dir = Directory('lib/widgets');

  if (!await dir.exists()) {
    await dir.create(recursive: true);
    print('Created directory: ${dir.path}');
  }

  final filename = 'button.dart';
  final newFile = File('${dir.path}/$filename');

  if (await newFile.exists()) {
    print('File already exists: ${newFile.path}');
    print('Aborting. Remove the file if you want to overwrite.');
    return;
  }

  // source template file
  final templateFile = File('example/lib/widgets/button.dart');

  if (!await templateFile.exists()) {
    print('Template file missing: ${templateFile.path}');
    return;
  }

  // read template content
  String content = await templateFile.readAsString();

  // replace placeholders in template
  // content = content
  //     .replaceAll('{{className}}', '${pascal}Button')
  //     .replaceAll('{{buttonText}}', pascal);

  // write to new file
  await newFile.writeAsString(content);

  print('Created button widget from template: ${newFile.path}');
  print("Import it: import 'package:your_package/widgets/$filename';");
}

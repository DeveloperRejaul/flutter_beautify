import 'dart:io';
import 'dart:isolate';

/// Resolves the root directory of the installed flutter_beautify package.
///
/// The CLI must find its own bundled component templates regardless of the
/// caller's current working directory, since `flutter_beautify` is typically
/// run from inside a *different* Flutter project after being globally
/// activated. `Isolate.resolvePackageUri` looks the package up through the
/// package config embedded at build time, so it works whether the package
/// is activated from a path, git, or pub.dev source.
Future<Directory> packageRoot() async {
  final libUri = await Isolate.resolvePackageUri(
    Uri.parse('package:flutter_beautify/src/resource_locator.dart'),
  );

  if (libUri == null) {
    throw StateError('Unable to locate the flutter_beautify package root.');
  }

  // libUri -> <packageRoot>/lib/src/resource_locator.dart
  return File.fromUri(libUri).parent.parent.parent;
}

/// Directory containing the widget templates shipped with the package.
Future<Directory> templatesDir() async {
  final root = await packageRoot();
  return Directory('${root.path}/example/lib/widgets');
}

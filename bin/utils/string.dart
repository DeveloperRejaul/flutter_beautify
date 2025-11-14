String toSnakeCase(String input) {
  var s = input.replaceAll(RegExp(r'[\s\-]+'), '_');
  s = s.replaceAllMapped(RegExp(r'(?<=[a-z0-9])([A-Z])'), (m) => '_${m[1]}');
  return s.toLowerCase();
}

String toPascalCase(String input) {
  final parts = input
      .split(RegExp(r'[_\-\s]+'))
      .where((p) => p.isNotEmpty)
      .toList();
  return parts.map((p) => p[0].toUpperCase() + p.substring(1)).join();
}

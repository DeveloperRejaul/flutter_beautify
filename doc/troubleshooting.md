---
layout: default
title: Troubleshooting
nav_order: 9
---

# Troubleshooting

Common issues and solutions when using Flutter Beautify.

## Installation Issues

### Issue: Command not found after installation

**Solution:**
Verify the installation and check your PATH:

```bash
# Check if flutter_beautify is installed
dart pub global list | grep flutter_beautify

# Add to PATH if missing (macOS/Linux)
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Verify
flutter_beautify --version
```

### Issue: Activation fails with "pub.dev" error

**Solution:**
Install from source instead:

```bash
git clone https://github.com/DeveloperRejaul/flutter_beautify.git
cd flutter_beautify
dart pub global activate --source path .
```

---

## CLI Issues

### Issue: `flutter_beautify init` creates wrong paths

**Solution:**
Manually edit `.flutter_beautify.yaml`:

```yaml
widgets_path: lib/widgets
utils_path: lib/utils
demo_path: lib/demo
```

Then reinitialize:

```bash
flutter_beautify init --force
```

### Issue: `flutter_beautify add` fails with "component not found"

**Solution:**
Check available components:

```bash
flutter_beautify help add
```

List all supported components:

```bash
flutter_beautify list
```

---

## Build Issues

### Issue: "Cannot find widget" error

**Solution:**
Ensure your paths are correct in `.flutter_beautify.yaml` and regenerate:

```bash
flutter_beautify add button --force
flutter pub get
```

### Issue: Duplicate widget declarations

**Solution:**
Remove existing files before regenerating:

```bash
rm lib/widgets/button.dart
flutter_beautify add button
```

---

## Component Import Errors

### Issue: Cannot import generated widgets

**Error:**
```
Error: Target of URI doesn't exist: 'package:your_app/widgets/button.dart'.
```

**Solution:**
1. Ensure component was generated: `flutter_beautify add button`
2. Run `flutter pub get`
3. Check file path matches import statement
4. Clean and rebuild:

```bash
flutter clean
flutter pub get
flutter run
```

---

## Customization Issues

### Issue: Component styling not applying

**Solution:**
Ensure you're using the correct factory method:

```dart
// ✅ Correct - uses factory method
FBButton.solid(label: 'Click', onPressed: () {})

// ❌ Wrong - direct instantiation
Button(label: 'Click')
```

### Issue: Colors don't change

**Solution:**
Check if theme is overriding your custom colors:

```dart
// Add explicit color to override theme
FBButton.solid(
  label: 'Button',
  onPressed: () {},
  backgroundColor: Colors.red,  // Explicit color
)
```

---

## Performance Issues

### Issue: App running slowly with many components

**Solution:**
1. Use `const` constructors where possible
2. Implement proper widget lifecycle
3. Use appropriate factory methods for your use case

```dart
// ✅ Good - constant constructor
const FBButton.solid(label: 'Regular Button')

// Better - only rebuild when needed
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FBCard.basic(child: Text('Content'));
  }
}
```

---

## Getting Help

If these solutions don't help:

1. **Check existing issues:** [GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)
2. **Read the docs:** [Flutter Beautify Documentation](/doc/)
3. **Report a bug:** [Create an Issue](https://github.com/DeveloperRejaul/flutter_beautify/issues/new)
4. **Join our community:** Check contributing guidelines

---

**Still stuck?** See [Contributing Guide](/CONTRIBUTING.md) for support channels →

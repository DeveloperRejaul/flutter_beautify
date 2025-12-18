# 🚀 Development Guide - Flutter Beautify CLI

This guide provides instructions for setting up your development environment, testing the CLI, and contributing to the flutter_beautify project.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Setup](#project-setup)
- [Development Commands](#development-commands)
- [Testing the CLI](#testing-the-cli)
- [Project Structure](#project-structure)
- [Troubleshooting](#troubleshooting)

---

## Prerequisites

- **Dart SDK** version 3.9.2 or higher
- **Flutter** (optional, for example app testing)
- **Git** (for version control)

### Verify Installation

```bash
# Check Dart version
dart --version

# Check Flutter version (if installed)
flutter --version
```

---

## Project Setup

### 1. Clone and Navigate

```bash
git clone https://github.com/DeveloperRejaul/flutter_beautify.git
cd flutter_beautify
```

### 2. Get Dependencies

```bash
dart pub get
```

### 3. Verify Installation

```bash
dart pub global activate --source path .
```

---

## Development Commands

### Run CLI During Development

Use `dart run` for quick testing without reinstalling:

```bash
# Run the main CLI
dart run bin/flutter_beautify.dart <command> [args]

# Or using executable name (after pub global activate)
flutter_beautify <command> [args]
```

### Common Development Commands

```bash
# Show help
dart run bin/flutter_beautify.dart help

# Show version
dart run bin/flutter_beautify.dart version

# Test hello command
dart run bin/flutter_beautify.dart hello
```

---

## Testing the CLI

### Method 1: Direct Testing with `dart run`

This is the **recommended method during development** as it doesn't require reinstalling after code changes.

```bash
# Add a button widget
dart run bin/flutter_beautify.dart add button MyCustomButton

# Add with default name
dart run bin/flutter_beautify.dart add button
```

### Method 2: Global Installation Testing

For testing the package as an end user would use it:

```bash
# Install globally from local source
dart pub global activate --source path .

# Test commands
flutter_beautify add button MyButton
flutter_beautify version
flutter_beautify help
```

### Method 3: Testing the Example App

The example folder includes a Flutter app for integration testing:

```bash
cd example

# Get dependencies
flutter pub get

# Run the app
flutter run
```

### Uninstall Global Package

When done testing:

```bash
dart pub global deactivate flutter_beautify
```

---

## Project Structure

```
flutter_beautify/
├── bin/
│   ├── flutter_beautify.dart          # Main CLI entry point
│   ├── add/
│   │   ├── add.dart                   # Add command handler
│   │   └── button.dart                # Button widget generation
│   └── utils/
│       └── string.dart                # Utility functions
├── lib/
│   ├── main.dart
│   └── widgets/
│       ├── button.dart
│       └── button/
│           ├── button.dart            # Button widget implementation
│           └── button_styles.dart     # Button styling
├── example/                           # Example Flutter app
├── pubspec.yaml                       # Package configuration
├── analysis_options.yaml              # Dart analysis settings
├── README.md                          # User documentation
├── DEV.md                             # This file (developer guide)
└── CHANGELOG.md                       # Version history
```

---

## Workflow for Development

### 1. Make Code Changes

Edit files in the `bin/` directory for CLI changes:

```bash
# Example: Edit add command
vim bin/add/add.dart
```

### 2. Test Changes

```bash
# Test immediately without reinstalling
dart run bin/flutter_beautify.dart add button TestWidget
```

### 3. Check for Errors

```bash
# Run Dart analyzer
dart analyze

# Format code
dart format bin/ lib/
```

### 4. Commit Changes

```bash
git add .
git commit -m "feat: add new functionality"
git push origin main
```

---

## Available Commands

### Add Widget Command

```bash
# Syntax
dart run bin/flutter_beautify.dart add <widget-type> [widget-name]

# Examples
dart run bin/flutter_beautify.dart add button MyButton
dart run bin/flutter_beautify.dart add button
```

**Available widget types:**
- `button` - Creates a customizable button widget

### Help Command

```bash
dart run bin/flutter_beautify.dart help
```

Shows all available commands and usage information.

### Version Command

```bash
dart run bin/flutter_beautify.dart version
```

Displays the current CLI version.

### Hello Command

```bash
dart run bin/flutter_beautify.dart hello
```

Test command to verify CLI is working.

---

## Troubleshooting

### Issue: Command Not Found

**Error:** `dart: command not found`

**Solution:**
1. Verify Dart is installed: `dart --version`
2. Add Dart to PATH if needed
3. Restart terminal

### Issue: Exit Code 255

**Error:** `Exit Code: 255`

**Possible causes:**
- Missing required arguments
- Incorrect command syntax
- Directory permission issues

**Solution:**
```bash
# Check command syntax
dart run bin/flutter_beautify.dart help

# Verify file permissions
ls -la bin/
```

### Issue: Module Not Found

**Error:** `Could not find package 'flutter_beautify'`

**Solution:**
```bash
# Get dependencies
dart pub get

# Clear Dart cache
rm -rf .dart_tool/

# Try again
dart run bin/flutter_beautify.dart help
```

### Issue: Files Not Created

**Error:** Widget files not generated

**Solution:**
1. Check `lib/widgets/` directory exists
2. Verify write permissions: `chmod -R 755 lib/`
3. Check console output for specific errors

---

## Code Quality

### Analyze Code

```bash
dart analyze
```

### Format Code

```bash
# Format all Dart files
dart format bin/ lib/ example/lib/

# Check formatting without changes
dart format --line-length=80 --set-exit-if-changed bin/
```

### Run Tests (if available)

```bash
dart test
```

---

## Publishing Updates

### Update Version

Edit `pubspec.yaml`:

```yaml
version: 1.0.1  # Increment version
```

### Update CHANGELOG

Add entry to `CHANGELOG.md`:

```markdown
## 1.0.1

- Bug fix: ...
- Feature: ...
```

### Publish to pub.dev

```bash
dart pub publish
```

---

## Additional Resources

- [Dart CLI Documentation](https://dart.dev/guides/cli)
- [Pub Package Manager](https://pub.dev/)
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Analysis Options](https://dart.dev/guides/language/analysis-options)

---

**Happy Coding! 🎉**

For questions or issues, please open an issue on [GitHub](https://github.com/DeveloperRejaul/flutter_beautify/issues)

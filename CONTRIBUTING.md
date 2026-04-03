# Contributing to Flutter Beautify

We love your input! We want to make contributing to Flutter Beautify as easy and transparent as possible.

## How to Contribute

### Reporting Bugs

Before creating bug reports, please check the issue list as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title**
* **Describe the exact steps which reproduce the problem**
* **Provide specific examples to demonstrate the steps**
* **Describe the behavior you observed after following the steps**
* **Explain which behavior you expected to see instead and why**
* **Include screenshots and animated GIFs if possible**
* **Include your environment details** (OS, Dart version, Flutter version)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

* **Use a clear and descriptive title**
* **Provide a step-by-step description of the suggested enhancement**
* **Provide specific examples to demonstrate the steps**
* **Describe the current behavior and expected behavior**
* **Include screenshots if applicable**
* **Explain why this enhancement would be useful**

### Pull Requests

* Fill in the required template
* Follow the Dart and Flutter style guides
* Document new code based on the Documentation Styleguide
* End all files with a newline
* Avoid platform-dependent code

---

## Development Setup

### Prerequisites

- **Dart SDK**: 3.9.2 or higher
- **Flutter SDK**: Latest stable version
- **Git**: For version control

### Local Setup

1. **Fork the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/flutter_beautify.git
   cd flutter_beautify
   ```

2. **Install dependencies**
   ```bash
   dart pub get
   cd example
   flutter pub get
   cd ..
   ```

3. **Run tests**
   ```bash
   dart analyze
   dart format .
   ```

4. **Run example app**
   ```bash
   cd example
   flutter run
   ```

---

## Code Style Guidelines

### Dart Style

* Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
* Use `dart format` to format code automatically:
  ```bash
  dart format .
  ```

* Use `dart analyze` to check for issues:
  ```bash
  dart analyze
  ```

### Widget Pattern

All widgets follow the **Factory Method Pattern**:

```dart
class FBMyWidget extends StatefulWidget {
  final String label;
  final Color color;

  const FBMyWidget._({
    required this.label,
    required this.color,
  });

  // -------- STANDARD --------
  factory FBMyWidget.standard({
    required String label,
    Color color = Colors.blue,
  }) {
    return FBMyWidget._(
      label: label,
      color: color,
    );
  }

  // -------- CUSTOM --------
  factory FBMyWidget.custom({
    required String label,
    required Color color,
  }) {
    return FBMyWidget._(
      label: label,
      color: color,
    );
  }

  @override
  State<FBMyWidget> createState() => _FBMyWidgetState();
}

class _FBMyWidgetState extends State<FBMyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.label),
    );
  }
}
```

---

## Adding a New Widget

### Step 1: Create Widget File

Create `example/lib/widgets/my_widget.dart`:

```dart
import 'package:flutter/material.dart';

class FBMyWidget extends StatefulWidget {
  // ... implementation
}
```

### Step 2: Create Demo File

Create `example/lib/demo/my_widget_example.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:example/widgets/my_widget.dart';

class MyWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Widget Examples')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              FBMyWidget.standard(label: 'Standard'),
              SizedBox(height: 16),
              FBMyWidget.custom(label: 'Custom'),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Step 3: Update CLI

Update `bin/add/add.dart` to add the new widget to the list:

```dart
const validComponents = [
  // ... existing components
  'my-widget',  // Add this
];
```

### Step 4: Update Documentation

Update `README.md` and `COMPONENTS_REFERENCE.md` with the new widget.

---

## Commit Message Guidelines

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line

**Example:**
```
Add circular progress spinner variant

- Add isIndeterminate flag for loading state
- Implement RotationTransition animation
- Add .spinner() factory method
- Update demo examples

Fixes #123
```

---

## Testing

### Run Tests

```bash
# Analyze code
dart analyze

# Format check
dart format --set-exit-if-changed .

# Test locally
cd example
flutter pub get
flutter analyze
flutter format .
```

### Before Submitting

- ✅ Code runs without errors
- ✅ No linting issues (`dart analyze`)
- ✅ Code is properly formatted (`dart format`)
- ✅ Example app runs (`flutter run`)
- ✅ Documentation is updated

---

## Review Process

1. **Automated Checks**
   - GitHub Actions runs tests
   - Code analysis and formatting checks
   - All tests must pass

2. **Code Review**
   - At least one maintainer review
   - Address feedback and suggestions
   - Push updates to the same PR

3. **Merge**
   - After approval, PR is merged to main
   - CI/CD pipeline publishes updates

---

## Documentation Styleguide

* Use clear, concise language
* Include code examples where helpful
* Update CHANGELOG.md with changes
* Link to relevant resources
* Keep README.md up to date

---

## Additional Notes

### Project Structure

```
flutter_beautify/
├── bin/                    # CLI commands
│   ├── flutter_beautify.dart
│   ├── add/
│   ├── init/
│   └── utils/
├── example/                # Example Flutter app
│   ├── lib/
│   │   ├── widgets/       # Widget implementations
│   │   ├── demo/          # Demo examples
│   │   └── main.dart
│   └── pubspec.yaml
├── .github/workflows/      # CI/CD pipelines
├── README.md
├── CHANGELOG.md
└── pubspec.yaml
```

### Key Files

* **pubspec.yaml** - Package configuration
* **CHANGELOG.md** - Version history
* **README.md** - Main documentation
* **CONTRIBUTING.md** - This file

---

## Questions?

* 📧 Contact: See CONTACT.md
* 💬 Discussions: GitHub Discussions
* 📖 Docs: See README.md
* 🐛 Issues: GitHub Issues

---

## License

By contributing to Flutter Beautify, you agree that your contributions will be licensed under the MIT License.

Thank you for contributing! 🎉

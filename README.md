# 🎨 Flutter Beautify

A powerful CLI tool for Flutter developers to quickly generate beautiful, customizable widgets and components for your Flutter projects.

![Dart](https://img.shields.io/badge/Dart-3.9.2+-success)
![Pub](https://img.shields.io/badge/pub.dev-flutter--beautify-blue)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## 📑 Table of Contents

- [Quick Features](#quick-features)
- [Installation](#installation)
- [Widgets](#widgets)
  - [Button](#button)
- [License](#-license)

---

##  Quick Features

- 🚀 **Fast Widget Generation** - Create custom widgets with a single command
- 🎯 **Template-Based** - Pre-built, production-ready widget templates
- 📁 **Organized Structure** - Automatically creates `lib/widgets/` directory

---

## Installation

### Prerequisites

- **Dart SDK** 3.9.2 or higher

### Activate CLI from pub.dev

```bash
dart pub global activate flutter_beautify
```

Verify installation:

```bash
flutter_beautify --help
```
---

### Widgets

#### Button
```bash
flutter_beautify add button
```

### What It Does

1. Creates `lib/widgets/` directory (if it doesn't exist)
2. Generates `lib/widgets/button.dart` with a ready-to-use button widget
3. Displays import statement for quick copy-paste


### Generated Button Widget

```dart
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? title;

  const Button({super.key, this.onPressed, this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child ?? Text(title ?? ""),
    );
  }
}
```

### Use in Your App

```dart
import 'package:your_app/widgets/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Beautify Demo')),
        body: Center(
          child: Button(
            title: 'Click Me',
            onPressed: () => print('Button pressed!'),
          ),
        ),
      ),
    );
  }
}
```

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**DeveloperRejaul**

- GitHub: [@DeveloperRejaul](https://github.com/DeveloperRejaul)
- Email: [devrejaul.official@gmail.com](mailto:devrejaul.official@gmail.com)

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📚 Related Libraries & Resources

- [Dart SDK](https://dart.dev/) - Official Dart programming language
- [Flutter](https://flutter.dev/) - Beautiful UI framework
- [pub.dev](https://pub.dev/) - Dart packages repository
- [Material Design](https://material.io/design/) - Design system used in widgets

---

## 💬 Support & Feedback

Have questions or found a bug?

- 🐛 **Report Issues:** [GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)
- 💡 **Feature Requests:** Open a new issue with `[Feature Request]` prefix
- 📧 **Email Support:** [developer.rejaul@example.com](mailto:developer.rejaul@example.com)

---

## 📊 Project Stats

- **Version:** 1.0.0
- **Dart SDK:** 3.9.2+
- **License:** MIT
- **Repository:** [flutter-beautify](https://pub.dev/packages/flutter_beautify)

---

## 🙏 Acknowledgments

- Thanks to the [Dart](https://dart.dev/) and [Flutter](https://flutter.dev/) teams for creating amazing tools
- Inspired by modern CLI tools for developer productivity
- Special thanks to all contributors and users

---

**Happy coding! 🎉**

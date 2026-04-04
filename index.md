---
layout: default
title: Home
nav_order: 1
description: "Flutter Beautify - Production-grade UI Widgets CLI"
permalink: /
---

# 🎨 Flutter Beautify

{: .fs-9 }

A production-grade command-line interface tool for scaffolding 26+ pre-built, customizable Flutter UI components with Material Design 3 compliance.

{: .fs-6 .fw-300 }

[Get Started](#quick-start){: .btn .btn-primary .mr-2 }
[View on GitHub](https://github.com/DeveloperRejaul/flutter_beautify){: .btn }
[View on Pub.dev](https://pub.dev/packages/flutter_beautify){: .btn }

---

## ✨ Key Features

- **🎁 26 Production-Ready Components** - Professionally crafted UI widgets following Material Design 3 specifications
- **🏭 Factory Method Pattern** - 60+ factory variants (3-4 per widget) for flexible customization
- **⚡ CLI-First Workflow** - Fast command-line integration for rapid scaffolding
- **🔧 Configuration Management** - Flexible directory path configuration via interactive prompts
- **📚 Comprehensive Documentation** - Built-in examples and usage patterns for every component
- **🎬 Animation Support** - Native support for transitions, loading spinners, and custom animations
- **📦 Zero Dependencies** - Lightweight CLI with minimal external dependencies
- **🚀 Quick Integration** - Copy templates directly into projects with automatic path creation

---

## Quick Start

### Installation

```bash
dart pub global activate flutter_beautify
```

### Initialize

```bash
flutter_beautify init
```

### Add Components

```bash
flutter_beautify add button
flutter_beautify add textfield
flutter_beautify add card
```

### Use in Your App

```dart
import 'package:my_app/widgets/button.dart';

FBButton.solid(
  label: 'Click Me',
  onPressed: () => print('Clicked!'),
)
```

---

## 📋 Component Catalog

**26 Production-Ready Widgets:**

### Input Components (7)
- Button
- TextField
- Checkbox
- RadioButton
- Dropdown
- Slider
- Switch

### Display Components (7)
- Card
- Badge
- Avatar
- Tooltip
- Breadcrumb
- AppBar
- Divider

### Progress Components (3)
- CircularProgress (with spinner variant)
- LinearProgress
- Skeleton

### Navigation Components (4)
- Tabs
- Pagination
- BottomNavigationBar
- Sidebar

### Modal Components (4)
- Dialog
- BottomSheet
- Snackbar
- Toast

### Date/Time Components (2)
- DatePicker
- Calendar

### Special Components (1)
- Accordion

---

## 🎯 Why Choose Flutter Beautify?

| Feature | Flutter Beautify | Manual Setup |
|---------|------------------|--------------|
| Setup Time | 1 minute | 30+ minutes |
| Components | 26 ready-to-use | Build from scratch |
| Consistency | Material Design 3 | Manual management |
| Updates | Single command | Manual updates |
| Documentation | Built-in examples | Self-documented |
| Learning Curve | Low | Medium-High |

---

## 📊 Statistics

- **26** Production-Ready Components
- **60+** Factory Method Variants
- **20+** Demo Examples
- **100%** Dart Code Coverage
- **3** CLI Commands (init, config, add)
- **1.0.4** Latest Version

---

## 🚀 Next Steps

1. **[Installation Guide](./doc/installation)** - Step-by-step setup
2. **[Quick Start Tutorial](./doc/quick-start)** - Build your first component
3. **[Component Reference](./doc/components)** - Explore all 26 widgets
4. **[CLI Commands](./doc/cli-commands)** - Master the command-line
5. **[Contributing](./doc/contributing)** - Help improve Flutter Beautify

---

## 📞 Support

- 📚 **Documentation**: [Full Docs](./doc)
- 🐛 **Report Issues**: [GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/DeveloperRejaul/flutter_beautify/discussions)
- 📧 **Contact**: [Contact Info](./CONTACT.md)

---

## 📄 License

MIT License - feel free to use in commercial and personal projects!

---

## 🙏 Credits

Built with ❤️ using [Dart](https://dart.dev) and [Flutter](https://flutter.dev)

Inspired by [Material Design 3](https://m3.material.io/)

---

**⭐ If you find this useful, please [star us on GitHub](https://github.com/DeveloperRejaul/flutter_beautify)!**

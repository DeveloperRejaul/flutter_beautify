# 🎨 Flutter Beautify

[![Pub Version](https://img.shields.io/pub/v/flutter_beautify.svg)](https://pub.dev/packages/flutter_beautify)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Dart SDK](https://img.shields.io/badge/Dart-3.9.2+-blue.svg)](https://dart.dev)
[![Platform](https://img.shields.io/badge/platform-android%20%7C%20ios%20%7C%20web-lightgrey)](https://flutter.dev)

> A production-grade command-line interface tool for scaffolding 26+ pre-built, customizable Flutter UI components with Material Design 3 compliance. Accelerate development workflow by generating boilerplate widget code with factory method patterns in seconds.

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

## 📋 Table of Contents

- [Installation](#installation)
- [Quick Start Guide](#quick-start-guide)
- [CLI Commands Reference](#cli-commands-reference)
- [Component Catalog](#component-catalog)

---

## Installation

### Prerequisites

- **Dart SDK**: 3.9.2 or higher
- **Flutter SDK**: Latest stable version (for component usage)
- **macOS/Linux/Windows**: Supported on all platforms

### Method 1: From pub.dev (Recommended)

Install globally from pub.dev:

```bash
dart pub global activate flutter_beautify
```

### Uninstall

```bash
dart pub global deactivate flutter_beautify
```

---

## Quick Start Guide

### Step 1: Initialize Configuration

Navigate to your Flutter project and initialize Flutter Beautify:

```bash
flutter_beautify init
```
### Step 2: Add Your First Component

Add a button widget to your project:

```bash
flutter_beautify add button
```

### Step 3: Use in Your Application

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Beautify Demo')),
        body: Center(
          child: FBButton.solid(
            label: 'Click Me',
            onPressed: () => print('Button tapped!'),
          ),
        ),
      ),
    );
  }
}
```
---

## CLI Commands Reference

### 1. `flutter_beautify init`

Initialize Flutter Beautify configuration for your project.

**Syntax:**
```bash
flutter_beautify init
```

**Use Cases:**
- ✅ First-time setup
- ✅ Custom project structure
- ✅ Team standardization

---

### 2. `flutter_beautify config`

Display the current Flutter Beautify configuration.

**Syntax:**
```bash
flutter_beautify config
```

**Description:**
Reads and displays the current configuration from `.flutter_beautify_config.json`. If file doesn't exist, shows default values.

**Use Cases:**
- ✅ Verify configuration settings
- ✅ Check project structure
- ✅ Team alignment

---

### 3. `flutter_beautify add <component>`

Add a component to your project.

**Syntax:**
```bash
flutter_beautify add <component_name>
```

**Parameters:**

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| `<component_name>` | ✅ Yes | string | Name of the component to add |

**Example Usage:**

```bash
# Add a single component
flutter_beautify add button

# Add multiple components sequentially
flutter_beautify add checkbox
flutter_beautify add textfield
flutter_beautify add card
```

**Supported Component Commands:**

```bash
# Input Components
flutter_beautify add button          # Action button
flutter_beautify add checkbox        # Checkbox input
flutter_beautify add textfield       # Text input field
flutter_beautify add radio-button    # Radio button group
flutter_beautify add slider          # Slider control
flutter_beautify add switch          # Toggle switch
flutter_beautify add dropdown        # Dropdown select

# Display Components
flutter_beautify add card            # Card container
flutter_beautify add badge           # Status badge
flutter_beautify add avatar          # User avatar
flutter_beautify add tooltip         # Tooltip overlay
flutter_beautify add breadcrumb      # Breadcrumb trail
flutter_beautify add appbar          # Custom app bar
flutter_beautify add divider         # Visual divider

# Progress & Status
flutter_beautify add circular-progress    # Circular progress
flutter_beautify add linear-progress      # Progress bar
flutter_beautify add skeleton             # Loading skeleton

# Navigation
flutter_beautify add tabs                      # Tab navigation
flutter_beautify add pagination               # Page navigation
flutter_beautify add bottom-navigation-bar    # Bottom nav
flutter_beautify add sidebar                  # Side navigation

# Modals & Overlays
flutter_beautify add dialog             # Dialog modal
flutter_beautify add bottom-sheet       # Bottom sheet
flutter_beautify add snackbar           # Snackbar notification
flutter_beautify add toast              # Toast notification

# Date & Time
flutter_beautify add date-picker    # Date picker
flutter_beautify add calendar       # Calendar widget

# Special
flutter_beautify add accordion      # Accordion component
```

---

## Component Catalog

### Overview

Flutter Beautify provides **26 production-ready components** organized into 7 categories.

### Complete Component List

#### **Input Components** (7 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Button** | `add button` | `.solid()` `.outline()` `.link()` | Action buttons with multiple styles |
| **Checkbox** | `add checkbox` | `.standard()` `.outlined()` | Checkbox input with validation |
| **TextField** | `add textfield` | `.outline()` `.filled()` `.underline()` | Text input with variants |
| **RadioButton** | `add radio-button` | `.standard()` `.card()` | Radio button groups |
| **Slider** | `add slider` | `.standard()` `.range()` | Range slider input |
| **Switch** | `add switch` | `.standard()` `.outlined()` | Toggle switch control |
| **Dropdown** | `add dropdown` | `.standard()` `.outlined()` | Dropdown menu select |

#### **Display Components** (7 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Card** | `add card` | `.elevated()` `.outlined()` `.flat()` | Container with styling |
| **Badge** | `add badge` | `.standard()` `.small()` `.large()` `.outlined()` | Status/label badges |
| **Avatar** | `add avatar` | `.circular()` `.square()` `.rounded()` | User profile avatars |
| **Tooltip** | `add tooltip` | `.standard()` `.dark()` | Hover information overlay |
| **Breadcrumb** | `add breadcrumb` | `.standard()` `.arrow()` | Navigation breadcrumb trail |
| **AppBar** | `add appbar` | `.standard()` `.transparent()` `.gradient()` | Custom app bar |
| **Divider** | `add divider` | `.horizontal()` `.vertical()` | Visual dividers |

#### **Progress & Status** (3 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **CircularProgress** | `add circular-progress` | `.standard()` `.withLabel()` `.spinner()` | Circular progress indicator |
| **LinearProgress** | `add linear-progress` | `.standard()` `.withLabel()` `.striped()` | Horizontal progress bar |
| **Skeleton** | `add skeleton` | `.text()` `.image()` `.card()` | Loading skeleton screens |

#### **Navigation Components** (4 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Tabs** | `add tabs` | `.standard()` `.scrollable()` | Tab navigation |
| **Pagination** | `add pagination` | `.standard()` `.minimal()` | Page navigation |
| **BottomNavigationBar** | `add bottom-navigation-bar` | `.standard()` `.elevated()` | Bottom navigation |
| **Sidebar** | `add sidebar` | `.standard()` `.dark()` `.collapsible()` | Side navigation panel |

#### **Modal & Overlay** (4 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Dialog** | `add dialog` | `.alert()` `.confirmation()` `.custom()` | Modal dialogs |
| **BottomSheet** | `add bottom-sheet` | `.standard()` `.scrollable()` `.fullscreen()` | Bottom sheet modals |
| **Snackbar** | `add snackbar` | `.info()` `.success()` `.error()` `.warning()` | Snackbar notifications |
| **Toast** | `add toast` | `.short()` `.long()` `.custom()` | Toast notifications |

#### **Date & Time** (2 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **DatePicker** | `add date-picker` | `.standard()` `.range()` | Date selection picker |
| **Calendar** | `add calendar` | `.standard()` `.range()` | Interactive calendar widget |

#### **Special Components** (1 widget)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Accordion** | `add accordion` | `.standard()` `.outlined()` | Expandable accordion items |

---

## 📞 Support

- **📖 Documentation**: [GitHub Wiki](https://github.com/DeveloperRejaul/flutter_beautify/wiki)
- **🐛 Issues**: [GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)
- **💬 Discussions**: [GitHub Discussions](https://github.com/DeveloperRejaul/flutter_beautify/discussions)
- **📧 Email**: [Contact Developer](mailto:rejaul.pro@gmail.com)

---

## 🙌 Acknowledgments

- Built with ❤️ using [Dart](https://dart.dev) and [Flutter](https://flutter.dev)
- Inspired by [Material Design 3](https://m3.material.io/)
- Thanks to the Flutter community for feedback and contributions

---

## 🔗 Quick Links

### 📚 Documentation
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute to the project
- **[CONTACT.md](CONTACT.md)** - Contact information and support channels
- **[PUB_DEV_SETUP.md](PUB_DEV_SETUP.md)** - Pub.dev publishing guide
- **[GITHUB_ACTIONS_SETUP.md](GITHUB_ACTIONS_SETUP.md)** - GitHub Actions automation
- **[CHANGELOG.md](CHANGELOG.md)** - Version history and updates

### 🤝 Community
- **[GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)** - Report bugs or request features
- **[GitHub Discussions](https://github.com/DeveloperRejaul/flutter_beautify/discussions)** - Ask questions and discuss ideas
- **[GitHub Repository](https://github.com/DeveloperRejaul/flutter_beautify)** - View source code

### 📞 Get Help
- **[CONTACT.md](CONTACT.md)** - For support and contact information
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Development setup and guidelines
- **README.md** - Main documentation (you are here!)

---

## 📊 Statistics

- **26** Production-Ready Components
- **60+** Factory Method Variants
- **20+** Demo Examples
- **100%** Dart Code Coverage (widgets)
- **Active** Maintenance & Support

---

**Made with ❤️ by [DeveloperRejaul](https://github.com/DeveloperRejaul)**

**⭐ If you find this useful, please consider giving it a star on GitHub!**


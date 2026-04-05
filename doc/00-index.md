---
layout: default
title: Home
nav_order: 1
permalink: /doc/
---

# Flutter Beautify Documentation

Welcome to the comprehensive documentation for **Flutter Beautify** - a production-grade CLI tool for generating 26+ pre-built Flutter UI components.

## Quick Navigation

### 📖 Getting Started
* [Installation](installation.html) - How to install Flutter Beautify
* [Quick Start Guide](quick-start.html) - Get up and running in 5 minutes
* [CLI Commands Reference](cli-commands.html) - All available commands

### 🎨 All Widgets (26 Components)
Explore all production-ready UI widgets organized by category - always expanded for easy browsing:
* [Widgets Overview](widgets/index.html) - Complete widget library
* **Form Components** - TextField, Checkbox, RadioButton, Switch, Slider
* **Button Components** - Button, IconButton, FAB, ToggleButton
* **Layout Components** - Card, BottomSheet, Sidebar, Breadcrumb, Accordion
* **Navigation Components** - AppBar, BottomNavigationBar, Tabs, Pagination, Avatar
* **Progress & Loading** - LinearProgress, CircularProgress, Toast, CircularLoader
* **Feedback & Status** - Dialog, Snackbar, Badge, Tooltip

### 📚 Resources
* [Examples & Demos](examples.html) - Code examples and use cases
* [API Reference](api-reference.html) - Detailed method documentation
* [Troubleshooting](troubleshooting.html) - Common issues and solutions

### 🆘 Support
* [Contributing Guide](../CONTRIBUTING.md) - Help us improve Flutter Beautify

---

## Why Flutter Beautify?

✨ **26 Production-Ready Components** - Use them immediately in your projects  
🏭 **60+ Factory Methods** - 3-4 variations per widget  
⚡ **CLI-Powered** - Generate components in seconds  
🎯 **Material Design 3** - Always compliant with latest standards  
📦 **Zero Dependencies** - Just Flutter, nothing else  
🔧 **100% Customizable** - Colors, sizes, and behaviors  

---

## Getting Started in 30 Seconds

```bash
# 1. Install globally
dart pub global activate flutter_beautify

# 2. Initialize your Flutter project
flutter_beautify init

# 3. Add your first component
flutter_beautify add button
```

Then use it in your code:

```dart
import 'package:your_app/widgets/button.dart';

FBButton.solid(
  label: 'Click Me',
  onPressed: () => print('Hello Flutter Beautify!'),
)
```

---

**Ready?** Start with [Installation](installation.html) →

---
layout: default
title: Quick Start Guide
nav_order: 4
---

# Quick Start Guide

Get up and running with Flutter Beautify in 5 minutes!

## Step 1: Initialize Your Project

Navigate to your Flutter project and initialize Flutter Beautify:

```bash
cd my_flutter_app
flutter_beautify init
```

You'll be prompted to enter:

1. **Widgets Path**: Where to store widget files (default: `lib/widgets`)
2. **Utils Path**: Where to store utilities (default: `lib/utils`)
3. **Demo Path**: Where to store demo files (default: `lib/demo`)

**Example:**
```
Enter widgets path [lib/widgets]: lib/widgets
Enter utils path [lib/utils]: lib/utils
Enter demo path [lib/demo]: lib/demo
Configuration saved!
```

## Step 2: Add Your First Component

Add a button component:

```bash
flutter_beautify add button
```

This creates `lib/widgets/button.dart` with all factory methods ready to use!

## Step 3: Use in Your App

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
            onPressed: () {
              print('Button tapped!');
            },
          ),
        ),
      ),
    );
  }
}
```

## Step 4: Explore More Components

Add more components:

```bash
flutter_beautify add textfield
flutter_beautify add card
flutter_beautify add dialog
flutter_beautify add tabs
```

Check available components:

```bash
flutter_beautify help add
```

## Common Use Cases

### Form Screen

```bash
flutter_beautify add textfield
flutter_beautify add button
flutter_beautify add checkbox
```

### Display Data

```bash
flutter_beautify add card
flutter_beautify add badge
flutter_beautify add avatar
```

### Loading State

```bash
flutter_beautify add circular-progress
flutter_beautify add linear-progress
flutter_beautify add skeleton
```

### Navigation

```bash
flutter_beautify add tabs
flutter_beautify add pagination
flutter_beautify add sidebar
```

## Tips & Tricks

### View Configuration

Check your current configuration:

```bash
flutter_beautify config
```

### Update Configuration

Reinitialize to update paths:

```bash
flutter_beautify init
```

### Get Help

View all commands:

```bash
flutter_beautify help
```

View specific command help:

```bash
flutter_beautify help add
```

## Next Steps

- 📚 [Explore Components](./widgets/00-index.html) - See all 26 widgets
- 🔧 [CLI Commands](./cli-commands.html) - Master the command-line
- 📖 [Component Reference](./widgets/00-index.html) - Detailed component docs

---

[← Installation](./installation.html) | [Components →](./widgets/00-index.html)

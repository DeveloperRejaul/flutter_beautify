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
- [Configuration](#configuration)
- [Component Catalog](#component-catalog)
- [Usage Examples](#usage-examples)
- [Architecture & Patterns](#architecture--patterns)
- [Project Structure](#project-structure)
- [Troubleshooting](#troubleshooting)
- [Best Practices](#best-practices)
- [Contributing](#contributing)
- [License](#license)

---

## 📦 Installation

### Prerequisites

- **Dart SDK**: 3.9.2 or higher
- **Flutter SDK**: Latest stable version (for component usage)
- **macOS/Linux/Windows**: Supported on all platforms

### Method 1: From pub.dev (Recommended)

Install globally from pub.dev:

```bash
dart pub global activate flutter_beautify
```

Verify installation:
```bash
flutter_beautify --version
# Output: flutter_beautify version 1.0.4
```

### Method 2: From Source

Clone and activate locally:

```bash
# Clone repository
git clone https://github.com/DeveloperRejaul/flutter_beautify.git
cd flutter_beautify

# Install dependencies
dart pub get

# Activate globally
dart pub global activate --source path .

# Verify
flutter_beautify --version
```

### Method 3: Add PATH (Manual Installation)

If global activation doesn't work:

```bash
# Build executable
dart compile exe bin/flutter_beautify.dart -o flutter_beautify

# Add to PATH
export PATH="$PATH:/path/to/flutter_beautify/directory"

# Verify
flutter_beautify --version
```

### Uninstall

```bash
dart pub global deactivate flutter_beautify
```

---

## 🚀 Quick Start Guide

### Step 1: Initialize Configuration

Navigate to your Flutter project and initialize Flutter Beautify:

```bash
cd ~/my_flutter_app
flutter_beautify init
```

**Interactive Setup:**
```
🚀 Initializing Flutter Beautify Configuration...

Enter widgets directory path (default: lib/widgets): lib/widgets
Enter utils directory path (default: lib/utils): lib/utils
Enter demo directory path (default: lib/demo): lib/demo

✅ Configuration saved to .flutter_beautify_config.json
📁 Widgets path: lib/widgets
🛠️  Utils path: lib/utils
📚 Demo path: lib/demo
```

### Step 2: Add Your First Component

Add a button widget to your project:

```bash
flutter_beautify add button
```

**Output:**
```
Created button widget from template: lib/widgets/button.dart
Import it: import 'package:my_flutter_app/widgets/button.dart';
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

### Step 4: Run Your App

```bash
flutter run
```

---

## 📚 CLI Commands Reference

### 1. `flutter_beautify init`

Initialize Flutter Beautify configuration for your project.

**Syntax:**
```bash
flutter_beautify init
```

**Description:**
Creates a `.flutter_beautify_config.json` configuration file in the project root. Prompts user for custom directory paths.

**User Input Prompts:**
```
Enter widgets directory path (default: lib/widgets): 
Enter utils directory path (default: lib/utils): 
Enter demo directory path (default: lib/demo): 
```

**Output:**
```
🚀 Initializing Flutter Beautify Configuration...

✅ Configuration saved to .flutter_beautify_config.json
📁 Widgets path: lib/widgets
🛠️  Utils path: lib/utils
📚 Demo path: lib/demo
```

**Configuration File Generated:**
```json
{
  "widgetPath": "lib/widgets",
  "utilsPath": "lib/utils",
  "demoPath": "lib/demo",
  "timestamp": "2025-04-03T10:30:00.000000Z"
}
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

**Output Example:**
```
📋 Current Configuration:
📁 Widgets path: lib/widgets
🛠️  Utils path: lib/utils
📚 Demo path: lib/demo
```

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

# Batch add with shell script
for component in button checkbox textfield card badge avatar; do
  flutter_beautify add $component
done
```

**Output on Success:**
```
Created button widget from template: lib/widgets/button.dart
Import it: import 'package:my_flutter_app/widgets/button.dart';
```

**Output on Error (File Exists):**
```
File already exists: lib/widgets/button.dart
Aborting. Remove the file if you want to overwrite.
```

**Output on Error (Invalid Component):**
```
❌ Unknown component: invalid-widget

Available components:
  • button
  • checkbox
  • textfield
  • card
  • dialog
  • ... (and 20+ more)
```

**Execution Flow:**
```
1. Validate component name
2. Check if output directory exists (create if needed)
3. Verify file doesn't already exist
4. Load template from example/lib/widgets/{component}.dart
5. Write to configured widget path
6. Display success message
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

### 4. `flutter_beautify version`

Display the current version of Flutter Beautify.

**Syntax:**
```bash
flutter_beautify version
```

**Output:**
```
flutter_beautify version 1.0.4
```

**Use Cases:**
- ✅ Verify installation
- ✅ Check for updates
- ✅ CI/CD pipelines

---

### 5. `flutter_beautify help`

Display comprehensive help information.

**Syntax:**
```bash
flutter_beautify help
```

**Output:**
```
╔════════════════════════════════════════════════════════════════╗
║         🎨 Flutter Beautify - Beautiful Widget CLI             ║
╚════════════════════════════════════════════════════════════════╝

Usage: flutter_beautify <command> [args]

Available Commands:
  init                     Initialize Flutter Beautify configuration
  config                   Show current configuration
  add <component> [name]   Add a component to your project
  version                  Print version
  help                     Show this message

Available Components:
  • button                 Beautiful button widget
  • checkbox               Customizable checkbox widget
  • textfield              Text input field widget
  • card                   Card container widget
  • dialog                 Dialog widget
  • snackbar               Snackbar notification widget
  • toast                  Toast notification widget
  • appbar                 Custom app bar widget
  ... and 18 more components

Examples:
  flutter_beautify init
  flutter_beautify config
  flutter_beautify add button
  flutter_beautify add checkbox
  flutter_beautify add textfield

📚 Documentation: https://github.com/DeveloperRejaul/flutter_beautify
```

---

### 6. `flutter_beautify hello`

Simple greeting command (for testing CLI functionality).

**Syntax:**
```bash
flutter_beautify hello
```

**Output:**
```
👋 Hello from flutter_beautify!
```

---

## ⚙️ Configuration

### Configuration File Structure

**Location:** `.flutter_beautify_config.json` (project root)

**Default Configuration:**
```json
{
  "widgetPath": "lib/widgets",
  "utilsPath": "lib/utils",
  "demoPath": "lib/demo",
  "timestamp": "2025-04-03T10:30:00.000000Z"
}
```

### Configuration Reference

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `widgetPath` | string | `lib/widgets` | Directory for generated widget files |
| `utilsPath` | string | `lib/utils` | Directory for utility functions |
| `demoPath` | string | `lib/demo` | Directory for demo/example files |
| `timestamp` | string | auto | ISO 8601 timestamp of last update |

### Custom Configuration Example

Customize paths for enterprise project structure:

```json
{
  "widgetPath": "lib/presentation/widgets",
  "utilsPath": "lib/core/utils",
  "demoPath": "lib/features/demo/screens",
  "timestamp": "2025-04-03T10:30:00.000000Z"
}
```

**Update Configuration Manually:**

```bash
# Edit configuration file
vim .flutter_beautify_config.json

# Verify changes
flutter_beautify config
```

**Verify Current Configuration:**

```bash
cat .flutter_beautify_config.json | jq .
```

---

## 🎨 Component Catalog

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

## 📖 Usage Examples

### Example 1: Building a Login Form

```bash
# Add required components
flutter_beautify add textfield
flutter_beautify add checkbox
flutter_beautify add button
```

**Implementation:**

```dart
// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/textfield.dart';
import 'package:my_flutter_app/widgets/checkbox.dart';
import 'package:my_flutter_app/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            // Email field
            FBTextField.outline(
              controller: emailController,
              hintText: 'Email Address',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            
            // Password field
            FBTextField.outline(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              prefixIcon: Icons.lock_outlined,
            ),
            const SizedBox(height: 12),
            
            // Remember me checkbox
            FBCheckbox.standard(
              label: 'Remember me',
              value: rememberMe,
              onChanged: (value) {
                setState(() => rememberMe = value ?? false);
              },
            ),
            const SizedBox(height: 32),
            
            // Login button
            FBButton.solid(
              label: 'Sign In',
              onPressed: _handleLogin,
            ),
            const SizedBox(height: 16),
            
            // Sign up link
            FBButton.link(
              label: 'Don\'t have an account? Sign Up',
              onPressed: () => print('Navigate to signup'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
    print('Login: ${emailController.text}');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
```

---

### Example 2: Loading Screen with Spinner

```bash
flutter_beautify add circular-progress
```

**Implementation:**

```dart
// lib/screens/loading_screen.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/circular_progress.dart';

class LoadingScreen extends StatelessWidget {
  final String message;
  
  const LoadingScreen({this.message = 'Loading...'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Spinner animation
            FBCircularProgress.spinner(
              size: 80,
              valueColor: Colors.blue,
              strokeWidth: 4,
            ),
            const SizedBox(height: 24),
            
            // Loading text
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### Example 3: Product List with Pagination

```bash
flutter_beautify add card
flutter_beautify add badge
flutter_beautify add pagination
```

**Implementation:**

```dart
// lib/screens/products_screen.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/card.dart';
import 'package:my_flutter_app/widgets/badge.dart';
import 'package:my_flutter_app/widgets/pagination.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int currentPage = 1;
  final int itemsPerPage = 10;
  final int totalItems = 50;

  @override
  Widget build(BuildContext context) {
    int totalPages = (totalItems / itemsPerPage).ceil();
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Column(
        children: [
          // Product list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: (endIndex - startIndex).clamp(0, itemsPerPage),
              itemBuilder: (context, index) {
                return ProductCard(
                  productId: startIndex + index + 1,
                );
              },
            ),
          ),
          
          // Pagination controls
          Padding(
            padding: const EdgeInsets.all(16),
            child: FBPagination.standard(
              currentPage: currentPage,
              totalPages: totalPages,
              onPageChanged: (page) {
                setState(() => currentPage = page);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final int productId;

  const ProductCard({required this.productId});

  @override
  Widget build(BuildContext context) {
    return FBCard.elevated(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Product image placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 16),
            
            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product #$productId'),
                  const SizedBox(height: 4),
                  Text('\$99.99'),
                ],
              ),
            ),
            
            // Badge
            FBBadge.standard(
              label: 'New',
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### Example 4: Notification System

```bash
flutter_beautify add snackbar
flutter_beautify add toast
flutter_beautify add button
```

**Implementation:**

```dart
// lib/services/notification_service.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/snackbar.dart';
import 'package:my_flutter_app/widgets/toast.dart';

class NotificationService {
  static void showSuccess(BuildContext context, String message) {
    FBSnackbar.success(
      context: context,
      message: message,
      duration: const Duration(seconds: 3),
    ).show();
  }

  static void showError(BuildContext context, String message) {
    FBSnackbar.error(
      context: context,
      message: message,
      duration: const Duration(seconds: 4),
    ).show();
  }

  static void showInfo(BuildContext context, String message) {
    FBSnackbar.info(
      context: context,
      message: message,
      duration: const Duration(seconds: 3),
    ).show();
  }

  static void showWarning(BuildContext context, String message) {
    FBSnackbar.warning(
      context: context,
      message: message,
      duration: const Duration(seconds: 3),
    ).show();
  }
}

// Usage example
class NotificationDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FBButton.solid(
              label: 'Show Success',
              onPressed: () => NotificationService.showSuccess(
                context,
                '✅ Operation successful!',
              ),
            ),
            const SizedBox(height: 12),
            FBButton.solid(
              label: 'Show Error',
              onPressed: () => NotificationService.showError(
                context,
                '❌ Something went wrong!',
              ),
            ),
            const SizedBox(height: 12),
            FBButton.solid(
              label: 'Show Info',
              onPressed: () => NotificationService.showInfo(
                context,
                'ℹ️ Please note this information',
              ),
            ),
            const SizedBox(height: 12),
            FBButton.solid(
              label: 'Show Warning',
              onPressed: () => NotificationService.showWarning(
                context,
                '⚠️ Be careful with this action',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### Example 5: Modal Dialogs

```bash
flutter_beautify add dialog
flutter_beautify add bottom-sheet
flutter_beautify add button
```

**Implementation:**

```dart
// lib/widgets/dialog_examples.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/dialog.dart';
import 'package:my_flutter_app/widgets/bottom_sheet.dart';
import 'package:my_flutter_app/widgets/button.dart';

class DialogExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Examples')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Alert Dialog
            FBButton.solid(
              label: 'Show Alert Dialog',
              onPressed: () => _showAlertDialog(context),
            ),
            const SizedBox(height: 12),
            
            // Confirmation Dialog
            FBButton.solid(
              label: 'Show Confirmation',
              onPressed: () => _showConfirmationDialog(context),
            ),
            const SizedBox(height: 12),
            
            // Bottom Sheet
            FBButton.solid(
              label: 'Show Bottom Sheet',
              onPressed: () => _showBottomSheet(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    FBDialog.alert(
      context: context,
      title: 'Alert',
      message: 'This is an important alert message!',
      actionLabel: 'Dismiss',
      onAction: () => Navigator.pop(context),
    ).show();
  }

  void _showConfirmationDialog(BuildContext context) {
    FBDialog.confirmation(
      context: context,
      title: 'Confirm Action',
      message: 'Are you sure you want to proceed?',
      confirmText: 'Yes',
      cancelText: 'No',
      onConfirm: () {
        Navigator.pop(context);
        print('Confirmed!');
      },
      onCancel: () => Navigator.pop(context),
    ).show();
  }

  void _showBottomSheet(BuildContext context) {
    FBBottomSheet.standard(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    ).show();
  }
}
```

---

## 🏗️ Architecture & Patterns

### Factory Method Pattern

All Flutter Beautify components use the factory method pattern for flexibility:

```dart
class FBButton extends StatelessWidget {
  // Private constructor
  const FBButton._({
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    // ... other properties
  });

  // Factory methods for variants
  factory FBButton.solid({
    required String label,
    required VoidCallback onPressed,
    Color backgroundColor = Colors.blue,
  }) {
    return FBButton._(
      label: label,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
    );
  }

  factory FBButton.outline({
    required String label,
    required VoidCallback onPressed,
    Color borderColor = Colors.blue,
  }) {
    return FBButton._(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
    );
  }

  factory FBButton.link({
    required String label,
    required VoidCallback onPressed,
  }) {
    return FBButton._(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build implementation
  }
}
```

**Benefits:**
- ✅ Consistent API across all components
- ✅ Multiple styling options without class explosion
- ✅ Type-safe and IDE-friendly
- ✅ Easy to extend with new variants

### Animation Support

Components with animations use `TickerProvider` and `AnimationController`:

```dart
class FBCircularProgress extends StatefulWidget {
  final bool isIndeterminate;
  
  const FBCircularProgress._({
    required this.isIndeterminate,
  });

  factory FBCircularProgress.spinner() {
    return const FBCircularProgress._(isIndeterminate: true);
  }

  @override
  State<FBCircularProgress> createState() => _FBCircularProgressState();
}

class _FBCircularProgressState extends State<FBCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.isIndeterminate) {
      _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      )..repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: const CircularProgressIndicator(),
    );
  }
}
```

---

## 📁 Project Structure

After initialization and adding components, your project structure will resemble:

```
my_flutter_app/
├── lib/
│   ├── main.dart                      # App entry point
│   ├── widgets/                       # Generated components
│   │   ├── button.dart                # FBButton
│   │   ├── checkbox.dart              # FBCheckbox
│   │   ├── textfield.dart             # FBTextField
│   │   ├── card.dart                  # FBCard
│   │   ├── dialog.dart                # FBDialog
│   │   ├── badge.dart                 # FBBadge
│   │   ├── avatar.dart                # FBAvatar
│   │   ├── bottom_sheet.dart          # FBBottomSheet
│   │   ├── circular_progress.dart     # FBCircularProgress
│   │   ├── linear_progress.dart       # FBLinearProgress
│   │   ├── tabs.dart                  # FBTabs
│   │   ├── pagination.dart            # FBPagination
│   │   ├── bottom_navigation_bar.dart # FBBottomNavigationBar
│   │   ├── sidebar.dart               # FBSidebar
│   │   └── ... (other components)
│   ├── utils/                         # Utility functions
│   │   ├── colors.dart                # Color constants
│   │   ├── spacing.dart               # Spacing constants
│   │   ├── typography.dart            # Typography styles
│   │   └── validators.dart            # Input validators
│   ├── demo/                          # Demo screens
│   │   ├── button_example.dart
│   │   ├── form_example.dart
│   │   └── ... (other examples)
│   └── screens/                       # App screens
│       ├── home_screen.dart
│       ├── login_screen.dart
│       └── ... (other screens)
├── test/                              # Unit and widget tests
├── .flutter_beautify_config.json      # Flutter Beautify config
├── pubspec.yaml                       # Project dependencies
├── pubspec.lock                       # Locked dependencies
├── analysis_options.yaml              # Dart analysis config
└── README.md                          # Project documentation
```

---

## 🐛 Troubleshooting

### Issue 1: "Unknown command" Error

**Error Message:**
```
Unknown command: sdd
flutter_beautify: command not found
```

**Causes:**
- Typo in command name
- Command not supported in this version
- CLI not properly installed

**Solutions:**

```bash
# 1. Check available commands
flutter_beautify help

# 2. Verify CLI is installed
flutter_beautify --version

# 3. Reinstall if necessary
dart pub global activate flutter_beautify

# 4. Check PATH variable
echo $PATH | grep -i pub
```

---

### Issue 2: "File Already Exists"

**Error Message:**
```
File already exists: lib/widgets/button.dart
Aborting. Remove the file if you want to overwrite.
```

**Causes:**
- Component already added to project
- File manually created with same name
- Accidental duplicate command

**Solutions:**

```bash
# Option 1: Remove existing file
rm lib/widgets/button.dart
flutter_beautify add button

# Option 2: Rename existing file
mv lib/widgets/button.dart lib/widgets/button.backup.dart
flutter_beautify add button

# Option 3: Check what's there
ls -la lib/widgets/button.dart
cat lib/widgets/button.dart
```

---

### Issue 3: "Template File Missing"

**Error Message:**
```
Template file missing: example/lib/widgets/textfield.dart
```

**Causes:**
- Incomplete installation
- Component name misspelled
- Flutter Beautify package corrupted

**Solutions:**

```bash
# 1. Verify component name
flutter_beautify help

# 2. Reinstall Flutter Beautify
dart pub global activate flutter_beautify

# 3. Check installation location
which flutter_beautify
dart pub global list | grep beautify

# 4. Verify template files
find ~/.pub-cache -name "*.dart" -path "*flutter_beautify*"
```

---

### Issue 4: "Configuration Not Found"

**Error Message:**
```
Warning: Could not load config file, using defaults
```

**Causes:**
- `.flutter_beautify_config.json` deleted or corrupted
- Not in project root directory
- Running in wrong directory

**Solutions:**

```bash
# 1. Reinitialize configuration
flutter_beautify init

# 2. Verify configuration file exists
ls -la .flutter_beautify_config.json

# 3. Check current directory
pwd

# 4. Validate JSON syntax
cat .flutter_beautify_config.json | jq .
```

---

### Issue 5: "Permission Denied"

**Error Message:**
```
Permission denied: lib/widgets
```

**Causes:**
- Directory permissions restricted
- User doesn't have write access
- Running as different user

**Solutions:**

```bash
# 1. Check directory permissions
ls -ld lib/widgets

# 2. Add write permission
chmod +w lib/widgets

# 3. Change ownership if needed
sudo chown -R $USER lib/

# 4. Create directory with correct permissions
mkdir -p lib/widgets
chmod 755 lib/widgets
```

---

## ✅ Best Practices

### 1. **Component Organization**

Group components by feature/module:

```
lib/widgets/
├── auth/
│   ├── login_form.dart
│   ├── signup_form.dart
│   └── password_reset.dart
├── shop/
│   ├── product_card.dart
│   ├── cart_item.dart
│   └── checkout_form.dart
└── shared/
    ├── header.dart
    ├── footer.dart
    └── loading.dart
```

### 2. **Theming & Customization**

Create a theme layer on top of generated components:

```dart
// lib/theme/app_theme.dart
class AppTheme {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color secondaryColor = Color(0xFF03DAC6);
  
  static FBButton primaryButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return FBButton.solid(
      label: label,
      backgroundColor: primaryColor,
      onPressed: onPressed,
    );
  }
  
  static FBButton secondaryButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return FBButton.outline(
      label: label,
      borderColor: secondaryColor,
      onPressed: onPressed,
    );
  }
}

// Usage
AppTheme.primaryButton(
  label: 'Submit',
  onPressed: () => print('Submitted'),
)
```

### 3. **State Management Integration**

Combine with your state management solution:

```dart
// Using Provider
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return FBButton.solid(
          label: homeProvider.isLoading ? 'Loading...' : 'Submit',
          onPressed: homeProvider.isLoading
              ? null
              : () => homeProvider.submit(),
        );
      },
    );
  }
}
```

### 4. **Type Safety**

Always use proper types with components:

```dart
// ✅ Good
List<String> items = ['Option 1', 'Option 2', 'Option 3'];
FBDropdown<String>(
  items: items,
  onChanged: (String? selected) {
    print('Selected: $selected');
  },
)

// ❌ Avoid
FBDropdown(
  items: ['Option 1', 'Option 2'],
  onChanged: (value) {
    print('Selected: $value');
  },
)
```

### 5. **Error Handling**

Implement proper validation and error states:

```dart
class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  String? emailError;

  void _validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      // All fields valid
      _submitForm();
    } else {
      setState(() {
        emailError = 'Invalid email format';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FBTextField.outline(
            hintText: 'Email',
            errorText: emailError,
            onChanged: (_) {
              setState(() => emailError = null);
            },
          ),
          const SizedBox(height: 24),
          FBButton.solid(
            label: 'Submit',
            onPressed: _validateAndSubmit,
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    print('Form submitted successfully!');
  }
}
```

### 6. **Testing Components**

Write unit and widget tests:

```dart
// test/widgets/button_test.dart
void main() {
  group('FBButton', () {
    testWidgets('FBButton.solid renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FBButton.solid(
              label: 'Click Me',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);
    });

    testWidgets('FBButton.solid calls onPressed callback', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FBButton.solid(
              label: 'Click Me',
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Click Me'));
      expect(pressed, isTrue);
    });
  });
}
```

---

## 🤝 Contributing

We welcome contributions from the community! Follow these guidelines:

### Reporting Issues

```bash
# Navigate to GitHub Issues
# https://github.com/DeveloperRejaul/flutter_beautify/issues

# Include:
# 1. Clear description of the issue
# 2. Steps to reproduce
# 3. Expected vs actual behavior
# 4. Environment (OS, Flutter version, Dart version)
# 5. Code example (if applicable)
```

### Development Setup

```bash
# Clone repository
git clone https://github.com/DeveloperRejaul/flutter_beautify.git
cd flutter_beautify

# Install dependencies
dart pub get

# Run tests
dart test

# Activate locally for testing
dart pub global activate --source path .

# Test commands
flutter_beautify help
flutter_beautify version
```

### Submitting Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Write tests if applicable
5. Commit with clear messages (`git commit -m 'Add amazing feature'`)
6. Push to branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request with detailed description

### Code Style

- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `dartfmt` for formatting
- Write meaningful comments
- Include examples in documentation

---

## 📄 License

Flutter Beautify is open-source software licensed under the [MIT License](LICENSE).

```
MIT License

Copyright (c) 2025 DeveloperRejaul

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

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

## 📊 Statistics

- **26** Production-Ready Components
- **60+** Factory Method Variants
- **20+** Demo Examples
- **100%** Dart Code Coverage (widgets)
- **Active** Maintenance & Support

---

**Made with ❤️ by [DeveloperRejaul](https://github.com/DeveloperRejaul)**

**⭐ If you find this useful, please consider giving it a star on GitHub!**


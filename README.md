# 🎨 Flutter Beautify

A powerful CLI tool for Flutter developers to quickly generate beautiful, customizable widgets and utility functions for your Flutter mobile projects.

![Dart](https://img.shields.io/badge/Dart-3.9.2+-success)
![Pub](https://img.shields.io/badge/pub.dev-flutter--beautify-blue)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## 📑 Table of Contents

- [Quick Features](#quick-features)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Available Components](#available-components)
  - [Widgets](#widgets)
  - [Utilities](#utilities)
- [Configuration](#configuration)
- [Usage Examples](#usage-examples)
- [CLI Commands](#cli-commands)
- [Contributing](#contributing)
- [License](#-license)

---

## 🚀 Quick Features

- ⚡ **Fast Widget Generation** - Create custom widgets with a single CLI command
- 🎯 **Production-Ready** - Pre-built, well-tested widget templates
- 📁 **Smart Configuration** - Initialize custom paths for widgets, utils, and demos
- 🛠️ **Utility Functions** - Validators, formatters, theme helpers included
- 📚 **Demo Examples** - Complete examples for every component
- 🎨 **Consistent Styling** - Material Design 3 compliant components

---

## 📦 Installation

### Prerequisites

- **Dart SDK** 3.9.2 or higher
- **Flutter SDK** (for using components in Flutter projects)

### Step 1: Activate from pub.dev

```bash
dart pub global activate flutter_beautify
```

### Step 2: Verify Installation

```bash
flutter_beautify --help
```

You should see the help menu with all available commands.

---

## 🎯 Quick Start

### Step 1: Initialize Configuration

```bash
flutter_beautify init
```

This command will prompt you to configure paths for:
- **Widgets directory** (default: `lib/widgets`)
- **Utils directory** (default: `lib/utils`)
- **Demo directory** (default: `lib/demo`)

Example:
```
Enter widgets directory path (default: lib/widgets): lib/widgets
Enter utils directory path (default: lib/utils): lib/utils
Enter demo directory path (default: lib/demo): lib/demo
```

### Step 2: Add Components

```bash
flutter_beautify add button
flutter_beautify add textfield
flutter_beautify add card
```

### Step 3: View Configuration

```bash
flutter_beautify config
```

---

## 📱 Available Components

### Widgets

Beautiful, customizable widgets ready for production use:

#### 1. **FBButton** - Custom Button Widget
```bash
flutter_beautify add button
```

**Features:**
- Solid, outline, and link variants
- Icon support (leading icons)
- Customizable colors, padding, and border radius
- Press state handling

**Example Usage:**
```dart
FBButton.solid(
  onPressed: () {},
  title: "Click Me",
  color: Colors.blue,
)

FBButton.outline(
  onPressed: () {},
  title: "Outline Button",
  color: Colors.green,
)

FBButton.link(
  onPressed: () {},
  title: "Link Button",
  color: Colors.blue,
)
```

---

#### 2. **FBCheckbox** - Enhanced Checkbox Widget
```bash
flutter_beautify add checkbox
```

**Features:**
- Label support
- Error state handling
- Customizable colors
- Disabled state
- Error-specific colors

**Example Usage:**
```dart
FBCheckbox(
  value: isChecked,
  onChanged: (value) => setState(() => isChecked = value!),
  label: "Accept Terms",
  boxColor: Colors.green,
  checkColor: Colors.white,
)

FBCheckbox(
  value: hasError,
  onChanged: (value) {},
  label: "Invalid option",
  isError: true,
  errorBoxColor: Colors.red,
)
```

---

#### 3. **FBTextField** - Advanced Text Input
```bash
flutter_beautify add textfield
```

**Features:**
- Label and hint text
- Icon support (prefix/suffix)
- Validation support
- Custom border radius and colors
- Error state display
- Password input support
- Max length and max lines

**Example Usage:**
```dart
FBTextField(
  label: "Email",
  hint: "example@email.com",
  keyboardType: TextInputType.emailAddress,
  prefixIcon: Icon(Icons.email),
  validator: FBValidators.validateEmail,
)

FBTextField(
  label: "Password",
  hint: "Enter password",
  obscureText: true,
  prefixIcon: Icon(Icons.lock),
)
```

---

#### 4. **FBCard** - Versatile Card Container
```bash
flutter_beautify add card
```

**Features:**
- Customizable elevation
- Border radius control
- Tap/click callback
- Custom padding and margin
- Border support
- Click ripple effect

**Example Usage:**
```dart
FBCard(
  elevation: 4,
  padding: EdgeInsets.all(16),
  onTap: () => print("Card tapped"),
  child: Column(
    children: [
      Text("Card Title"),
      Text("Card content here"),
    ],
  ),
)
```

---

#### 5. **FBDialog** - Alert & Confirmation Dialogs
```bash
flutter_beautify add dialog
```

**Features:**
- Simple alert dialogs
- Confirmation dialogs
- Custom dialogs
- Multiple action buttons
- Dismissible control

**Example Usage:**
```dart
FBDialog.show(
  context: context,
  title: "Confirm Delete",
  message: "Are you sure?",
  positiveButtonText: "Delete",
  negativeButtonText: "Cancel",
  onPositive: () => deleteItem(),
)

FBDialog.showCustom(
  context: context,
  title: Text("Success"),
  content: Text("Operation completed!"),
  actions: [
    TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text("OK"),
    ),
  ],
)
```

---

#### 6. **FBSnackbar** - Toast-like Notifications
```bash
flutter_beautify add snackbar
```

**Features:**
- Basic, success, error, warning, info variants
- Action buttons
- Customizable duration
- Custom colors and styling
- Margin and behavior control

**Example Usage:**
```dart
FBSnackbar.show(context, message: "Something happened");

FBSnackbar.success(context, message: "Operation successful!");

FBSnackbar.error(context, message: "An error occurred");

FBSnackbar.show(
  context,
  message: "Undo action?",
  actionLabel: "Undo",
  onAction: () => undoLastAction(),
)
```

---

#### 7. **FBToast** - Overlay Toast Notifications
```bash
flutter_beautify add toast
```

**Features:**
- Top/bottom positioning
- Auto-dismiss with duration
- Success, error, warning variants
- Fade in/out animations
- Custom styling

**Example Usage:**
```dart
FBToast.show(
  context,
  message: "Simple toast",
  duration: Duration(seconds: 2),
)

FBToast.success(context, message: "Success!");

FBToast.error(context, message: "Error occurred");

FBToast.show(
  context,
  message: "Top toast",
  position: ToastPosition.top,
)
```

---

#### 8. **FBAppBar** - Custom App Bar
```bash
flutter_beautify add appbar
```

**Features:**
- Customizable title
- Action buttons
- Back button handling
- Elevation control
- Custom colors and styling
- Optional bottom widget

**Example Usage:**
```dart
FBAppBar(
  title: "My App",
  backgroundColor: Colors.blue,
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
  ],
)
```

---

### Utilities

Powerful utility functions for common mobile app development tasks:

#### 1. **FBValidators** - Input Validation
Located in: `lib/utils/validators.dart`

**Available Methods:**
```dart
FBValidators.validateEmail(String? value)
FBValidators.validatePassword(String? value)
FBValidators.validatePhone(String? value)
FBValidators.validateUsername(String? value)
FBValidators.validateUrl(String? value)
FBValidators.validateRequired(String? value)
FBValidators.validateMinLength(String? value, int length)
FBValidators.validateMaxLength(String? value, int length)
```

**Example:**
```dart
FBTextField(
  label: "Email",
  validator: FBValidators.validateEmail,
)

String? error = FBValidators.validatePassword(passwordValue);
if (error != null) print(error);
```

---

#### 2. **FBFormatters** - Text Formatting
Located in: `lib/utils/formatters.dart`

**Available Formatters:**
```dart
FBFormatters.uppercaseFormatter()      // Convert to uppercase
FBFormatters.lowercaseFormatter()      // Convert to lowercase
FBFormatters.currencyFormatter()       // Format as currency
FBFormatters.phoneNumberFormatter()    // Format as phone (XXX) XXX-XXXX
FBFormatters.digitsOnly()              // Allow only numbers
FBFormatters.lettersOnly()             // Allow only letters
FBFormatters.dateFormatter()           // Format as date MM/DD/YYYY
FBFormatters.alphanumericOnly()        // Allow only alphanumeric
```

**Example:**
```dart
FBTextField(
  label: "Phone",
  inputFormatters: [FBFormatters.phoneNumberFormatter()],
)

FBTextField(
  label: "Price",
  inputFormatters: [FBFormatters.currencyFormatter()],
)
```

---

#### 3. **FBTheme** - Theme & Design System
Located in: `lib/utils/theme.dart`

**Theme Variants:**
```dart
FBTheme.lightTheme    // Pre-configured light theme
FBTheme.darkTheme     // Pre-configured dark theme
```

**Color Palette:**
```dart
FBColors.primary       // Primary brand color
FBColors.accent        // Accent color
FBColors.success       // Success/green color
FBColors.warning       // Warning/orange color
FBColors.error         // Error/red color
FBColors.info          // Info/blue color
```

**Spacing Constants:**
```dart
FBSpacing.xs   // 4px
FBSpacing.sm   // 8px
FBSpacing.md   // 16px
FBSpacing.lg   // 24px
FBSpacing.xl   // 32px
FBSpacing.xxl  // 48px
```

**Border Radius Constants:**
```dart
FBBorderRadius.xs    // 4px radius
FBBorderRadius.sm    // 8px radius
FBBorderRadius.md    // 12px radius
FBBorderRadius.lg    // 16px radius
FBBorderRadius.full  // 100px radius
```

**Example:**
```dart
// In main.dart
MaterialApp(
  theme: FBTheme.lightTheme,
  darkTheme: FBTheme.darkTheme,
  home: MyApp(),
)

// Using colors and spacing
Container(
  color: FBColors.primary,
  padding: EdgeInsets.all(FBSpacing.md),
  child: Text("Hello"),
)
```

---

## ⚙️ Configuration

### View Configuration

```bash
flutter_beautify config
```

Output:
```
📋 Current Configuration:
📁 Widgets path: lib/widgets
🛠️  Utils path: lib/utils
📚 Demo path: lib/demo
```

### Reset Configuration

To reconfigure paths, run:
```bash
flutter_beautify init
```

---

## 💡 Usage Examples

### Complete Form Example

```dart
import 'package:flutter/material.dart';
import 'package:example/widgets/textfield.dart';
import 'package:example/widgets/button.dart';
import 'package:example/utils/validators.dart';
import 'package:example/widgets/snackbar.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    final emailError = FBValidators.validateEmail(_emailController.text);
    final passwordError = FBValidators.validatePassword(_passwordController.text);

    if (emailError != null || passwordError != null) {
      FBSnackbar.error(context, message: "Please fix errors");
      return;
    }

    FBSnackbar.success(context, message: "Login successful!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FBTextField(
              label: "Email",
              controller: _emailController,
              validator: FBValidators.validateEmail,
            ),
            SizedBox(height: 16),
            FBTextField(
              label: "Password",
              controller: _passwordController,
              obscureText: true,
              validator: FBValidators.validatePassword,
            ),
            SizedBox(height: 24),
            FBButton.solid(
              onPressed: _handleLogin,
              title: "Login",
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 🔧 CLI Commands

```
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

Examples:
  flutter_beautify init
  flutter_beautify config
  flutter_beautify add button
  flutter_beautify add checkbox
  flutter_beautify add textfield
```

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📚 Related Resources

- [Dart SDK](https://dart.dev/) - Official Dart programming language
- [Flutter](https://flutter.dev/) - Beautiful UI framework
- [pub.dev](https://pub.dev/) - Dart packages repository
- [Material Design 3](https://m3.material.io/) - Design system used

---

## 💬 Support & Feedback

Have questions or found a bug?

- 🐛 **Report Issues:** [GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)
- 💡 **Feature Requests:** Open a new issue with `[Feature Request]` prefix
- 📧 **Email Support:** [devrejaul.official@gmail.com](mailto:devrejaul.official@gmail.com)
- 🐦 **Twitter:** [@DeveloperRejaul](https://twitter.com/DeveloperRejaul)

---

## 📊 Project Stats

- **Version:** 1.0.4
- **Dart SDK:** 3.9.2+
- **License:** MIT
- **Repository:** [flutter-beautify](https://github.com/DeveloperRejaul/flutter_beautify)
- **Components:** 8 widgets + 3 utilities

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Thanks to the [Dart](https://dart.dev/) and [Flutter](https://flutter.dev/) teams for creating amazing tools
- Inspired by modern CLI tools for developer productivity
- Special thanks to all contributors and users for feedback and support

---

**Made with ❤️ for Flutter developers**

**Happy coding! 🎉**

---
layout: default
title: Getting Started
nav_order: 3
description: "Complete guide to get started with Flutter Beautify"
---

# Getting Started with Flutter Beautify

Welcome! This guide will help you understand and use Flutter Beautify effectively.

## What is Flutter Beautify?

Flutter Beautify is a **production-grade CLI tool** that generates pre-built, customizable UI components for Flutter applications. It saves you time by providing:

- ✅ **26 ready-to-use components** (buttons, cards, forms, etc.)
- ✅ **60+ factory method variants** for each component
- ✅ **Material Design 3 compliance** out of the box
- ✅ **Full customization** - modify colors, sizes, and styles
- ✅ **Zero dependencies** - uses only Flutter's built-in widgets
- ✅ **Production-ready code** - no compromises on quality

## Why Use Flutter Beautify?

### Traditional Approach (Without Flutter Beautify)
```dart
// ❌ You write repetitive code...
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  onPressed: () {},
  child: Text('Click Me'),
)
```

### Flutter Beautify Approach
```dart
// ✅ One line of code!
FBButton.solid(label: 'Click Me', onPressed: () {})
```

**Result:** Less code, more productivity, consistent design!

---

## Quick Comparison

| Feature | Manual | Flutter Beautify |
|---------|--------|------------------|
| Time per component | 30+ lines | 1 line |
| Code reusability | Manual | Automatic |
| Design consistency | Manual | Guaranteed |
| Customization | Full | Full |
| Learning curve | Steep | Gentle |
| Maintenance | Complex | Simple |

---

## Component Categories

Flutter Beautify provides 26 components organized into 6 categories:

### 📝 Form Components (5)
- **TextField** - Text input with variants (email, password, search)
- **Checkbox** - Checkbox with multiple states
- **Radio** - Radio button groups
- **Toggle** - Switch component
- **Dropdown** - Select/dropdown lists

```dart
// Example: Email input
FBTextField.email(
  label: 'Email',
  hintText: 'user@example.com',
)
```

### 🎨 Display Components (5)
- **Card** - Container for content (basic, elevated, outlined)
- **Badge** - Tags and labels
- **Avatar** - User profile pictures
- **Tooltip** - Hover help text
- **Divider** - Visual separators

```dart
// Example: User card
FBCard.elevated(
  child: Column(
    children: [
      FBAvatar.initials(initials: 'JD'),
      Text('John Doe'),
    ],
  ),
)
```

### 🔘 Button Components (4)
- **Button** - Primary buttons (solid, outline, ghost)
- **IconButton** - Icon-only buttons
- **FloatingButton** - Floating action buttons
- **Chip** - Clickable chips

```dart
// Example: Button variants
FBButton.solid(label: 'Save', onPressed: () {})
FBButton.outline(label: 'Cancel', onPressed: () {})
FBButton.ghost(label: 'Learn More', onPressed: () {})
```

### 📐 Layout Components (5)
- **Sidebar** - Navigation sidebar
- **Tabs** - Tab navigation
- **Pagination** - Page navigation
- **Accordion** - Collapsible sections
- **Modal** - Dialog windows

```dart
// Example: Tabs
FBTabs.basic(
  tabs: ['Tab 1', 'Tab 2'],
  children: [
    Text('Content 1'),
    Text('Content 2'),
  ],
)
```

### ⏳ Progress & Loading (4)
- **CircularProgress** - Circular indicators
- **LinearProgress** - Progress bars
- **Skeleton** - Loading skeleton screens
- **Spinner** - Loading animations

```dart
// Example: Loading indicator
FBCircularProgress.determinate(value: 0.7)
FBSpinner.dots()
```

### 📢 Status & Feedback (3)
- **AppBar** - App header
- **Dialog** - Alert dialogs
- **Snackbar** - Bottom notifications

```dart
// Example: Snackbar
ScaffoldMessenger.of(context).showSnackBar(
  FBSnackbar.success(message: 'Saved!'),
)
```

---

## Installation & Setup

### Step 1: Install Flutter Beautify
```bash
dart pub global activate flutter_beautify
```

### Step 2: Initialize Your Project
```bash
cd my_flutter_app
flutter_beautify init
```

You'll be asked:
```
Enter widgets path [lib/widgets]: lib/widgets
Enter utils path [lib/utils]: lib/utils
Enter demo path [lib/demo]: lib/demo
```

### Step 3: Add Your First Component
```bash
flutter_beautify add button
```

This creates: `lib/widgets/button.dart`

### Step 4: Import and Use
```dart
import 'package:my_app/widgets/button.dart';

FBButton.solid(
  label: 'Click Me',
  onPressed: () => print('Clicked!'),
)
```

---

## Common Use Cases

### Login Screen
```bash
flutter_beautify add textfield
flutter_beautify add button
flutter_beautify add divider
```

**Code:**
```dart
Column(
  children: [
    FBTextField.email(label: 'Email'),
    FBTextField.password(label: 'Password'),
    FBButton.solid(label: 'Login', onPressed: () {}),
    FBDivider.text(label: 'OR'),
    FBButton.outline(label: 'Sign Up', onPressed: () {}),
  ],
)
```

### Product List
```bash
flutter_beautify add card
flutter_beautify add badge
flutter_beautify add button
```

**Code:**
```dart
ListView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) {
    final product = products[index];
    return FBCard.elevated(
      child: Column(
        children: [
          if (product.isNew)
            FBBadge.filled(label: 'NEW'),
          Text(product.name),
          Text('\$${product.price}'),
          FBButton.solid(label: 'Add to Cart'),
        ],
      ),
    );
  },
)
```

### Loading States
```bash
flutter_beautify add circular-progress
flutter_beautify add skeleton
flutter_beautify add spinner
```

**Code:**
```dart
if (isLoading) {
  FBCircularProgress.indeterminate()
} else if (hasError) {
  Text('Error loading data')
} else {
  ListView(children: items)
}
```

### Forms with Validation
```bash
flutter_beautify add textfield
flutter_beautify add checkbox
flutter_beautify add radio
flutter_beautify add button
```

**Code:**
```dart
Form(
  key: _formKey,
  child: Column(
    children: [
      FBTextField.outlined(
        label: 'Name',
        validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
      ),
      FBCheckbox.basic(label: 'I agree to terms'),
      FBRadio.vertical(
        options: ['Option 1', 'Option 2'],
        onChanged: (value) {},
      ),
      FBButton.solid(label: 'Submit'),
    ],
  ),
)
```

---

## Factory Methods Explained

Each component has **factory methods** for common variants:

```dart
// Example: Button component
FBButton.solid()      // Filled button
FBButton.outline()    // Outline button
FBButton.ghost()      // Ghost/text button
FBButton.loading()    // Loading state
FBButton.disabled()   // Disabled state

// Each factory method accepts parameters:
FBButton.solid(
  label: 'Click',          // Button text
  onPressed: () {},        // Callback
  backgroundColor: Colors.blue,
  textColor: Colors.white,
  isLoading: false,
)
```

---

## Full Example: Complete Form Screen

```dart
import 'package:flutter/material.dart';
import 'package:my_app/widgets/textfield.dart';
import 'package:my_app/widgets/checkbox.dart';
import 'package:my_app/widgets/button.dart';
import 'package:my_app/widgets/card.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome message
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 24),

              // Form fields
              FBTextField.outlined(
                label: 'Full Name',
                hintText: 'John Doe',
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Name required' : null,
              ),
              SizedBox(height: 16),

              FBTextField.email(
                label: 'Email',
                hintText: 'john@example.com',
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Email required' : null,
              ),
              SizedBox(height: 16),

              FBTextField.password(
                label: 'Password',
                hintText: 'Min 8 characters',
                validator: (value) =>
                    (value?.length ?? 0) < 8 ? 'Min 8 chars' : null,
              ),
              SizedBox(height: 16),

              FBTextField.password(
                label: 'Confirm Password',
                hintText: 'Repeat password',
              ),
              SizedBox(height: 24),

              // Terms checkbox
              FBCheckbox.basic(
                value: agreeToTerms,
                label: 'I agree to Terms & Conditions',
                onChanged: (value) {
                  setState(() => agreeToTerms = value ?? false);
                },
              ),
              SizedBox(height: 24),

              // Buttons
              FBButton.solid(
                label: 'Create Account',
                onPressed: agreeToTerms
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Account created!')),
                          );
                        }
                      }
                    : null,
              ),
              SizedBox(height: 12),

              FBButton.outline(
                label: 'Already have account? Sign In',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**Output:** A complete, production-ready sign-up form with 10 lines of component code!

---

## Next Steps

1. **[Installation Guide](./installation.html)** - Detailed setup instructions
2. **[Component Reference](./widgets/index.html)** - All 26 components documented
3. **[Real-World Examples](./examples.html)** - Copy-paste examples
4. **[CLI Commands](./cli-commands.html)** - Command line reference

---

## Tips & Tricks

### Tip 1: Organize Components by Feature
```bash
flutter_beautify add button   # For auth feature
flutter_beautify add textfield
flutter_beautify add card     # For home feature
```

### Tip 2: Use Factory Methods for Variants
```dart
// Instead of conditional styling:
FBButton.solid()      // Use factory methods
FBButton.outline()
FBButton.ghost()
```

### Tip 3: Combine Components for Complex UIs
```dart
FBCard.elevated(
  child: Column(
    children: [
      FBTextField.outlined(),
      FBCheckbox.basic(),
      FBButton.solid(),
    ],
  ),
)
```

### Tip 4: Check Current Configuration
```bash
flutter_beautify config
```

### Tip 5: Get Help Anytime
```bash
flutter_beautify help
flutter_beautify help add
```

---

## Troubleshooting

### Component file not found
```bash
# Reinitialize configuration
flutter_beautify init
```

### Want to customize components?
- Edit files in `lib/widgets/`
- Each factory method is fully documented
- Extend components with your own factories

### Need custom styling?
```dart
// All components support Flutter's standard theming
Theme(
  data: ThemeData(primaryColor: Colors.blue),
  child: FBButton.solid(label: 'Styled'),
)
```

---

## Support & Resources

- 📖 **Documentation**: Full guides for each component
- 🔧 **CLI Commands**: `flutter_beautify help`
- 🐛 **Issues**: Report on GitHub
- 💬 **Discussions**: Ask questions on GitHub Discussions
- 📧 **Contact**: See CONTACT.md for support channels

---

**Ready to build beautiful UIs faster?** Let's get started! 🚀

[→ Next: Installation Guide](./installation.html)

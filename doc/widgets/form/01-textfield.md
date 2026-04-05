---
layout: default
title: TextField
parent: Form Components
grand_parent: Widgets
nav_order: 1
---

# TextField

Text input field with validation, labels, and multiple states.

**File:** `example/lib/widgets/textfield.dart`

## Factory Methods

- `FBTextField.basic()` - Simple text input
- `FBTextField.outlined()` - Outlined style
- `FBTextField.filled()` - Filled background style
- `FBTextField.labeled()` - With floating label

## Properties

```dart
label: String
hint: String
maxLines: int
minLines: int
obscureText: bool
validator: Function
onChanged: Function
onSubmitted: Function
enabled: bool
enableSuggestions: bool
```

## Usage Example

```dart
FBTextField.outlined(
  label: 'Email',
  hint: 'Enter your email',
  onChanged: (value) => print(value),
)
```

## With Validation

```dart
FBTextField.outlined(
  label: 'Password',
  obscureText: true,
  validator: (value) {
    if (value.isEmpty) return 'Password required';
    if (value.length < 6) return 'Min 6 characters';
    return null;
  },
)
```

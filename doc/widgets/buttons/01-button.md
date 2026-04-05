---
layout: default
title: Button
parent: Button Components
grand_parent: Widgets
nav_order: 1
---

# Button

Primary action button with multiple styles and states.

**File:** `example/lib/widgets/button.dart`

## Factory Methods

- `FBButton.solid()` - Solid filled button
- `FBButton.outlined()` - Outlined border style
- `FBButton.text()` - Text-only button
- `FBButton.gradient()` - Gradient fill button

## Properties

```dart
label: String
onPressed: VoidCallback
icon: IconData
size: ButtonSize (small, medium, large)
disabled: bool
loading: bool
textColor: Color
backgroundColor: Color
borderColor: Color
elevation: double
borderRadius: double
```

## Usage Example

```dart
FBButton.solid(
  label: 'Save',
  onPressed: () => saveData(),
  icon: Icons.check,
)

FBButton.outlined(
  label: 'Cancel',
  onPressed: () => Navigator.pop(context),
)
```

## Loading State

```dart
FBButton.solid(
  label: 'Submit',
  onPressed: _handleSubmit,
  loading: isLoading,
  disabled: isLoading,
)
```

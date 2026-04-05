---
layout: default
title: Snackbar
parent: Feedback & Status
grand_parent: Widgets
nav_order: 2
---

# Snackbar

Bottom notification bar for feedback.

**File:** `example/lib/widgets/snackbar.dart`

## Factory Methods

- `FBSnackbar.basic()` - Simple snackbar
- `FBSnackbar.action()` - With action button
- `FBSnackbar.success()` - Success notification
- `FBSnackbar.error()` - Error notification

## Properties

```dart
message: String
duration: Duration
actionLabel: String
onAction: VoidCallback
backgroundColor: Color
textColor: Color
icon: IconData
```

## Usage Example

```dart
ScaffoldMessenger.of(context).showSnackBar(
  FBSnackbar.action(
    message: 'Item deleted',
    actionLabel: 'Undo',
    onAction: () => restoreItem(),
  ).build(),
);
```

## Success/Error

```dart
FBSnackbar.success(
  message: 'Profile updated!',
  duration: Duration(seconds: 2),
).show(context);

FBSnackbar.error(
  message: 'Update failed!',
  duration: Duration(seconds: 3),
).show(context);
```

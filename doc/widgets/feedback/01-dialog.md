---
layout: default
title: Dialog
parent: Feedback & Status
grand_parent: Widgets
nav_order: 1
---

# Dialog

Modal popup window for important messages.

**File:** `example/lib/widgets/dialog.dart`

## Factory Methods

- `FBDialog.basic()` - Simple dialog
- `FBDialog.alert()` - Alert dialog
- `FBDialog.confirm()` - Confirmation dialog
- `FBDialog.custom()` - Fully customizable

## Properties

```dart
title: String
message: String
confirmLabel: String
cancelLabel: String
onConfirm: VoidCallback
onCancel: VoidCallback
backgroundColor: Color
icon: IconData
```

## Usage Example

```dart
FBDialog.confirm(
  title: 'Delete Item?',
  message: 'This action cannot be undone.',
  confirmLabel: 'Delete',
  cancelLabel: 'Cancel',
  onConfirm: () => deleteItem(),
  onCancel: () => Navigator.pop(context),
).show(context);
```

## Alert

```dart
FBDialog.alert(
  title: 'Warning',
  message: 'Please check your input',
  icon: Icons.warning,
).show(context);
```

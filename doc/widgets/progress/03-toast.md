---
layout: default
title: Toast
parent: Progress & Loading
grand_parent: Widgets
nav_order: 3
---

# Toast

Temporary notification messages.

**File:** `example/lib/widgets/toast.dart`

## Factory Methods

- `FBToast.basic()` - Simple toast
- `FBToast.success()` - Success message
- `FBToast.error()` - Error message
- `FBToast.info()` - Info message

## Properties

```dart
message: String
duration: Duration
backgroundColor: Color
textColor: Color
icon: IconData
action: String
```

## Usage Example

```dart
FBToast.success(
  message: 'Saved successfully!',
  duration: Duration(seconds: 3),
).show(context);

FBToast.error(
  message: 'An error occurred',
  duration: Duration(seconds: 3),
).show(context);
```

## Try-Catch Handler

```dart
try {
  await saveData();
  FBToast.success(message: 'Data saved').show(context);
} catch (e) {
  FBToast.error(message: 'Save failed: $e').show(context);
}
```

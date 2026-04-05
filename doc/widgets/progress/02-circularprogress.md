---
layout: default
title: CircularProgress
parent: Progress & Loading
grand_parent: Widgets
nav_order: 2
---

# CircularProgress

Circular progress indicator for percentage-based progress.

**File:** `example/lib/widgets/circular_progress.dart`

## Factory Methods

- `FBCircularProgress.basic()` - Simple circle
- `FBCircularProgress.labeled()` - With center label
- `FBCircularProgress.indeterminate()` - Indefinite loading
- `FBCircularProgress.stroke()` - Thin stroke style

## Properties

```dart
value: double (0.0 to 1.0)
strokeWidth: double
backgroundColor: Color
valueColor: Color
label: String
size: double
```

## Usage Example

```dart
FBCircularProgress.labeled(
  value: 0.75,
  label: '75%',
  strokeWidth: 4,
)
```

## Indeterminate Loading

```dart
FBCircularProgress.indeterminate(
  size: 48,
  strokeWidth: 4,
)
```

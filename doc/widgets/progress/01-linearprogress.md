---
layout: default
title: LinearProgress
parent: Progress & Loading
grand_parent: Widgets
nav_order: 1
---

# LinearProgress

Linear progress bar for determinate operations.

**File:** `example/lib/widgets/linear_progress.dart`

## Factory Methods

- `FBLinearProgress.basic()` - Simple progress bar
- `FBLinearProgress.labeled()` - With percentage label
- `FBLinearProgress.animated()` - Smooth animation
- `FBLinearProgress.striped()` - Striped pattern

## Properties

```dart
value: double (0.0 to 1.0)
minHeight: double
backgroundColor: Color
valueColor: Color
semanticsLabel: String
semanticsValue: String
```

## Usage Example

```dart
Column(
  children: [
    Text('Download Progress'),
    FBLinearProgress.animated(
      value: 0.65,
      minHeight: 8,
    ),
  ],
)
```

## With Label

```dart
FBLinearProgress.labeled(
  value: downloadProgress,
  label: '${(downloadProgress * 100).toStringAsFixed(0)}%',
  minHeight: 12,
)
```

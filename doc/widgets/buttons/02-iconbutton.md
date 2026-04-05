---
layout: default
title: IconButton
parent: Button Components
grand_parent: Widgets
nav_order: 2
---

# IconButton

Icon-based button without text label.

**File:** `example/lib/widgets/button.dart`

## Factory Methods

- `FBIconButton.basic()` - Simple icon button
- `FBIconButton.filled()` - Filled background
- `FBIconButton.outlined()` - Outlined style
- `FBIconButton.tonal()` - Tonal fill

## Properties

```dart
icon: IconData
onPressed: VoidCallback
color: Color
backgroundColor: Color
size: double
tooltip: String
enabled: bool
```

## Usage Example

```dart
FBIconButton.filled(
  icon: Icons.delete,
  onPressed: () => deleteItem(),
  tooltip: 'Delete',
)

FBIconButton.outlined(
  icon: Icons.edit,
  onPressed: () => editItem(),
  tooltip: 'Edit',
)
```

## Icon Row

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    FBIconButton.filled(
      icon: Icons.edit,
      onPressed: () {},
    ),
    FBIconButton.filled(
      icon: Icons.delete,
      onPressed: () {},
    ),
    FBIconButton.filled(
      icon: Icons.share,
      onPressed: () {},
    ),
  ],
)
```

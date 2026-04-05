---
layout: default
title: Tooltip
parent: Feedback & Status
grand_parent: Widgets
nav_order: 4
---

# Tooltip

Contextual help text on hover/tap.

**File:** `example/lib/widgets/tooltip.dart`

## Factory Methods

- `FBTooltip.basic()` - Simple tooltip
- `FBTooltip.rich()` - Rich formatted text
- `FBTooltip.icon()` - Icon with tooltip
- `FBTooltip.custom()` - Custom styling

## Properties

```dart
message: String
child: Widget
showDuration: Duration
waitDuration: Duration
backgroundColor: Color
textColor: Color
preferBelow: bool
verticalOffset: double
```

## Usage Example

```dart
FBTooltip.basic(
  message: 'Save your work',
  child: FloatingActionButton(
    onPressed: () => save(),
    child: Icon(Icons.save),
  ),
)
```

## Icon Buttons with Tooltips

```dart
Row(
  children: [
    FBTooltip.basic(
      message: 'Edit',
      child: IconButton(icon: Icons.edit, onPressed: () {}),
    ),
    FBTooltip.basic(
      message: 'Delete',
      child: IconButton(icon: Icons.delete, onPressed: () {}),
    ),
  ],
)
```

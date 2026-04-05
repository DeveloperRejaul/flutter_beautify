---
layout: default
title: BottomSheet
parent: Layout Components
grand_parent: Widgets
nav_order: 2
---

# BottomSheet

Sliding panel from the bottom of the screen.

**File:** `example/lib/widgets/bottom_sheet.dart`

## Factory Methods

- `FBBottomSheet.basic()` - Standard bottom sheet
- `FBBottomSheet.modal()` - Modal overlay sheet
- `FBBottomSheet.persistent()` - Persistent layout
- `FBBottomSheet.expanded()` - Full screen sheet

## Properties

```dart
title: String
child: Widget
height: double
isDismissible: bool
enableDrag: bool
backgroundColor: Color
shape: ShapeBorder
```

## Usage Example

```dart
showModalBottomSheet(
  context: context,
  builder: (_) => FBBottomSheet.modal(
    title: 'Options',
    child: ListView(
      children: [
        ListTile(title: Text('Option 1')),
        ListTile(title: Text('Option 2')),
        ListTile(title: Text('Option 3')),
      ],
    ),
  ),
)
```

## Menu Bottom Sheet

```dart
FBBottomSheet.basic(
  title: 'Share Options',
  child: Column(
    children: [
      TextButton(
        onPressed: () => share('Facebook'),
        child: Text('Share to Facebook'),
      ),
      TextButton(
        onPressed: () => share('Twitter'),
        child: Text('Share to Twitter'),
      ),
    ],
  ),
)
```

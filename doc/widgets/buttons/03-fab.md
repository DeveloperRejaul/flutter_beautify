---
layout: default
title: FAB
parent: Button Components
grand_parent: Widgets
nav_order: 3
---

# FAB (Floating Action Button)

Prominent action button for primary actions.

**File:** `example/lib/widgets/button.dart`

## Factory Methods

- `FBFAB.circular()` - Circular shape
- `FBFAB.extended()` - Extended with label
- `FBFAB.small()` - Compact size
- `FBFAB.large()` - Large prominent size

## Properties

```dart
icon: IconData
label: String
onPressed: VoidCallback
color: Color
elevation: double
mini: bool
shape: ShapeBorder
backgroundColor: Color
foregroundColor: Color
notification: String
```

## Usage Example

```dart
Scaffold(
  floatingActionButton: FBFAB.extended(
    icon: Icons.add,
    label: 'Add Item',
    onPressed: () => addNewItem(),
  ),
)

// Or simple circular FAB
Scaffold(
  floatingActionButton: FBFAB.circular(
    icon: Icons.add,
    onPressed: () => addNewItem(),
  ),
)
```

## With Badge

```dart
Stack(
  children: [
    FBFAB.circular(
      icon: Icons.shopping_cart,
      onPressed: () {},
    ),
    Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text('5', style: TextStyle(color: Colors.white)),
      ),
    ),
  ],
)
```

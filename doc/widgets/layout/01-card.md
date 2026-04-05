---
layout: default
title: Card
parent: Layout Components
grand_parent: Widgets
nav_order: 1
---

# Card

Material Design card for content containers.

**File:** `example/lib/widgets/card.dart`

## Factory Methods

- `FBCard.basic()` - Simple card container
- `FBCard.elevated()` - Card with elevation
- `FBCard.outlined()` - Card with border
- `FBCard.filled()` - Filled background card

## Properties

```dart
child: Widget
elevation: double
margin: EdgeInsets
padding: EdgeInsets
color: Color
borderRadius: double
onTap: VoidCallback
shadow: Shadow
```

## Usage Example

```dart
FBCard.elevated(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text('Card Title'),
        Text('Card content goes here'),
      ],
    ),
  ),
)
```

## Card with Image

```dart
FBCard.elevated(
  child: Column(
    children: [
      Image.asset('assets/image.jpg'),
      Padding(
        padding: EdgeInsets.all(16),
        child: Text('Description'),
      ),
    ],
  ),
)
```

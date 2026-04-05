---
layout: default
title: Badge
parent: Feedback & Status
grand_parent: Widgets
nav_order: 3
---

# Badge

Status badge with numbers and indicators.

**File:** `example/lib/widgets/badge.dart`

## Factory Methods

- `FBBadge.basic()` - Simple badge
- `FBBadge.number()` - Numeric badge
- `FBBadge.dot()` - Dot indicator
- `FBBadge.notification()` - Notification style

## Properties

```dart
count: int
backgroundColor: Color
textColor: Color
size: double
position: BadgePosition
child: Widget
```

## Usage Example

```dart
FBBadge.number(
  count: 5,
  backgroundColor: Colors.red,
  child: Icon(Icons.notifications),
)
```

## Badge Positions

```dart
Stack(
  children: [
    Icon(Icons.shopping_cart, size: 32),
    FBBadge.number(
      count: 3,
      position: BadgePosition.topRight,
    ),
  ],
)
```

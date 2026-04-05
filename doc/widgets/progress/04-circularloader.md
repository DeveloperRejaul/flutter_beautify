---
layout: default
title: CircularLoader
parent: Progress & Loading
grand_parent: Widgets
nav_order: 4
---

# CircularLoader

Animated loading spinner for indefinite operations.

**File:** `example/lib/widgets/circular_progress.dart`

## Factory Methods

- `FBCircularLoader.basic()` - Simple spinner
- `FBCircularLoader.dots()` - Dot animation
- `FBCircularLoader.pulse()` - Pulsing effect
- `FBCircularLoader.wave()` - Wave animation

## Properties

```dart
size: double
strokeWidth: double
color: Color
duration: Duration
```

## Usage Example

```dart
FBCircularLoader.dots(
  size: 48,
  color: Colors.blue,
)
```

## Loading Screen

```dart
bool isLoading = false;

Stack(
  children: [
    if (isLoading) _buildContent(),
    if (isLoading)
      Container(
        color: Colors.black.withOpacity(0.3),
        child: Center(
          child: FBCircularLoader.wave(size: 64),
        ),
      ),
  ],
)
```

---
layout: default
title: Slider
parent: Form Components
grand_parent: Widgets
nav_order: 5
---

# Slider

Range/numeric value selection slider with discrete and continuous modes.

**File:** `example/lib/widgets/slider.dart`

## Factory Methods

- `FBSlider.basic()` - Single value slider
- `FBSlider.range()` - Range selection slider
- `FBSlider.labeled()` - With value label
- `FBSlider.steps()` - Discrete steps only

## Properties

```dart
value: double
min: double
max: double
divisions: int
label: String
onChanged: Function(double)
onChangeEnd: Function(double)
activeColor: Color
inactiveColor: Color
```

## Usage Example

```dart
FBSlider.labeled(
  value: volume,
  min: 0,
  max: 100,
  label: 'Volume: $volume%',
  onChanged: (value) => setState(() => volume = value),
)
```

## Range Slider

```dart
FBSlider.range(
  startValue: minPrice,
  endValue: maxPrice,
  min: 0,
  max: 1000,
  onChanged: (start, end) {
    setState(() {
      minPrice = start;
      maxPrice = end;
    });
  },
)
```

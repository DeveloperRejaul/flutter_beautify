---
layout: default
title: ToggleButton
parent: Button Components
grand_parent: Widgets
nav_order: 4
---

# ToggleButton

State-aware button for on/off states.

**File:** `example/lib/widgets/button.dart`

## Factory Methods

- `FBToggleButton.basic()` - Basic toggle
- `FBToggleButton.group()` - Button group
- `FBToggleButton.chipStyle()` - Chip-like toggle
- `FBToggleButton.filled()` - Filled toggle

## Properties

```dart
isSelected: bool
onToggle: Function(bool)
label: String
selectedColor: Color
unselectedColor: Color
enabled: bool
icon: IconData
```

## Usage Example

```dart
FBToggleButton.group(
  isSelected: isSortAscending,
  onToggle: (value) => setState(() => isSortAscending = value),
  label: 'Ascending Sort',
)
```

## Multiple Toggles (Button Group)

```dart
Row(
  children: [
    FBToggleButton.chipStyle(
      isSelected: viewMode == 'list',
      label: 'List',
      onToggle: (v) => setState(() => viewMode = 'list'),
    ),
    FBToggleButton.chipStyle(
      isSelected: viewMode == 'grid',
      label: 'Grid',
      onToggle: (v) => setState(() => viewMode = 'grid'),
    ),
  ],
)
```

---
layout: default
title: Checkbox
parent: Form Components
grand_parent: Widgets
nav_order: 2
---

# Checkbox

Multi-select checkbox component for boolean choices.

**File:** `example/lib/widgets/checkbox.dart`

## Factory Methods

- `FBCheckbox.basic()` - Standard checkbox
- `FBCheckbox.withLabel()` - Checkbox with text label
- `FBCheckbox.outlined()` - Outlined style
- `FBCheckbox.filled()` - Filled style

## Properties

```dart
value: bool
onChanged: Function(bool)
label: String
activeColor: Color
inactiveColor: Color
size: double
enabled: bool
tristate: bool
```

## Usage Example

```dart
FBCheckbox.withLabel(
  value: isChecked,
  label: 'I agree to terms',
  onChanged: (value) => setState(() => isChecked = value),
)
```

## Multiple Checkboxes

```dart
Column(
  children: [
    FBCheckbox.withLabel(
      value: option1,
      label: 'Option 1',
      onChanged: (v) => setState(() => option1 = v),
    ),
    FBCheckbox.withLabel(
      value: option2,
      label: 'Option 2',
      onChanged: (v) => setState(() => option2 = v),
    ),
  ],
)
```

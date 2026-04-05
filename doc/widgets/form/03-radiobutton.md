---
layout: default
title: RadioButton
parent: Form Components
grand_parent: Widgets
nav_order: 3
---

# RadioButton

Single-select radio button for mutually exclusive options.

**File:** `example/lib/widgets/radio_button.dart`

## Factory Methods

- `FBRadioButton.basic()` - Standard radio
- `FBRadioButton.withLabel()` - Radio with text
- `FBRadioButton.card()` - Card-style radio
- `FBRadioButton.outlined()` - Outlined style

## Properties

```dart
value: T
groupValue: T
onChanged: Function(T)
label: String
activeColor: Color
inactiveColor: Color
enabled: bool
```

## Usage Example

```dart
FBRadioButton.withLabel(
  value: 'option1',
  groupValue: selectedOption,
  label: 'Option 1',
  onChanged: (value) => setState(() => selectedOption = value),
)
```

## Radio Group

```dart
Column(
  children: [
    FBRadioButton.withLabel(
      value: 'user',
      groupValue: role,
      label: 'User',
      onChanged: (v) => setState(() => role = v),
    ),
    FBRadioButton.withLabel(
      value: 'admin',
      groupValue: role,
      label: 'Admin',
      onChanged: (v) => setState(() => role = v),
    ),
  ],
)
```

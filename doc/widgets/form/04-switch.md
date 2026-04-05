---
layout: default
title: Switch
parent: Form Components
grand_parent: Widgets
nav_order: 4
---

# Switch

Toggle switch for boolean values with label support.

**File:** `example/lib/widgets/switch.dart`

## Factory Methods

- `FBSwitch.basic()` - Standard toggle
- `FBSwitch.withLabel()` - Switch with label
- `FBSwitch.adaptive()` - Platform-specific style
- `FBSwitch.filled()` - Custom color

## Properties

```dart
value: bool
onChanged: Function(bool)
label: String
activeColor: Color
inactiveColor: Color
enabled: bool
thumbColor: Color
```

## Usage Example

```dart
FBSwitch.withLabel(
  value: isDarkMode,
  label: 'Dark Mode',
  onChanged: (value) => setState(() => isDarkMode = value),
)
```

## Multiple Settings

```dart
Column(
  children: [
    FBSwitch.withLabel(
      value: notifications,
      label: 'Notifications',
      onChanged: (v) => setState(() => notifications = v),
    ),
    FBSwitch.withLabel(
      value: darMode,
      label: 'Dark Mode',
      onChanged: (v) => setState(() => darkMode = v),
    ),
  ],
)
```

---
layout: default
title: API Reference
nav_order: 8
---

# API Reference

Complete API documentation for all Flutter Beautify components, factory methods, and properties.

## Using This Reference

All components follow a consistent pattern:

```dart
FB{ComponentName}.{factoryMethod}(
  // Required properties
  // Optional properties
)
```

---

## Component Index

### Form Components
- [TextField](widgets/form/01-textfield.html)
- [Checkbox](widgets/form/02-checkbox.html)
- [RadioButton](widgets/form/03-radiobutton.html)
- [Switch](widgets/form/04-switch.html)
- [Slider](widgets/form/05-slider.html)

### Button Components
- [Button](widgets/buttons/01-button.html)
- [IconButton](widgets/buttons/02-iconbutton.html)
- [FAB](widgets/buttons/03-fab.html)
- [ToggleButton](widgets/buttons/04-togglebutton.html)

### Layout Components
- [Card](widgets/layout/01-card.html)
- [BottomSheet](widgets/layout/02-bottomsheet.html)
- [Sidebar](widgets/layout/03-sidebar.html)
- [Breadcrumb](widgets/layout/04-breadcrumb.html)
- [Accordion](widgets/layout/05-accordion.html)

### Navigation Components
- [AppBar](widgets/navigation/01-appbar.html)
- [BottomNavigationBar](widgets/navigation/02-bottomnavigationbar.html)
- [Tabs](widgets/navigation/03-tabs.html)
- [Pagination](widgets/navigation/04-pagination.html)
- [Avatar](widgets/navigation/05-avatar.html)

### Progress & Loading
- [LinearProgress](widgets/progress/01-linearprogress.html)
- [CircularProgress](widgets/progress/02-circularprogress.html)
- [Toast](widgets/progress/03-toast.html)
- [CircularLoader](widgets/progress/04-circularloader.html)

### Feedback & Status
- [Dialog](widgets/feedback/01-dialog.html)
- [Snackbar](widgets/feedback/02-snackbar.html)
- [Badge](widgets/feedback/03-badge.html)
- [Tooltip](widgets/feedback/04-tooltip.html)

---

## Common Property Types

### Sizes
```dart
enum ButtonSize { small, medium, large }
```

### Colors
All color properties accept `Color` objects from `flutter/material.dart`:
```dart
backgroundColor: Colors.blue
textColor: Color(0xFF123456)
```

### Callbacks
```dart
typedef VoidCallback = void Function();
typedef ValueChanged<T> = void Function(T value);
typedef WidgetBuilder = Widget Function(BuildContext context);
```

### Icons
Use `IconData` from Material Design Icons:
```dart
icon: Icons.save
icon: Icons.delete
icon: Icons.add_circle
```

---

## Theming

All components respect the current `BuildContext` theme:

```dart
// Dark theme
ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
)

// Light theme (default)
ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
)
```

---

## Accessibility

Flutter Beautify components follow Material Design accessibility guidelines:

- ✅ Semantic labels for screen readers
- ✅ Adequate color contrast ratios
- ✅ Touch target sizes ≥ 48dp
- ✅ Keyboard navigation support

---

**For detailed documentation of each component and its parameters, see** [Components](/doc/components/).


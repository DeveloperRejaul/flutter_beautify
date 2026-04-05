---
layout: default
title: AppBar
parent: Navigation Components
grand_parent: Widgets
nav_order: 1
---

# AppBar

Header component for app navigation and actions.

**File:** `example/lib/widgets/appbar.dart`

## Factory Methods

- `FBAppBar.basic()` - Simple app bar
- `FBAppBar.withActions()` - With action buttons
- `FBAppBar.searchable()` - Integrated search
- `FBAppBar.large()` - Large header style

## Properties

```dart
title: String
actions: List<Widget>
leading: Widget
backgroundColor: Color
elevation: double
centerTitle: bool
toolbarHeight: double
```

## Usage Example

```dart
Scaffold(
  appBar: FBAppBar.withActions(
    title: 'My App',
    actions: [
      IconButton(icon: Icons.search, onPressed: () {}),
      IconButton(icon: Icons.more_vert, onPressed: () {}),
    ],
  ),
)
```

## With Search

```dart
FBAppBar.searchable(
  title: 'Product Search',
  onSearch: (query) => searchProducts(query),
)
```

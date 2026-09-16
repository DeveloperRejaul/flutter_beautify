# Sidebar

A vertical navigation panel built from `SidebarItem` entries, with dark and
collapsible variants for dashboard-style layouts.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/sidebar.dart)

<ComponentPreview slug="sidebar" :height="420">

```dart
FBSidebar.standard(
  items: navItems,
  selectedIndex: currentIndex,
  onItemSelected: (i) => setState(() => currentIndex = i),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="sidebar" />

## Variants

`FBSidebar.standard()` · `FBSidebar.dark()` · `FBSidebar.collapsible()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `items` | `List<SidebarItem>` | required |
| `selectedIndex` | `int` | `0` |
| `onItemSelected` | `ValueChanged<int>?` | — |
| `activeColor` | `Color` | `Colors.blue` |
| `isCollapsed` / `onCollapsedChanged` | `bool` / `ValueChanged<bool>?` | (`.collapsible()` only) |

## Usage

```dart
import 'package:your_app/widgets/sidebar.dart';

FBSidebar.standard(
  items: navItems,
  selectedIndex: currentIndex,
  onItemSelected: (i) => setState(() => currentIndex = i),
);
```

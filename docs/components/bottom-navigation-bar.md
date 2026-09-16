# BottomNavigationBar

A `BottomNavItem`-driven bottom nav bar with a standard and an elevated
look.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/bottom_navigation_bar.dart)

<ComponentPreview slug="bottom-navigation-bar" :height="180">

```dart
FBBottomNavigationBar.standard(
  items: navItems,
  selectedIndex: index,
  onItemSelected: (i) => setState(() => index = i),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="bottom-navigation-bar" />

## Variants

`FBBottomNavigationBar.standard()` · `FBBottomNavigationBar.elevated()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `items` | `List<BottomNavItem>` | required |
| `selectedIndex` | `int` | `0` |
| `onItemSelected` | `ValueChanged<int>?` | — |
| `activeColor` | `Color` | `Colors.blue` |

## Usage

```dart
import 'package:your_app/widgets/bottom_navigation_bar.dart';

Scaffold(
  bottomNavigationBar: FBBottomNavigationBar.elevated(
    items: navItems,
    selectedIndex: index,
    onItemSelected: (i) => setState(() => index = i),
  ),
);
```

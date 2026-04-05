---
layout: default
title: Sidebar
parent: Layout Components
grand_parent: Widgets
nav_order: 3
---

# Sidebar

Navigation sidebar with collapsible sections.

**File:** `example/lib/widgets/sidebar.dart`

## Factory Methods

- `FBSidebar.basic()` - Simple sidebar menu
- `FBSidebar.collapsible()` - Collapsible menu items
- `FBSidebar.icon()` - Icon-based sidebar
- `FBSidebar.drawer()` - Drawer style sidebar

## Properties

```dart
items: List<SidebarItem>
onItemTap: Function(int)
selectedIndex: int
backgroundColor: Color
expandedWidth: double
collapsedWidth: double
```

## Usage Example

```dart
Scaffold(
  drawer: FBSidebar.collapsible(
    items: [
      SidebarItem(label: 'Home', icon: Icons.home),
      SidebarItem(label: 'Profile', icon: Icons.person),
      SidebarItem(label: 'Settings', icon: Icons.settings),
    ],
    onItemTap: (index) => navigateTo(index),
  ),
)
```

## With Sub-Items

```dart
FBSidebar.collapsible(
  items: [
    SidebarItem(label: 'Dashboard', icon: Icons.dashboard),
    SidebarItem(
      label: 'Components',
      icon: Icons.widgets,
      children: [
        SidebarItem(label: 'Buttons'),
        SidebarItem(label: 'Forms'),
        SidebarItem(label: 'Cards'),
      ],
    ),
  ],
)
```

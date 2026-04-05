---
layout: default
title: Tabs
parent: Navigation Components
grand_parent: Widgets
nav_order: 3
---

# Tabs

Tab-based interface for switching content.

**File:** `example/lib/widgets/tabs.dart`

## Factory Methods

- `FBTabs.basic()` - Simple tabs
- `FBTabs.scrollable()` - Scrollable tab list
- `FBTabs.icon()` - Icon-based tabs
- `FBTabs.custom()` - Fully customizable

## Properties

```dart
tabs: List<Tab>
controller: TabController
onTap: Function(int)
indicatorColor: Color
labelColor: Color
unselectedLabelColor: Color
```

## Usage Example

```dart
DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      bottom: FBTabs.basic(
        tabs: [
          Tab(text: 'Tab 1'),
          Tab(text: 'Tab 2'),
          Tab(text: 'Tab 3'),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        Center(child: Text('Content 1')),
        Center(child: Text('Content 2')),
        Center(child: Text('Content 3')),
      ],
    ),
  ),
)
```

## Product Categories

```dart
FBTabs.scrollable(
  tabs: [
    Tab(text: 'Electronics'),
    Tab(text: 'Clothing'),
    Tab(text: 'Books'),
    Tab(text: 'Home &'),
    Tab(text: 'Sports'),
  ],
)
```

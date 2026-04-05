---
layout: default
title: Breadcrumb
parent: Layout Components
grand_parent: Widgets
nav_order: 4
---

# Breadcrumb

Navigation path indicator showing hierarchy.

**File:** `example/lib/widgets/breadcrumb.dart`

## Factory Methods

- `FBBreadcrumb.basic()` - Simple breadcrumb trail
- `FBBreadcrumb.clickable()` - Interactive navigation
- `FBBreadcrumb.styled()` - Custom styled breadcrumb
- `FBBreadcrumb.chevron()` - Chevron separator style

## Properties

```dart
items: List<BreadcrumbItem>
onItemTap: Function(int)
separator: Widget
color: Color
activeColor: Color
```

## Usage Example

```dart
FBBreadcrumb.clickable(
  items: [
    BreadcrumbItem(label: 'Home', onTap: () {}),
    BreadcrumbItem(label: 'Products', onTap: () {}),
    BreadcrumbItem(label: 'Details'),
  ],
)
```

## Ecommerce Example

```dart
FBBreadcrumb.chevron(
  items: [
    BreadcrumbItem(label: 'Home'),
    BreadcrumbItem(label: 'Electronics'),
    BreadcrumbItem(label: 'Smartphones'),
    BreadcrumbItem(label: 'iPhone 14'),
  ],
)
```

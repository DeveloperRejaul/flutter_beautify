---
layout: default
title: Pagination
parent: Navigation Components
grand_parent: Widgets
nav_order: 4
---

# Pagination

Page selection and navigation control.

**File:** `example/lib/widgets/pagination.dart`

## Factory Methods

- `FBPagination.basic()` - Simple page numbers
- `FBPagination.dots()` - Dot indicators
- `FBPagination.arrows()` - Previous/Next arrows
- `FBPagination.custom()` - Custom pagination

## Properties

```dart
currentPage: int
totalPages: int
onPageChanged: Function(int)
previousLabel: String
nextLabel: String
activeColor: Color
inactiveColor: Color
```

## Usage Example

```dart
FBPagination.basic(
  currentPage: currentPage,
  totalPages: 10,
  onPageChanged: (page) => setState(() => currentPage = page),
)
```

## Image Gallery

```dart
Column(
  children: [
    Image.asset('images/image${currentPage}.jpg'),
    SizedBox(height: 16),
    FBPagination.dots(
      currentPage: currentPage,
      totalPages: 5,
      onPageChanged: (page) => setState(() => currentPage = page),
    ),
  ],
)
```

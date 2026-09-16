# Pagination

Page-number controls with a standard (numbered) look and a minimal
prev/next-only look.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/pagination.dart)

<ComponentPreview slug="pagination" :height="180">

```dart
FBPagination.standard(
  totalPages: 10,
  currentPage: page,
  onPageChanged: (p) => setState(() => page = p),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="pagination" />

## Variants

`FBPagination.standard()` (shows page numbers) · `FBPagination.minimal()`
(prev/next only)

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `totalPages` | `int` | required |
| `currentPage` | `int` | `1` |
| `onPageChanged` | `ValueChanged<int>?` | — |

## Usage

```dart
import 'package:your_app/widgets/pagination.dart';

FBPagination.standard(
  totalPages: results.pageCount,
  currentPage: page,
  onPageChanged: (p) => setState(() => page = p),
);
```

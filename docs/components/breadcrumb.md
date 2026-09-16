# Breadcrumb

A path trail built from `BreadcrumbItem` entries, with a plain `/` separator
or a chevron icon separator.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/breadcrumb.dart)

<ComponentPreview slug="breadcrumb" :height="160">

```dart
FBBreadcrumb.standard(
  items: [
    BreadcrumbItem(label: 'Home'),
    BreadcrumbItem(label: 'Settings'),
  ],
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="breadcrumb" />

## Variants

`FBBreadcrumb.standard()` (a `/` separator) · `FBBreadcrumb.arrow()` (a
chevron icon separator)

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `items` | `List<BreadcrumbItem>` | required |

## Usage

```dart
import 'package:your_app/widgets/breadcrumb.dart';

FBBreadcrumb.arrow(
  items: [
    BreadcrumbItem(label: 'Home'),
    BreadcrumbItem(label: 'Products'),
    BreadcrumbItem(label: 'Shoes'),
  ],
);
```

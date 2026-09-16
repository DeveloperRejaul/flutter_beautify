# Badge

A small count/status pill in four sizes, including an outlined look.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/badge.dart)

<ComponentPreview slug="badge" :height="160">

```dart
// No `backgroundColor` → defaults to the ambient Theme's error color.
FBBadge.standard(label: '5');
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="badge" />

## Variants

`FBBadge.standard()` · `FBBadge.small()` · `FBBadge.large()` ·
`FBBadge.outlined()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `label` | `String` | required |
| `backgroundColor` | `Color?` | ambient `colorScheme.error` |
| `textColor` | `Color?` | ambient `colorScheme.onError` |

`.outlined()` uses `borderColor` (and `textColor`) instead of a fill.

## Usage

```dart
import 'package:your_app/widgets/badge.dart';

FBBadge.small(label: unreadCount.toString());
```

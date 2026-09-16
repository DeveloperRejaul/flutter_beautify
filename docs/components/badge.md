# Badge

A small count/status pill in four sizes, including an outlined look.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/badge.dart)

<ComponentPreview slug="badge" :height="160">

```dart
FBBadge.standard(label: '5', backgroundColor: Colors.red);
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
| `backgroundColor` | `Color` | `Colors.red` |
| `textColor` | `Color` | `Colors.white` |

`.outlined()` uses `borderColor` (and `textColor`) instead of a fill.

## Usage

```dart
import 'package:your_app/widgets/badge.dart';

FBBadge.small(label: unreadCount.toString());
```

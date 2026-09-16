# Card

A `Container`-based card with elevation, flat, and outlined looks, plus an
optional `onTap` so it doubles as a tappable surface.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/card.dart)

<ComponentPreview slug="card" :height="280">

```dart
FBCard.elevated(
  elevation: 4,
  child: const Text('Content'),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="card" />

## Variants

`FBCard.elevated()` · `FBCard.flat()` · `FBCard.outlined()` — the plain
constructor forwards to `.elevated()`.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `child` | `Widget` | required |
| `backgroundColor` | `Color?` | ambient `colorScheme.surface` (`surfaceContainerHighest` for `.flat`) |
| `padding` / `margin` | `EdgeInsetsGeometry` | `all(16)` / `all(8)` |
| `borderRadius` | `BorderRadius` | `circular(12)` |
| `onTap` | `VoidCallback?` | — |
| `width` / `height` | `double?` | — |

`.outlined()` adds `borderColor` and `borderWidth` instead of a shadow.

## Usage

```dart
import 'package:your_app/widgets/card.dart';

FBCard.outlined(
  onTap: () => openDetails(item.id),
  child: ListTile(title: Text(item.name)),
);
```

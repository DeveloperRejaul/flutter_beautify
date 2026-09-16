# Button

An `ElevatedButton`-based action button with three built-in styles, an
optional leading icon, and a `color` shorthand instead of hand-building a
`ButtonStyle`.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/button.dart)

<ComponentPreview slug="button" :height="320">

```dart
// No `color` → uses the ambient Theme's primary color automatically.
FBButton.solid(
  onPressed: () {},
  title: 'Save',
  leading: const Icon(Icons.save, size: 20),
);

// Pass `color` to override per-button — use FBColors to stay on-palette.
FBButton.outline(onPressed: () {}, title: 'Cancel', color: FBColors.accent);
FBButton.link(onPressed: () {}, title: 'Learn more');
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="button" />

## Variants

`FBButton.solid()` · `FBButton.outline()` · `FBButton.link()` — the plain
`FBButton(...)` constructor forwards to `.solid()`.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `onPressed` | `VoidCallback?` | — |
| `title` / `child` | `String?` / `Widget?` | — |
| `color` | `Color?` | ambient `Theme.of(context).colorScheme.primary` |
| `leading` | `Icon?` | — |
| `style` | `ButtonStyle?` | — overrides the generated style |

## Usage

```dart
import 'package:your_app/widgets/button.dart';

FBButton.solid(onPressed: save, title: 'Save');
```

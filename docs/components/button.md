# Button

An `ElevatedButton`-based action button with three built-in styles, an
optional leading icon, and a `color` shorthand instead of hand-building a
`ButtonStyle`.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/button.dart)

<ComponentPreview slug="button" :height="320">

```dart
FBButton.solid(
  onPressed: () {},
  title: 'Save',
  color: Colors.deepOrange,
  leading: const Icon(Icons.save, size: 20),
);

FBButton.outline(onPressed: () {}, title: 'Cancel', color: Colors.deepOrange);
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
| `color` | `Color` | `Colors.blue` |
| `leading` | `Icon?` | — |
| `style` | `ButtonStyle?` | — overrides the generated style |

## Usage

```dart
import 'package:your_app/widgets/button.dart';

FBButton.solid(onPressed: save, title: 'Save');
```

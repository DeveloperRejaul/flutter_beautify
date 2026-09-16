# Tooltip

A `Tooltip` wrapper with a light (default) and a dark background preset.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/tooltip.dart)

<ComponentPreview slug="tooltip" :height="160">

```dart
FBTooltip.standard(
  message: 'Save your work',
  child: const Icon(Icons.save),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="tooltip" />

## Variants

`FBTooltip.standard()` · `FBTooltip.dark()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `message` | `String` | required |
| `child` | `Widget` | required — the widget the tooltip wraps |

## Usage

```dart
import 'package:your_app/widgets/tooltip.dart';

FBTooltip.dark(message: 'Delete', child: const Icon(Icons.delete));
```

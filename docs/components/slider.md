# Slider

A `Slider` wrapper with a discrete (tick-divided) variant and a variant that
requires an explicit active color instead of defaulting to blue.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/slider.dart)

<ComponentPreview slug="slider" :height="260">

```dart
FBSlider.standard(
  value: volume,
  onChanged: (v) => setState(() => volume = v),
  min: 0,
  max: 100,
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="slider" />

## Variants

`FBSlider.standard()` · `FBSlider.discrete()` (adds tick `divisions`, default
`10`) · `FBSlider.colored()` (requires `activeColor`)

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `value` | `double` | required |
| `onChanged` | `ValueChanged<double>?` | — |
| `min` / `max` | `double` | `0.0` / `100.0` |
| `divisions` | `int?` | — |
| `label` | `String?` | — |
| `activeColor` | `Color?` | — |

## Usage

```dart
import 'package:your_app/widgets/slider.dart';

FBSlider.standard(
  value: volume,
  onChanged: (v) => setState(() => volume = v),
);
```

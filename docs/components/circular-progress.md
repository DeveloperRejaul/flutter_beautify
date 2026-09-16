# CircularProgress

A circular progress indicator with a percentage-label variant and an
indeterminate spinner variant.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/circular_progress.dart)

<ComponentPreview slug="circular-progress" :height="240">

```dart
FBCircularProgress.withLabel(value: 0.75, size: 100);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="circular-progress" />

## Variants

`FBCircularProgress.standard()` · `FBCircularProgress.withLabel()` (adds a
centered percentage) · `FBCircularProgress.spinner()` (indeterminate — takes
no `value`)

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `value` | `double` | required (not on `.spinner()`) |
| `size` | `double` | `80` |
| `valueColor` | `Color` | `Colors.blue` |
| `strokeWidth` | `double` | `4` |

## Usage

```dart
import 'package:your_app/widgets/circular_progress.dart';

FBCircularProgress.spinner(size: 32);
```

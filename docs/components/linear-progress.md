# LinearProgress

A horizontal progress bar with a percentage-label variant and a striped
variant.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/linear_progress.dart)

<ComponentPreview slug="linear-progress" :height="220">

```dart
FBLinearProgress.withLabel(value: 0.65);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="linear-progress" />

## Variants

`FBLinearProgress.standard()` · `FBLinearProgress.withLabel()` (adds a
percentage label) · `FBLinearProgress.striped()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `value` | `double` | required — `0.0`–`1.0` |
| `height` | `double` | `6` |
| `valueColor` | `Color?` | ambient `colorScheme.primary` |

## Usage

```dart
import 'package:your_app/widgets/linear_progress.dart';

FBLinearProgress.withLabel(value: uploadProgress);
```

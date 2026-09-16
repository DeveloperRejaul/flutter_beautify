# Checkbox

A single-style checkbox with a label and built-in error state, wrapping
Flutter's own `Checkbox` styling knobs (focus color, overlay color, splash
radius) directly as parameters.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/checkbox.dart)

<ComponentPreview slug="checkbox" :height="200">

```dart
FBCheckbox(
  value: agreed,
  onChanged: (v) => setState(() => agreed = v ?? false),
  label: 'I agree to the terms',
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="checkbox" />

## Variants

One constructor, `FBCheckbox(...)` — no named styles, everything is a
parameter (including `isError` for a validation state).

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `value` | `bool` | required |
| `onChanged` | `ValueChanged<bool?>` | required |
| `label` | `String?` | — |
| `boxColor` / `checkColor` | `Color?` | — |
| `isError` | `bool?` | — swaps in `errorBoxColor`/`errorCheckColor` |
| `disable` | `bool?` | — |

## Usage

```dart
import 'package:your_app/widgets/checkbox.dart';

FBCheckbox(
  value: agreed,
  onChanged: (v) => setState(() => agreed = v ?? false),
  label: 'I agree to the terms',
);
```

# RadioButton

A labeled radio button, generic over `T` the same way Flutter's own
`Radio<T>` is — pass whatever type you're using to represent the selected
option.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/radio_button.dart)

<ComponentPreview slug="radio-button" :height="260">

```dart
FBRadioButton<String>.standard(
  value: 'a',
  groupValue: selected,
  onChanged: (v) => setState(() => selected = v),
  label: 'Option A',
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="radio-button" />

## Variants

`FBRadioButton.standard()` · `FBRadioButton.outlined()` — the plain
constructor forwards to `.standard()`.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `value` | `T` | required |
| `groupValue` | `T?` | — the currently selected value |
| `onChanged` | `ValueChanged<T?>?` | — |
| `label` | `String` | `''` |
| `activeColor` | `Color?` | — |
| `size` | `double?` | — |

## Usage

```dart
import 'package:your_app/widgets/radio_button.dart';

FBRadioButton<String>.standard(
  value: 'a',
  groupValue: selected,
  onChanged: (v) => setState(() => selected = v),
  label: 'Option A',
);
```

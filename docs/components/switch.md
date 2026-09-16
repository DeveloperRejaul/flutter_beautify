# Switch

A labeled toggle switch, with a `.tile()` variant that adds a subtitle row
for settings-screen-style rows.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/switch.dart)

<ComponentPreview slug="switch" :height="260">

```dart
FBSwitch.standard(
  value: darkMode,
  onChanged: (v) => setState(() => darkMode = v),
  label: 'Dark mode',
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="switch" />

## Variants

`FBSwitch.standard()` · `FBSwitch.tile()` (adds `subtitle`) ·
`FBSwitch.android()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `value` | `bool` | required |
| `onChanged` | `ValueChanged<bool>?` | — |
| `label` | `String` | `''` |
| `subtitle` | `String?` | — |
| `activeColor` | `Color?` | — |

## Usage

```dart
import 'package:your_app/widgets/switch.dart';

FBSwitch.tile(
  value: darkMode,
  onChanged: (v) => setState(() => darkMode = v),
  label: 'Dark mode',
  subtitle: 'Use a darker color scheme',
);
```

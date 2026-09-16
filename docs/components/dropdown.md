# Dropdown

A `DropdownButtonFormField` wrapper — `items` is the same
`List<DropdownMenuItem<T>>` you'd pass to Flutter's own dropdown.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/dropdown.dart)

<ComponentPreview slug="dropdown" :height="260">

```dart
FBDropdown<String>.outlined(
  value: selected,
  items: const [
    DropdownMenuItem(value: 'a', child: Text('Option A')),
    DropdownMenuItem(value: 'b', child: Text('Option B')),
  ],
  onChanged: (v) => setState(() => selected = v),
  hintText: 'Select an option',
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="dropdown" />

## Variants

`FBDropdown.outlined()` · `FBDropdown.filled()` — the plain constructor
forwards to `.outlined()`.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `value` | `T?` | — |
| `items` | `List<DropdownMenuItem<T>>` | required |
| `onChanged` | `ValueChanged<T?>?` | — |
| `hintText` / `labelText` | `String` | `'Select an option'` / `''` |
| `isExpanded` | `bool` | `true` |

## Usage

```dart
import 'package:your_app/widgets/dropdown.dart';

FBDropdown<String>.outlined(
  value: selected,
  items: options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
  onChanged: (v) => setState(() => selected = v),
);
```

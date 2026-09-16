# DatePicker

A text-field-styled date picker that opens Flutter's own date picker dialog,
with an optional time component.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/date_picker.dart)

<ComponentPreview slug="date-picker" :height="220">

```dart
FBDatePicker.outlined(
  selectedDate: date,
  onDateChanged: (d) => setState(() => date = d),
  hintText: 'Select date',
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="date-picker" />

## Variants

`FBDatePicker.outlined()` · `FBDatePicker.filled()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `selectedDate` | `DateTime?` | — |
| `onDateChanged` | `ValueChanged<DateTime?>?` | — |
| `firstDate` / `lastDate` | `DateTime?` | — |
| `hintText` / `labelText` | `String` | `'Select date'` / `''` |
| `showTime` | `bool` | `false` — adds a time component |

## Usage

```dart
import 'package:your_app/widgets/date_picker.dart';

FBDatePicker.outlined(
  selectedDate: dueDate,
  onDateChanged: (d) => setState(() => dueDate = d),
  showTime: true,
);
```

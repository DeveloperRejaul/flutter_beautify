# Calendar

An inline month-grid calendar, with a standard single-date mode and a range
mode.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/calendar.dart)

<ComponentPreview slug="calendar" :height="420">

```dart
FBCalendar.standard(
  selectedDate: date,
  onDateChanged: (d) => setState(() => date = d),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="calendar" />

## Variants

`FBCalendar.standard()` · `FBCalendar.range()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `selectedDate` | `DateTime?` | — |
| `onDateChanged` | `ValueChanged<DateTime?>?` | — |
| `firstDate` / `lastDate` | `DateTime` | required |

## Usage

```dart
import 'package:your_app/widgets/calendar.dart';

FBCalendar.standard(
  selectedDate: date,
  onDateChanged: (d) => setState(() => date = d),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
);
```

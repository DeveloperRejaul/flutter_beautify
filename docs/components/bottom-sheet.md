# BottomSheet

Static helpers around Flutter's own bottom sheet route — not a widget you
place inline, but a `Future`-returning call you make from a button handler.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/bottom_sheet.dart)

<ComponentPreview slug="bottom-sheet" :height="300">

```dart
FBBottomSheet.standard(
  context: context,
  title: 'Options',
  child: const Text('Sheet content'),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="bottom-sheet" />

## Variants

`FBBottomSheet.standard()` · `FBBottomSheet.scrollable()` ·
`FBBottomSheet.fullscreen()` — each wraps `showModalBottomSheet` /
Flutter's route machinery.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `context` | `BuildContext` | required |
| `child` | `Widget` | required |
| `title` | `String?` | — |
| `isDismissible` / `enableDrag` | `bool` | `true` (standard) |
| `height` | `double?` | (standard, scrollable) |
| `onClose` | `VoidCallback?` | (fullscreen) |

## Usage

```dart
import 'package:your_app/widgets/bottom_sheet.dart';

FBBottomSheet.scrollable(
  context: context,
  title: 'Filters',
  child: FilterList(),
);
```

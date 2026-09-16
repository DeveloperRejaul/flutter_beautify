# Dialog

Static helpers over `showDialog` — an alert (single OK button), a
confirmation (Yes/No), and a fully custom dialog for anything else.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/dialog.dart)

<ComponentPreview slug="dialog" :height="200">

```dart
FBDialog.confirmation(
  context: context,
  title: 'Delete item?',
  message: "This can't be undone.",
  onPositive: () => deleteItem(),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="dialog" />

## Variants

`FBDialog.alert()` · `FBDialog.confirmation()` · `FBDialog.custom()` —
`.show()` and `.showCustom()` also exist as the lower-level entry points
these are built on.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `context` | `BuildContext` | required |
| `title` / `message` | `String` | required |
| `onPositive` / `onNegative` | `VoidCallback?` | (confirmation) |
| `barrierDismissible` | `bool` | `false` (alert) / `true` (confirmation) |

## Usage

```dart
import 'package:your_app/widgets/dialog.dart';

FBDialog.alert(
  context: context,
  title: 'Saved',
  message: 'Your changes have been saved.',
);
```

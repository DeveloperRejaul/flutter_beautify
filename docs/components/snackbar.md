# Snackbar

Static helpers over `ScaffoldMessenger.of(context).showSnackBar`, with color
presets for common message types.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/snackbar.dart)

<ComponentPreview slug="snackbar" :height="200">

```dart
FBSnackbar.success(context, message: 'Saved!');
FBSnackbar.error(context, message: 'Something went wrong', actionLabel: 'Retry', onAction: retry);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="snackbar" />

## Variants

`FBSnackbar.show()` · `.success()` · `.error()` · `.warning()` · `.info()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `context` | `BuildContext` | required |
| `message` | `String` | required |
| `duration` | `Duration` | `3`–`4` seconds depending on variant |
| `actionLabel` / `onAction` | `String?` / `VoidCallback?` | — for an undo-style button |

## Usage

```dart
import 'package:your_app/widgets/snackbar.dart';

FBSnackbar.success(context, message: 'Item saved');
```

# Toast

A self-dismissing message rendered as an `OverlayEntry` — unlike Snackbar, it
doesn't need a `Scaffold` ancestor.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/toast.dart)

<ComponentPreview slug="toast" :height="200">

```dart
FBToast.success(context, message: 'Copied to clipboard');
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="toast" />

## Variants

`FBToast.show()` · `.success()` · `.error()` · `.warning()` · `.dismiss()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `context` | `BuildContext` | required |
| `message` | `String` | required |
| `duration` | `Duration` | `2`–`3` seconds depending on variant |
| `position` | `ToastPosition` | `.bottom` |

## Usage

```dart
import 'package:your_app/widgets/toast.dart';

FBToast.error(context, message: 'Could not connect');
```

# AppBar

A single, fully-parameterized `AppBar` replacement that implements
`PreferredSizeWidget`, so it drops straight into `Scaffold(appBar: ...)`.
There are no named styles — transparency, gradients, and elevation are just
parameter values.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/appbar.dart)

<ComponentPreview slug="appbar" :height="220">

```dart
Scaffold(
  appBar: FBAppBar(
    title: 'My App',
    actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
  ),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="appbar" />

## Variants

One constructor, `FBAppBar(...)`.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `title` / `titleWidget` | `String` / `Widget?` | `''` |
| `actions` | `List<Widget>?` | — |
| `backgroundColor` / `foregroundColor` | `Color` | `Colors.blue` / `Colors.white` |
| `elevation` | `double` | `0.0` |
| `showBackButton` | `bool` | `true` |
| `bottom` | `PreferredSizeWidget?` | — e.g. a `TabBar` |
| `centerTitle` | `bool` | `false` |

## Usage

```dart
import 'package:your_app/widgets/appbar.dart';

Scaffold(
  appBar: FBAppBar(title: 'Dashboard', elevation: 2),
  body: ...,
);
```

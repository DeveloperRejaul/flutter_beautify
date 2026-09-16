# Getting started

## 1. Install the CLI

```bash
dart pub global activate flutter_beautify
```

See [Installation](/guide/installation) if `flutter_beautify` isn't found afterward.

## 2. Point it at your project

Run this from the root of the Flutter project you want widgets added to:

```bash
cd your_flutter_project
flutter_beautify init
```

You'll be asked for three folders (press Enter to accept the defaults):

```
Enter widgets directory path (default: lib/widgets):
Enter utils directory path (default: lib/utils):
Enter demo directory path (default: lib/demo):
```

This writes `.flutter_beautify_config.json` into your project. Only the
widgets path is used by `add` today — see [Configuration](/guide/configuration)
for the details.

## 3. Add a component

```bash
flutter_beautify add button
```

```
Created directory: lib/widgets
Created button widget from template: lib/widgets/button.dart
Import it: import 'package:your_package/widgets/button.dart';
```

The file that lands in your project is a normal, self-contained Dart file —
open it, read it, change it. There's no hidden runtime dependency on
`flutter_beautify` itself.

## 4. Use it

```dart
import 'package:your_app/widgets/button.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FBButton.solid(
          onPressed: () => print('Tapped!'),
          title: 'Click me',
        ),
      ),
    );
  }
}
```

## What's next

- [How `add` works](/guide/how-it-works) — the copy-in model, and why there's no package dependency
- [Components](/components/) — the full catalog, grouped by category
- [Customizing a component](/guide/customizing-a-component) — it's your file now
- [Project structure](/guide/project-structure) — organizing a larger app around `add`
- [CLI commands](/guide/cli-commands) — everything `flutter_beautify` can do

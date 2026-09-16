# Flutter Beautify

[![Pub Version](https://img.shields.io/pub/v/flutter_beautify.svg?color=blue&label=pub.dev)](https://pub.dev/packages/flutter_beautify)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Dart SDK](https://img.shields.io/badge/Dart-2.19%2B-blue)](https://dart.dev)

A CLI that copies ready-made Material 3 Flutter widgets straight into your
project's source tree. No package dependency to maintain, no import to
version-bump — the widget becomes a normal file in your app that you're free
to edit.

**[📖 Full docs](https://developerrejaul.github.io/flutter_beautify/)** ·
**[▶ Live gallery](https://developerrejaul.github.io/flutter_beautify/demo/)** —
every component, actually running in the browser

## Why a copy-paste CLI instead of a widget package?

Importing `package:flutter_beautify` would tie every widget's styling to
whatever this package ships next — and if you want to tweak one button's
padding, you're stuck subclassing or forking. `add` sidesteps that: the file
lands in your project once, under your control, with zero runtime dependency
on this CLI afterward.

## Install

```bash
dart pub global activate flutter_beautify
```

## Use

```bash
cd your_flutter_project
flutter_beautify init          # optional: choose where widgets get written
flutter_beautify add button
```

```dart
import 'package:your_app/widgets/button.dart';

FBButton.solid(
  onPressed: () => print('Tapped!'),
  title: 'Click me',
);
```

See the [Getting started guide](https://developerrejaul.github.io/flutter_beautify/guide/getting-started)
for the full walkthrough.

## Commands

| Command | Does |
| --- | --- |
| `flutter_beautify init` | Prompts for a widgets/utils/demo path and saves it to `.flutter_beautify_config.json` |
| `flutter_beautify config` | Prints the current configuration |
| `flutter_beautify add <component>` | Copies one component into your project |
| `flutter_beautify version` | Prints the CLI version |
| `flutter_beautify help` | Prints command usage |

Full reference: [CLI commands](https://developerrejaul.github.io/flutter_beautify/guide/cli-commands).

## Components

28 components, seven categories, no dependencies beyond `package:flutter`.

| Category | `add <name>` |
| --- | --- |
| Theming & layout | `theme` · `responsive` |
| Form controls | `button` · `checkbox` · `textfield` · `radio-button` · `slider` · `switch` · `dropdown` |
| Layout | `card` · `accordion` · `bottom-sheet` · `sidebar` · `breadcrumb` |
| Navigation | `appbar` · `tabs` · `pagination` · `bottom-navigation-bar` · `avatar` |
| Progress & loading | `linear-progress` · `circular-progress` |
| Feedback & overlays | `dialog` · `snackbar` · `toast` · `badge` · `tooltip` |
| Date & time | `date-picker` · `calendar` |

Each one's available style variants and key parameters are documented on the
[Components](https://developerrejaul.github.io/flutter_beautify/components/)
pages — or just try them in the
[live gallery](https://developerrejaul.github.io/flutter_beautify/demo/).

## Contributing

Bug reports, enhancement proposals, and PR guidelines are in
[CONTRIBUTING.md](CONTRIBUTING.md). For the CLI's own internals — how `add`
finds its templates, the dash-case/snake-case naming convention, testing a
change against a real global install — see [AGENTS.md](AGENTS.md).

## License

MIT — see [LICENSE](LICENSE).

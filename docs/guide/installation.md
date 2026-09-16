# Installation

## Requirements

- Dart SDK `>=2.19.0` (bundled with any recent Flutter install)
- A Flutter project to install widgets into

## Install from pub.dev

```bash
dart pub global activate flutter_beautify
```

This puts a `flutter_beautify` executable on your `PATH` (via `~/.pub-cache/bin`,
which the Dart/Flutter installer usually adds for you). Confirm it's there:

```bash
flutter_beautify version
```

## Install from source

Useful if you want to try an unreleased change:

```bash
git clone https://github.com/DeveloperRejaul/flutter_beautify.git
cd flutter_beautify
dart pub global activate --source path .
```

::: tip Re-activating after editing source
`dart pub global activate --source path .` doesn't always recompile the
cached executable snapshot after you edit the source. If a change doesn't
seem to take effect, run `dart pub global deactivate flutter_beautify` first
and then reactivate.
:::

## Uninstall

```bash
dart pub global deactivate flutter_beautify
```

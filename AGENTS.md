# AGENTS.md

Guidance for coding agents working in this repository.

## What this is

`flutter_beautify` is a **Dart CLI tool**, published to pub.dev, that scaffolds
Material Design 3 Flutter widgets into a user's project. It is installed with
`dart pub global activate flutter_beautify` and then run from *inside a
separate Flutter project* — not from inside this repo. Keep that usage model
in mind for every change to `bin/` or `lib/`.

## Layout

- `bin/flutter_beautify.dart` — entrypoint, dispatches `init` / `config` /
  `add` / `hello` / `version` / `help`.
- `bin/init/init.dart` — `ConfigManager`: interactive `init`, and
  load/save of `.flutter_beautify_config.json` (written into the *user's*
  project directory, not this repo).
- `bin/add/add.dart` — `handleAdd`: validates the component name against
  `validComponents` (dash-case, e.g. `date-picker`) and delegates to `Create`.
- `bin/utils/create.dart` — `Create.widget`: copies a template into the
  user's project at the configured `widgetPath` (default `lib/widgets`).
- `bin/utils/string.dart` — `toSnakeCase` / `toPascalCase` helpers.
- `lib/src/resource_locator.dart` — resolves this package's own install
  directory via `Isolate.resolvePackageUri`, independent of the caller's
  current working directory. **This is how `Create` finds the bundled
  templates when run from inside someone else's project.**
- `example/lib/widgets/*.dart` — this is the **template source of truth**
  for the CLI (file names are snake_case, e.g. `date_picker.dart`), *and*
  the demo Flutter app's widget library at the same time. `example/` is
  published to pub.dev as part of the package, so these files ship with it.
- `example/lib/demo/*.dart` — usage demos for the example app; not used by
  the CLI itself.
- `doc/`, `index.md`, `_config.yml`, `Gemfile` — Jekyll source for the
  GitHub Pages docs site.

## Conventions worth knowing

- CLI-facing component names are **dash-case** (`date-picker`,
  `bottom-navigation-bar`), but template/widget file names are
  **snake_case** (`date_picker.dart`). `Create.widget` converts via
  `toSnakeCase` before touching the filesystem — don't compare a raw
  dash-case name against a file path.
- `Create` must never build template paths relative to the process's
  current working directory (e.g. `File('example/lib/widgets/$name.dart')`).
  The CWD at runtime is the *user's* project. Always resolve the package's
  own files through `lib/src/resource_locator.dart`.
- The destination path (where a widget is written) *should* be CWD-relative
  — that's the user's project — and should honor
  `.flutter_beautify_config.json`'s `widgetPath` rather than hardcoding
  `lib/widgets`.

## Adding a new component

1. Add `example/lib/widgets/<snake_case_name>.dart` (class prefixed `FB…`,
   Material 3, zero non-Flutter dependencies).
2. Add the dash-case name to `validComponents` and the printed list in
   `bin/add/add.dart`.
3. Optionally add a demo under `example/lib/demo/`.
4. Optionally document it under `doc/widgets/`.

## Testing changes to the CLI

There is no automated test suite for `bin/`. Validate manually:

```bash
dart analyze bin lib
```

To test real global-activation behavior (the primary bug class in this
tool — CWD-relative path mistakes), you must run from a directory **other
than this repo**, since testing from inside the repo will hide bugs where
a path accidentally resolves against this repo's own file tree:

```bash
dart pub global activate --source path .
cd /tmp/some-other-dir   # simulate a user's Flutter project
flutter_beautify add date-picker
flutter_beautify init
```

**Stale snapshot gotcha:** `dart pub global activate --source path .` does
not reliably recompile the cached executable snapshot after source edits
(same version number = pub may keep serving the old
`.dart_tool/pub/bin/**/*.snapshot`). If a global-activation test seems to
run old code, delete that snapshot directory (or run
`dart pub global deactivate flutter_beautify` first) before reactivating.

Clean up after testing: `dart pub global deactivate flutter_beautify` and
remove this repo's own `.dart_tool/`.

## Commit conventions

Follow the existing commit style (short, lower-case, imperative). Don't bump
`pubspec.yaml`'s `version` or edit `CHANGELOG.md` unless explicitly asked —
that's a release decision for the maintainer.

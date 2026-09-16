# CLI commands

`flutter_beautify` recognizes five commands. Anything else prints usage and exits non-zero.

## `init`

```bash
flutter_beautify init
```

Interactively asks for three folder paths and writes them to
`.flutter_beautify_config.json` in the current directory:

| Prompt | Default |
| --- | --- |
| Widgets directory | `lib/widgets` |
| Utils directory | `lib/utils` |
| Demo directory | `lib/demo` |

Press Enter on any prompt to accept its default. See
[Configuration](/guide/configuration) for what actually reads these values
today.

## `config`

```bash
flutter_beautify config
```

Prints the current configuration. If `.flutter_beautify_config.json` doesn't
exist yet, it prints the defaults without creating the file.

## `add <component>`

```bash
flutter_beautify add button
flutter_beautify add date-picker
```

Copies one component's template into your project. See the full list on the
[Components](/components/) page — component names are always dash-case
(`bottom-navigation-bar`, not `bottomNavigationBar`), regardless of the
underlying `.dart` file name.

Run `add` with no argument to print the full list of valid component names.

**Behavior:**

- Creates the destination directory if it doesn't exist yet.
- Refuses to overwrite a file that's already there — delete it yourself first
  if you want a fresh copy.
- Exits with a non-zero status if the component name isn't recognized, or if
  something is wrong with the CLI's own install (this should never happen in
  a released version — see [Troubleshooting](/guide/troubleshooting)).

## `version`

```bash
flutter_beautify version
```

Prints the CLI's version string.

## `help`

```bash
flutter_beautify help
```

Prints the command summary. Running `flutter_beautify` with no arguments
does the same thing.

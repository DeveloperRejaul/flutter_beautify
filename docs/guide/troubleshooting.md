# Troubleshooting

## "Unknown command"

You ran something other than `init`, `config`, `add`, `version`, or `help`.
Run `flutter_beautify help` for the exact list.

## "Unknown component: …"

The name after `add` isn't one of the 26 recognized components, or it's
spelled with the wrong separator. Component names are dash-case:
`date-picker`, not `datePicker` or `date_picker`. Run `flutter_beautify add`
with no arguments to print the full, current list.

## "File already exists"

`add` refuses to overwrite an existing widget file so it never silently
destroys edits you've made. Delete or rename the existing file first, then
run `add` again.

## "Template file missing"

This means the CLI's own install is broken or incomplete — it can't find its
bundled component source. This should not happen with a normal
`dart pub global activate flutter_beautify` install. If you hit it:

1. Deactivate and reactivate: `dart pub global deactivate flutter_beautify`
   then `dart pub global activate flutter_beautify` again.
2. If you installed `--source path` from a local clone, make sure the clone's
   `example/lib/widgets/` directory is intact.
3. [Open an issue](https://github.com/DeveloperRejaul/flutter_beautify/issues)
   with your `flutter_beautify version` output and how you installed it.

## `flutter_beautify` command not found after activating

`dart pub global activate` installs into `~/.pub-cache/bin`. Make sure that
directory is on your `PATH` — the Dart and Flutter installers usually add it
automatically, but if you installed Dart another way you may need to add it
yourself. See the [Dart docs on running a package](https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path).

## A change I made to a widget file got overwritten

It didn't — `add` never touches a file that already exists (see above). If a
widget looks different than you remember editing it, check you're looking at
the right path (`widgetPath` from your config, see
[Configuration](/guide/configuration)).

## Still stuck?

[Open an issue](https://github.com/DeveloperRejaul/flutter_beautify/issues) with:

- `flutter_beautify version`
- The exact command you ran
- The full output, including any stack trace

# Customizing a component

Once `add` puts a widget in your project, it's a plain `.dart` file — there's
no `flutter_beautify` API layer to work around. Everything below is just
normal Dart/Flutter editing.

## Change a default

Every widget's defaults are ordinary parameter defaults on its constructor.
To make `FBButton.solid()` default to your brand color instead of
`Colors.blue`, open `lib/widgets/button.dart` and change it once:

```dart
factory FBButton.solid({
  Key? key,
  required VoidCallback? onPressed,
  String? title,
  Widget? child,
  Color color = Colors.blue, // [!code --]
  Color color = Color(0xFF6750A4), // [!code ++]
  ButtonStyle? style,
  Icon? leading,
}) {
```

Every call site that doesn't explicitly pass `color` now picks up the new
default — no wrapper widget needed.

## Remove variants you don't use

If you only ever use `FBTextField.outline()`, delete the `.filled()` and
`.underline()` factory constructors (and their private helper code, if any)
to keep the file smaller. Nothing else in your project references them
unless you've used them elsewhere.

## Rename the class

If you're customizing a component enough that it diverges from what `add`
would give a teammate later, rename the class to make that explicit —
`FBButton` → `AppButton`, for instance. Update the constructor names to
match, then update your imports. This also avoids a collision if a
teammate later runs `add button` for an unrelated, unmodified copy in a
different part of the app.

## Rebuild from the template

If you want to discard your edits and start over from the original
template, delete the file and run `add` again:

```bash
rm lib/widgets/button.dart
flutter_beautify add button
```

There's no CLI-level "diff" or "update" command — the file is yours once
it's copied, for better or worse.

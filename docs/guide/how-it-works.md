# How `add` works

`flutter_beautify` isn't a widget package you import — it's a file copier.
Understanding that model explains most of the CLI's behavior.

## Copy, don't import

When you run `flutter_beautify add button`, the CLI:

1. Converts `button` to its template file name (`button.dart` — see
   [Component naming](#component-naming) below).
2. Reads that file from its own bundled copy of the widget's source.
3. Writes it, unchanged, into your project at the configured widgets path
   (`lib/widgets/button.dart` by default).

That's it. Nothing gets added to your `pubspec.yaml`, and there's no runtime
dependency on `flutter_beautify` afterward — the file is just Dart code that
happens to have started life as a template.

**Why not a package?** A package couples every project using it to whatever
that package ships next: a breaking rename upstream breaks your build, and
tweaking one widget's default padding means subclassing or forking. Copying
the file in means you can edit it immediately, and an upstream change to
`flutter_beautify` never touches code already in your project.

## Component naming

CLI-facing component names are **dash-case** — `date-picker`,
`bottom-navigation-bar` — matching what you see in `add <name>` and on the
[Components](/components/) pages. Internally, the CLI converts that to
**snake_case** to find and write the matching `.dart` file
(`date_picker.dart`). The Dart class inside keeps whatever name it always
had (`FBDatePicker`) — the naming conversion only affects file names, never
your code.

## Finding its own templates

`flutter_beautify` is normally installed with
`dart pub global activate flutter_beautify` and then run from *inside a
different Flutter project* — the templates it copies live in the CLI's own
installation, not in your project. The CLI resolves its own install location
at runtime (rather than assuming a fixed relative path), which is what makes
`add` work identically whether you're running it fresh in a brand-new
project or from a project you've used it in for months.

## What's next

- [Adding a component](/guide/adding-a-component) — the practical walkthrough
- [Customizing a component](/guide/customizing-a-component) — it's your file now

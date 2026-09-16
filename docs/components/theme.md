# Theme

Design tokens — colors, spacing, border radius, and a type scale — plus
ready-to-use `ThemeData` factories built from them. Unlike the other
components, this isn't a widget you place in a layout: it's what you hand to
`MaterialApp`.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/theme.dart)

<ComponentPreview slug="theme" :height="520">

```dart
MaterialApp(
  theme: FBTheme.lightTheme(),
  darkTheme: FBTheme.darkTheme(),
  themeMode: ThemeMode.system,
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="theme" />

## What you get

| Class | Contains |
| --- | --- |
| `FBColors` | `primary`, `accent`, `success`, `warning`, `error`, `info`, neutrals, text and background/surface tokens |
| `FBSpacing` | `xs` (4) · `sm` (8) · `md` (16) · `lg` (24) · `xl` (32) · `xxl` (48) |
| `FBBorderRadius` | `xs` · `sm` · `md` · `lg` · `full` — as ready-to-use `BorderRadius` values |
| `FBTypography` | `textTheme({required color, fontFamily})` — builds a Material `TextTheme` |
| `FBTheme` | `lightTheme(...)` / `darkTheme(...)` — full `ThemeData`, wired from everything above |

Everything in `FBTheme` is built from `FBColors`/`FBSpacing`/`FBBorderRadius`
— change a color there and it propagates through the whole theme.

## Using your own colors

Two ways, depending on how many places need the color:

**One-off / runtime (e.g. white-labeling, a brand-color picker)** — pass it
straight to the theme, no file edits:

```dart
MaterialApp(
  theme: FBTheme.lightTheme(
    primaryColor: Colors.deepPurple,
    accentColor: Colors.amber,
    errorColor: Colors.redAccent,
  ),
  darkTheme: FBTheme.darkTheme(primaryColor: Colors.deepPurple),
);
```

**Permanent brand color** — edit `FBColors.primary` (and friends) directly
in the copied file. Every default in `FBTheme` traces back to `FBColors`,
so this is the one place to change for the whole app:

```dart
class FBColors {
  static const Color primary = Color(0xFF2196F3); // [!code --]
  static const Color primary = Color(0xFF6D28D9); // [!code ++]
  // ...
}
```

## Dark and light mode

`FBTheme.lightTheme()` / `FBTheme.darkTheme()` are two separate `ThemeData`
builds from the same tokens — hand both to `MaterialApp` and let Flutter (or
your own toggle) pick between them:

```dart
MaterialApp(
  theme: FBTheme.lightTheme(),
  darkTheme: FBTheme.darkTheme(),
  themeMode: ThemeMode.system, // .light / .dark to force one
);
```

This isn't just a color swap on `Scaffold` — every FBX widget (`FBButton`,
`FBCard`, `FBCheckbox`, `FBTextField`, ...) reads its default colors from
`Theme.of(context)` rather than hardcoding them, so switching `themeMode`
re-themes the whole component library automatically. Plain Flutter widgets
you didn't get from the CLI (`ElevatedButton`, `Checkbox`, `TabBar`,
`Card`, ...) do too — `FBTheme` wires `elevatedButtonTheme`,
`checkboxTheme`, `switchTheme`, `sliderTheme`, `tabBarTheme`,
`cardTheme`, and friends to the same palette, so a plain
`ElevatedButton()` next to an `FBButton()` still matches.

To let users toggle it at runtime, keep the mode in a `ValueNotifier` (or
your state manager of choice) above `MaterialApp`:

```dart
final themeMode = ValueNotifier(ThemeMode.system);

ValueListenableBuilder<ThemeMode>(
  valueListenable: themeMode,
  builder: (context, mode, _) => MaterialApp(
    theme: FBTheme.lightTheme(),
    darkTheme: FBTheme.darkTheme(),
    themeMode: mode,
    home: const HomeScreen(),
  ),
);

// Anywhere else:
themeMode.value = ThemeMode.dark;
```

An `FBButton` (or any other FBX widget) with an explicit `color:` still
overrides the theme for that one instance in both modes — pass two colors
if you want it to flip too:

```dart
FBButton.solid(
  onPressed: save,
  title: 'Save',
  color: isDark ? FBColors.primaryLight : FBColors.primary,
);
```

## Using a custom font

Register your font with Flutter under `pubspec.yaml`'s `fonts:` section as
usual, then pass the matching family name:

```dart
MaterialApp(
  theme: FBTheme.lightTheme(fontFamily: 'Inter'),
  darkTheme: FBTheme.darkTheme(fontFamily: 'Inter'),
);
```

Leave `fontFamily` unset to use the platform default.

## Usage

```bash
flutter_beautify add theme
```

```dart
import 'package:your_app/widgets/theme.dart';

// In your own widgets, reach for the tokens directly:
Container(
  padding: const EdgeInsets.all(FBSpacing.md),
  decoration: BoxDecoration(
    color: FBColors.surface,
    borderRadius: FBBorderRadius.md,
  ),
);
```

# Project structure

This is a recommendation, not something `flutter_beautify` enforces or
scaffolds — `init` only asks where widgets should land, nothing more. If
you already have a structure that works, there's no reason to change it.

## Feature-based, at a glance

```
lib/
├── main.dart
├── app.dart                 # MaterialApp, top-level routing
├── core/                    # cross-cutting infrastructure
│   ├── router/
│   ├── constants/
│   └── extensions/
├── shared/                  # reusable across two or more features
│   ├── theme/                # ← flutter_beautify add theme
│   ├── responsive/           # ← flutter_beautify add responsive
│   └── widgets/               # ← flutter_beautify's widgetPath
└── features/
    ├── auth/
    │   ├── data/               # repositories, data sources
    │   ├── domain/             # entities, use cases (optional layer)
    │   └── presentation/
    │       ├── screens/
    │       ├── widgets/         # used only within this feature
    │       └── controllers/     # or bloc/, providers/, riverpod/ — your call
    ├── home/
    │   └── ...same shape
    └── profile/
        └── ...same shape
```

The organizing idea: a feature is everything needed to build and ship one
piece of user-facing functionality. Ideally you could delete a
`features/<name>/` folder and only that feature disappears — nothing else
breaks.

## Where flutter_beautify fits in

Run `init` once and point it at `lib/shared/`, not the `lib/widgets`
default:

```
Enter widgets directory path (default: lib/widgets): lib/shared/widgets
```

That's deliberate: everything `add` gives you — `FBButton`, `FBCard`,
`FBTheme`, and so on — starts out generic and reusable, which is exactly
what `lib/shared/` is for.

- **`add theme`** → `lib/shared/theme/theme.dart`. `main.dart`/`app.dart`
  reads `FBTheme.lightTheme()` from here for `MaterialApp(theme: ...)` —
  it's app-level configuration, not any one feature's concern.
- **`add responsive`** → `lib/shared/responsive/responsive.dart`, for the
  same reason: breakpoints apply across the whole app.
- **`add button`, `add card`, etc.** → `lib/shared/widgets/`, as long as
  they stay generic.

## When a component stops being shared

If you heavily customize a copy of, say, `FBButton` for one specific
screen — a one-off shape or animation that doesn't belong anywhere else —
move that file into the feature that owns it:
`lib/features/checkout/presentation/widgets/checkout_button.dart`, renamed
to make the divergence obvious (see
[Customizing a component](/guide/customizing-a-component)). Keep
`lib/shared/widgets/` for things you'd be comfortable using in a feature
you haven't written yet.

## You don't need every layer

The `data/domain/presentation` split under each feature is the
"clean architecture" version — useful once a feature has real business
logic and multiple data sources worth isolating. For a small app, or a
feature that's just a form and a list, `features/<name>/{screens,widgets}`
is enough. Add layers when a feature's complexity actually asks for them,
not upfront.

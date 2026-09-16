# Changelog

## 1.3.2

* Fix `FBTheme.lightTheme()`/`darkTheme()` so `Theme.of(context).colorScheme.primary` (and `.secondary`/`.error`) exactly match the `primaryColor`/`accentColor`/`errorColor` you passed in (or `FBColors.primary`/etc. by default) — `ColorScheme.fromSeed()` was regenerating a different M3 tonal shade instead of keeping the exact color

## 1.3.1

* Every FBX widget now reads its default colors from the ambient `Theme.of(context)` instead of hardcoding `Colors.blue`/`Colors.red`/etc., so `FBTheme.lightTheme()`/`darkTheme()` actually re-themes the whole component library
* `FBTheme` now also wires Material's own component themes (`checkboxTheme`, `switchTheme`, `sliderTheme`, `tabBarTheme`, `cardTheme`, and more) so plain Flutter widgets used without the CLI match too
* Add a "Dark and light mode" section to the theme docs page

## 1.3.0

* Add `theme` component: `FBTheme.lightTheme()`/`darkTheme()` with overridable primary/accent/error colors and font family, plus `FBColors`, `FBSpacing`, `FBBorderRadius`, `FBTypography`
* Add `responsive` component: `FBBreakpoints`, `FBScreenType`, a `BuildContext` extension (`screenWidth`, `screenType`, `isMobile`/`isTablet`/`isDesktop`), `FBResponsiveValue<T>`, and the `FBResponsive` widget
* Rebuild the documentation site on VitePress with a live, interactive Flutter Web component gallery embedded in every component page
* Add a project structure guide recommending a feature-based `lib/{core,shared,features/<name>}` layout

## 1.2.9

* Apply `dart format` to fix the CI format-check step
* Add AGENTS.md/CLAUDE.md for contributor and agent guidance

## 1.2.8

* Fix `add` failing when globally activated and run from another project (templates were looked up relative to the CLI's working directory instead of the package's own install location)
* Fix `add` failing for multi-word components (`date-picker`, `bottom-navigation-bar`, etc.) due to a dash-case/snake-case filename mismatch
* `add` now honors the `widgetPath` saved by `init`/`config` instead of always writing to `lib/widgets`
* Removed an invalid `include:` key from `pubspec.yaml`

* Latest version
## 1.2.7

* Previous update
## 1.2.6

* Previous update
## 1.2.5

* Previous update
## 1.2.4


* Previous update
## 1.2.3

* Previous update
## 1.2.2

## 1.2.1

* Previous update

## 1.2.0

* Previous update

## 1.1.0

* Minor improvements

## 1.0.0

* Initial release

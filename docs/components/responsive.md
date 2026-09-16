# Responsive

Breakpoints, a `BuildContext` extension for reading the current one, and two
small helpers — `FBResponsiveValue` and `FBResponsive` — for picking a value
or a widget based on screen width. No layout system, no dependency — just
the plumbing most apps end up writing by hand anyway.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/responsive.dart)

<ComponentPreview slug="responsive" :height="360">

```dart
FBResponsive(
  mobile: (context) => const _MobileNav(),
  desktop: (context) => const _SidebarNav(),
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="responsive" />

## Breakpoints

`FBBreakpoints` — edit these constants to match your app:

| Name | Width |
| --- | --- |
| `mobile` | `< 600` |
| `tablet` | `600`–`1024` |
| `desktop` | `> 1024` |

## Reading the current breakpoint

The `FBResponsiveContext` extension on `BuildContext`:

```dart
context.screenWidth   // double
context.screenType    // FBScreenType.mobile / .tablet / .desktop
context.isMobile       // bool
context.isTablet       // bool
context.isDesktop      // bool
```

## Picking a value

```dart
final columns = const FBResponsiveValue(
  mobile: 1,
  tablet: 2,
  desktop: 4,
).resolve(context);
```

An omitted `tablet`/`desktop` falls back to the next-smaller value you did
provide — `FBResponsiveValue(mobile: 16, desktop: 32)` uses `16` on tablet
too.

## Picking a widget

```dart
FBResponsive(
  mobile: (context) => const _MobileNav(),
  tablet: (context) => const _MobileNav(),
  desktop: (context) => const _SidebarNav(),
)
```

Same fallback rule as `FBResponsiveValue`.

## Usage

```bash
flutter_beautify add responsive
```

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
- `example/lib/gallery.dart` — the example app's home screen: a categorized
  list of all components that navigates into each demo screen. This is
  what gets compiled to Flutter Web and deployed as the docs site's live
  gallery. Two entries (`theme`, `responsive`) aren't rendered widgets —
  their demo screens visualize design tokens / breakpoint behavior instead.
- `docs/` — the documentation site, built with [VitePress](https://vitepress.dev)
  (`docs/guide/`, `docs/components/`, `docs/.vitepress/config.mts`). Not
  published to pub.dev (see `.pubignore`). Deployed by
  `.github/workflows/deploy-docs.yml`, which also builds `example/` for
  Flutter Web and merges it into the same deployment under `/demo/`.

## Docs site

- Run locally: `npm install && npm run docs:dev`. To see the `<ComponentPreview>`
  iframes actually render (not just the code tab), also run
  `cd example && flutter run -d chrome --web-port 5174` and treat that as the
  local stand-in for the deployed `/demo/` gallery — see the preview note
  below.
- One page per component under `docs/components/<slug>.md` (`slug` matches
  the `add` command, e.g. `date-picker.md`). Each embeds
  `<ComponentPreview slug="...">` (defined in
  `docs/.vitepress/theme/ComponentPreview.vue`), which renders a Preview/Code
  tab pair: Preview is an iframe onto `/flutter_beautify/demo/#/<slug>`,
  Code is whatever markdown/code-fence you put inside the component tag.
  The iframe's `#/<slug>` route only exists if that slug is registered in
  `example/lib/gallery.dart`'s `galleryPreviewRoutes` — add it there first,
  or the preview tab will 404 inside the iframe.
- Documented factory constructors, static methods, and parameters must be
  *real*, read directly from `example/lib/widgets/*.dart` — don't invent a
  variant that isn't in the code. Cross-check with
  `grep -n "factory \|static " example/lib/widgets/<name>.dart` before
  writing or editing an entry.
- Each component page's "CLI" section uses `<CliBlock slug="...">`
  (`docs/.vitepress/theme/CliBlock.vue`), which renders the labeled tab +
  `flutter_beautify add <slug>` command. Both it and `<ComponentPreview>`'s
  code tab display their command via the shared `CommandBox.vue`. Reuse
  `CommandBox` for any new command display rather than a plain `<code>`
  block, to keep every command box visually identical.
- New pages need a sidebar entry in `docs/.vitepress/config.mts` (grouped by
  category, matching `example/lib/gallery.dart`'s categories) — they aren't
  picked up automatically.
- The site uses a monochrome (near-black/white) brand palette instead of
  VitePress's default indigo — set via `:root`/`.dark` overrides of
  `--vp-c-brand-1/2/3` in `docs/.vitepress/theme/custom.css`. Any new
  "dark accent" color in a theme component should reference
  `var(--vp-c-brand-1)` rather than `var(--vp-c-text-1)` or a hardcoded
  value — mixing those was a real bug reported once already (visibly
  different "blacks" sitting next to each other). All theme components,
  `CommandBox` included, use `--vp-c-*` tokens rather than fixed colors —
  a fixed-dark "terminal" box was tried for `CommandBox` and looked wrong
  in light mode, so don't reintroduce hardcoded dark colors there.
- `<ComponentPreview>`'s preview iframe rounds its own bottom corners
  (`border-radius` set directly on the `<iframe>`, not just the ancestor
  `.cp` container) — browsers don't reliably clip an iframe via an
  ancestor's `overflow: hidden` + `border-radius` alone, so without this
  the light Flutter content inside squares off against the panel's rounded
  corners.
- The homepage (`docs/index.md`) embeds `<HeroShowcase>`
  (`docs/.vitepress/theme/HeroShowcase.vue`): a tab row that swaps an
  iframe's `#/<slug>` hash to preview a few components inline in the hero,
  shadcn/ui-style. Because it's a hash-only change on an already-loaded
  Flutter SPA, the iframe's `load` event does **not** refire on tab switch
  — don't reintroduce a `loaded = false` reset in the tab-click handler, or
  the loading spinner gets stuck forever after the first switch.

**Local preview caveat:** the deployed `<ComponentPreview>` iframe points at
`/flutter_beautify/demo/#/<slug>`, which only exists after CI merges the
Flutter Web build into the VitePress output (see `deploy-docs.yml` below).
Running `npm run docs:dev` alone will show a broken/empty iframe in local
dev unless something is also being served at that exact path — running the
Flutter app with `flutter run -d chrome` on a different port does **not**
match that path, so it's only useful for eyeballing the widget itself, not
for verifying the embed end-to-end. To verify the real embed locally, build
both and serve them together:

```bash
npm run docs:build
(cd example && flutter build web --release --base-href /flutter_beautify/demo/)
mkdir -p docs/.vitepress/dist/demo && cp -r example/build/web/. docs/.vitepress/dist/demo/
npx vitepress preview docs
```

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
3. Add a demo under `example/lib/demo/` and register it in
   `example/lib/gallery.dart`'s `galleryCategories` — this both adds it to
   the gallery list and (via `galleryPreviewRoutes`) makes its `/demo/#/<slug>`
   deep link work.
4. Add `docs/components/<dash-case-slug>.md` (copy an existing page's
   structure), add its sidebar entry in `docs/.vitepress/config.mts`, and
   add it to the table in `README.md`.

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

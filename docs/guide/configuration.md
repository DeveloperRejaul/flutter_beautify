# Configuration

`flutter_beautify init` writes a small JSON file into your project:

```json
{
  "widgetPath": "lib/widgets",
  "utilsPath": "lib/utils",
  "demoPath": "lib/demo",
  "timestamp": "2026-01-01T00:00:00.000Z"
}
```

## What each field does today

| Field | Used by |
| --- | --- |
| `widgetPath` | `add` — every component is written here instead of the `lib/widgets` default. |
| `utilsPath` | Reserved. Recorded, but nothing reads it yet. |
| `demoPath` | Reserved. Recorded, but nothing reads it yet. |

If you skip `init` entirely, `add` behaves as though `widgetPath` were
`lib/widgets` — there's no required setup step.

## Changing the path later

Re-run `init` and answer with a new path, or hand-edit
`.flutter_beautify_config.json` directly — it's a plain JSON file, not a
generated artifact you need to regenerate through the CLI.

## Should I commit this file?

Yes. It's project configuration, the same category as `analysis_options.yaml`
— commit it so every contributor's `add` writes widgets to the same place.

## Picking a widgets path

The `lib/widgets` default is fine for a small app. If you're organizing the
project by feature, point it at a shared folder instead — see
[Project structure](/guide/project-structure) for a concrete layout.

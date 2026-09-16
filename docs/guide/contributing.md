# Contributing

The full guidelines — bug reports, pull request process, coding style — live
in [CONTRIBUTING.md](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/CONTRIBUTING.md)
at the repo root. This page only covers working on the docs site itself.

## Running the docs locally

```bash
npm install
npm run docs:dev
```

Opens a local server with hot reload at `http://localhost:5173`.

## Adding a page

Add a Markdown file under `docs/guide/` or `docs/components/`, then list it
in the matching `sidebar` entry in `docs/.vitepress/config.mts` — pages
aren't picked up automatically.

## Component docs stay in sync with code

The component pages describe real factory constructors and static methods
pulled from `example/lib/widgets/*.dart`. If you change a widget's public
API, update its entry under `docs/components/` in the same pull request.

## Building

```bash
npm run docs:build
```

Output goes to `docs/.vitepress/dist`, which is what CI deploys to GitHub
Pages — you don't need to build or commit this yourself.

# Accordion

An expand/collapse list built from `AccordionItem` entries, with an optional
"allow multiple sections open at once" mode.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/accordion.dart)

<ComponentPreview slug="accordion" :height="420">

```dart
FBAccordion.standard(
  items: [
    AccordionItem(
      title: const Text('What is Flutter?'),
      content: const Text('A UI toolkit from Google.'),
    ),
  ],
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="accordion" />

## Variants

`FBAccordion.standard()` · `FBAccordion.outlined()` — the plain constructor
forwards to `.standard()`.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `items` | `List<AccordionItem>` | required — each has `title` and `content` widgets |
| `allowMultipleOpen` | `bool` | `false` |

## Usage

```dart
import 'package:your_app/widgets/accordion.dart';

FBAccordion.standard(
  allowMultipleOpen: true,
  items: faqs.map((f) => AccordionItem(
    title: Text(f.question),
    content: Text(f.answer),
  )).toList(),
);
```

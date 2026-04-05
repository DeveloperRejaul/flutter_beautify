---
layout: default
title: Accordion
parent: Layout Components
grand_parent: Widgets
nav_order: 5
---

# Accordion

Expandable content sections.

**File:** `example/lib/widgets/accordion.dart`

## Factory Methods

- `FBAccordion.basic()` - Simple accordion
- `FBAccordion.multiExpand()` - Multiple open sections
- `FBAccordion.styled()` - Custom styling
- `FBAccordion.custom()` - Fully customizable

## Properties

```dart
items: List<AccordionItem>
onItemExpanded: Function(int)
expandedIndex: int
multiExpand: bool
backgroundColor: Color
headerColor: Color
```

## Usage Example

```dart
FBAccordion.basic(
  items: [
    AccordionItem(
      title: 'Section 1',
      content: Text('Content 1'),
    ),
    AccordionItem(
      title: 'Section 2',
      content: Text('Content 2'),
    ),
    AccordionItem(
      title: 'Section 3',
      content: Text('Content 3'),
    ),
  ],
)
```

## FAQ Accordion

```dart
FBAccordion.basic(
  items: [
    AccordionItem(
      title: 'What is Flutter?',
      content: Text('Flutter is a UI framework...'),
    ),
    AccordionItem(
      title: 'How to install?',
      content: Text('Run: flutter pub global activate...'),
    ),
  ],
)
```

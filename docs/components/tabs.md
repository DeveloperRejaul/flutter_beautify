# Tabs

A `TabItem`-driven tab bar, with a scrollable variant for more tabs than fit
on screen.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/tabs.dart)

<ComponentPreview slug="tabs" :height="260">

```dart
FBTabs.standard(
  tabs: [TabItem(label: 'Home'), TabItem(label: 'Profile')],
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="tabs" />

## Variants

`FBTabs.standard()` · `FBTabs.scrollable()`

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `tabs` | `List<TabItem>` | required |
| `initialIndex` | `int` | `0` |
| `activeColor` | `Color?` | ambient `colorScheme.primary` |

## Usage

```dart
import 'package:your_app/widgets/tabs.dart';

FBTabs.scrollable(
  tabs: categories.map((c) => TabItem(label: c.name)).toList(),
);
```

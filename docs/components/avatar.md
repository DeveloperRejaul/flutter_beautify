---
title: Avatar
---

# Avatar

A circular image component for user profile pictures, with a fallback to
initials or an icon when there's no image. Three shapes — circular, square,
rounded — share the same parameters.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/avatar.dart)

<ComponentPreview slug="avatar" :height="220">

```dart
FBAvatar.circular(imageUrl: user.photoUrl, size: 48);
FBAvatar.circular(initials: 'JD', size: 48); // no image? falls back to initials
FBAvatar.square(initials: 'JD', backgroundColor: Colors.teal);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="avatar" />

## Variants

`FBAvatar.circular()` · `FBAvatar.square()` · `FBAvatar.rounded()` — the
plain `FBAvatar(...)` constructor forwards to `.circular()`.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `imageUrl` | `String?` | — |
| `initials` | `String?` | — used when `imageUrl` is null |
| `size` | `double` | `48` |
| `backgroundColor` | `Color?` | ambient `colorScheme.primary` |
| `onTap` | `VoidCallback?` | — |

## Usage

```dart
import 'package:your_app/widgets/avatar.dart';

FBAvatar.circular(
  imageUrl: user.photoUrl,
  size: 56,
  onTap: () => openProfile(user.id),
);
```

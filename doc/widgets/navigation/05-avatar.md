---
layout: default
title: Avatar
parent: Navigation Components
grand_parent: Widgets
nav_order: 5
---

# Avatar

User profile images and initials.

**File:** `example/lib/widgets/avatar.dart`

## Factory Methods

- `FBAvatar.image()` - Image-based avatar
- `FBAvatar.initials()` - Text initials
- `FBAvatar.icon()` - Icon avatar
- `FBAvatar.gradient()` - Gradient background

## Properties

```dart
imageUrl: String
initials: String
icon: IconData
size: double
backgroundColor: Color
onTap: VoidCallback
borderRadius: double
```

## Usage Example

```dart
FBAvatar.image(
  imageUrl: 'https://example.com/avatar.jpg',
  size: 48,
  onTap: () => showProfile(),
)

FBAvatar.initials(
  initials: 'JD',
  size: 48,
)
```

## User List

```dart
ListView.builder(
  itemCount: users.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: FBAvatar.image(
        imageUrl: users[index].avatar,
        size: 40,
      ),
      title: Text(users[index].name),
      subtitle: Text(users[index].email),
    );
  },
)
```

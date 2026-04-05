---
layout: default
title: BottomNavigationBar
parent: Navigation Components
grand_parent: Widgets
nav_order: 2
---

# BottomNavigationBar

Bottom navigation menu for main sections.

**File:** `example/lib/widgets/bottom_navigation_bar.dart`

## Factory Methods

- `FBBottomNavigationBar.basic()` - Standard nav bar
- `FBBottomNavigationBar.labeled()` - With labels
- `FBBottomNavigationBar.floating()` - Floating style
- `FBBottomNavigationBar.shifted()` - Shifting animation

## Properties

```dart
items: List<NavItem>
onItemTapped: Function(int)
currentIndex: int
backgroundColor: Color
selectedItemColor: Color
unselectedItemColor: Color
type: BottomNavigationBarType
```

## Usage Example

```dart
Scaffold(
  bottomNavigationBar: FBBottomNavigationBar.labeled(
    currentIndex: selectedIndex,
    items: [
      NavItem(icon: Icons.home, label: 'Home'),
      NavItem(icon: Icons.search, label: 'Search'),
      NavItem(icon: Icons.person, label: 'Profile'),
    ],
    onItemTapped: (index) => setState(() => selectedIndex = index),
  ),
)
```

## Multi-Tab App

```dart
class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: FBBottomNavigationBar.labeled(
        currentIndex: _currentIndex,
        items: [
          NavItem(icon: Icons.home, label: 'Home'),
          NavItem(icon: Icons.favorite, label: 'Likes'),
          NavItem(icon: Icons.person, label: 'Profile'),
        ],
        onItemTapped: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return LikesPage();
      case 2:
        return ProfilePage();
      default:
        return HomePage();
    }
  }
}
```

---
layout: default
title: Components
nav_order: 5
parent: Documentation
permalink: /docs/components
---

# Components Reference

Complete guide to all 26 Flutter Beautify components with factory methods.

## Component Categories

- [Form Components](#form-components) (5)
- [Display Components](#display-components) (5)
- [Button Components](#button-components) (4)
- [Layout Components](#layout-components) (5)
- [Progress & Loading](#progress--loading) (4)
- [Status & Feedback](#status--feedback) (3)

---

## Form Components

### 1. TextField

Text input field with multiple variants and states.

**Factory Methods:**
- `FBTextField.basic()` - Basic text field
- `FBTextField.outlined()` - Outlined style
- `FBTextField.filled()` - Filled background
- `FBTextField.password()` - Password with toggle
- `FBTextField.search()` - Search field with icon
- `FBTextField.email()` - Email validation
- `FBTextField.phone()` - Phone number format
- `FBTextField.number()` - Numeric input

**Add to project:**
```bash
flutter_beautify add textfield
```

**Example:**
```dart
import 'package:my_app/widgets/textfield.dart';

FBTextField.outlined(
  label: 'Email',
  hintText: 'Enter your email',
)

FBTextField.password(
  label: 'Password',
  hintText: 'Enter password',
)
```

---

### 2. Checkbox

Checkbox component with multiple states.

**Factory Methods:**
- `FBCheckbox.basic()` - Standard checkbox
- `FBCheckbox.outlined()` - Outlined style
- `FBCheckbox.filled()` - Filled style
- `FBCheckbox.small()` - Small size
- `FBCheckbox.large()` - Large size

**Add to project:**
```bash
flutter_beautify add checkbox
```

**Example:**
```dart
import 'package:my_app/widgets/checkbox.dart';

FBCheckbox.basic(
  value: true,
  onChanged: (value) {},
  label: 'I agree to terms',
)
```

---

### 3. Radio

Radio button component with variants.

**Factory Methods:**
- `FBRadio.basic()` - Basic radio button
- `FBRadio.outlined()` - Outlined style
- `FBRadio.horizontal()` - Horizontal layout
- `FBRadio.vertical()` - Vertical layout

**Add to project:**
```bash
flutter_beautify add radio
```

**Example:**
```dart
import 'package:my_app/widgets/radio.dart';

FBRadio.basic(
  value: 'option1',
  groupValue: selectedOption,
  label: 'Option 1',
  onChanged: (value) {},
)
```

---

### 4. Toggle

Toggle/Switch component.

**Factory Methods:**
- `FBToggle.basic()` - Standard toggle
- `FBToggle.outlined()` - Outlined style
- `FBToggle.small()` - Small size
- `FBToggle.large()` - Large size

**Add to project:**
```bash
flutter_beautify add toggle
```

**Example:**
```dart
import 'package:my_app/widgets/toggle.dart';

FBToggle.basic(
  value: isDarkMode,
  onChanged: (value) {
    setState(() => isDarkMode = value);
  },
)
```

---

### 5. Dropdown

Dropdown/Select component.

**Factory Methods:**
- `FBDropdown.basic()` - Standard dropdown
- `FBDropdown.outlined()` - Outlined style
- `FBDropdown.searchable()` - With search
- `FBDropdown.multiSelect()` - Multi-select

**Add to project:**
```bash
flutter_beautify add dropdown
```

**Example:**
```dart
import 'package:my_app/widgets/dropdown.dart';

FBDropdown.basic(
  initialValue: 'flutter',
  items: const ['flutter', 'react', 'vue'],
  onChanged: (value) {},
)
```

---

## Display Components

### 6. Card

Card container for displaying content.

**Factory Methods:**
- `FBCard.basic()` - Basic card
- `FBCard.elevated()` - Elevated card
- `FBCard.outlined()` - Outlined card
- `FBCard.filled()` - Filled card
- `FBCard.image()` - Card with image

**Add to project:**
```bash
flutter_beautify add card
```

**Example:**
```dart
import 'package:my_app/widgets/card.dart';

FBCard.elevated(
  child: Column(
    children: [
      Text('Card Title'),
      SizedBox(height: 8),
      Text('Card content here'),
    ],
  ),
)
```

---

### 7. Badge

Badge/Tag component.

**Factory Methods:**
- `FBBadge.basic()` - Standard badge
- `FBBadge.outlined()` - Outlined badge
- `FBBadge.filled()` - Filled badge
- `FBBadge.success()` - Success state
- `FBBadge.error()` - Error state

**Add to project:**
```bash
flutter_beautify add badge
```

**Example:**
```dart
import 'package:my_app/widgets/badge.dart';

FBBadge.filled(
  label: 'New',
  color: Colors.blue,
)
```

---

### 8. Avatar

User avatar component.

**Factory Methods:**
- `FBAvatar.basic()` - Image avatar
- `FBAvatar.initials()` - Text initials
- `FBAvatar.icon()` - Icon avatar
- `FBAvatar.small()` - Small size
- `FBAvatar.large()` - Large size

**Add to project:**
```bash
flutter_beautify add avatar
```

**Example:**
```dart
import 'package:my_app/widgets/avatar.dart';

FBAvatar.basic(
  imageUrl: 'https://...',
  size: 40,
)

FBAvatar.initials(
  initials: 'JD',
  backgroundColor: Colors.blue,
)
```

---

### 9. Tooltip

Tooltip hover component.

**Factory Methods:**
- `FBTooltip.basic()` - Standard tooltip
- `FBTooltip.dark()` - Dark theme
- `FBTooltip.light()` - Light theme
- `FBTooltip.arrow()` - With arrow

**Add to project:**
```bash
flutter_beautify add tooltip
```

**Example:**
```dart
import 'package:my_app/widgets/tooltip.dart';

FBTooltip.basic(
  message: 'Helpful hint',
  child: Icon(Icons.help),
)
```

---

### 10. Divider

Visual separator component.

**Factory Methods:**
- `FBDivider.horizontal()` - Horizontal line
- `FBDivider.vertical()` - Vertical line
- `FBDivider.thick()` - Thick divider
- `FBDivider.text()` - With text

**Add to project:**
```bash
flutter_beautify add divider
```

**Example:**
```dart
import 'package:my_app/widgets/divider.dart';

FBDivider.horizontal()

FBDivider.text(label: 'OR')
```

---

## Button Components

### 11. Button

Primary button component.

**Factory Methods:**
- `FBButton.solid()` - Solid filled
- `FBButton.outline()` - Outline style
- `FBButton.ghost()` - Ghost style
- `FBButton.loading()` - Loading state
- `FBButton.disabled()` - Disabled state

**Add to project:**
```bash
flutter_beautify add button
```

**Example:**
```dart
import 'package:my_app/widgets/button.dart';

FBButton.solid(
  label: 'Submit',
  onPressed: () {},
)

FBButton.outline(label: 'Cancel')
```

---

### 12. IconButton

Icon-only button component.

**Factory Methods:**
- `FBIconButton.basic()` - Standard icon button
- `FBIconButton.filled()` - Filled background
- `FBIconButton.outlined()` - Outlined
- `FBIconButton.small()` - Small size

**Add to project:**
```bash
flutter_beautify add icon-button
```

**Example:**
```dart
import 'package:my_app/widgets/icon_button.dart';

FBIconButton.basic(
  icon: Icons.favorite,
  onPressed: () {},
)
```

---

### 13. FloatingButton

Floating action button.

**Factory Methods:**
- `FBFloatingButton.basic()` - Standard FAB
- `FBFloatingButton.extended()` - With label
- `FBFloatingButton.mini()` - Mini size
- `FBFloatingButton.loading()` - Loading state

**Add to project:**
```bash
flutter_beautify add floating-button
```

**Example:**
```dart
import 'package:my_app/widgets/floating_button.dart';

FBFloatingButton.basic(
  icon: Icons.add,
  onPressed: () {},
)
```

---

### 14. Chip

Clickable chip component.

**Factory Methods:**
- `FBChip.basic()` - Standard chip
- `FBChip.filter()` - Filter chip
- `FBChip.input()` - Input chip
- `FBChip.action()` - Action chip

**Add to project:**
```bash
flutter_beautify add chip
```

**Example:**
```dart
import 'package:my_app/widgets/chip.dart';

FBChip.filter(
  label: 'Filter',
  onSelected: (selected) {},
)
```

---

## Layout Components

### 15. Sidebar

Sidebar navigation component.

**Factory Methods:**
- `FBSidebar.basic()` - Standard sidebar
- `FBSidebar.collapsible()` - Collapsible sidebar
- `FBSidebar.dark()` - Dark theme
- `FBSidebar.light()` - Light theme

**Add to project:**
```bash
flutter_beautify add sidebar
```

**Example:**
```dart
import 'package:my_app/widgets/sidebar.dart';

FBSidebar.basic(
  items: [
    SidebarItem('Home', Icons.home),
    SidebarItem('Profile', Icons.person),
    SidebarItem('Settings', Icons.settings),
  ],
)
```

---

### 16. Tabs

Tab navigation component.

**Factory Methods:**
- `FBTabs.basic()` - Standard tabs
- `FBTabs.scrollable()` - Scrollable tabs
- `FBTabs.segmented()` - Segmented tabs
- `FBTabs.vertical()` - Vertical tabs

**Add to project:**
```bash
flutter_beautify add tabs
```

**Example:**
```dart
import 'package:my_app/widgets/tabs.dart';

FBTabs.basic(
  tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
  children: [
    Text('Content 1'),
    Text('Content 2'),
    Text('Content 3'),
  ],
)
```

---

### 17. Pagination

Page navigation component.

**Factory Methods:**
- `FBPagination.basic()` - Standard pagination
- `FBPagination.numbered()` - Numbered pages
- `FBPagination.dots()` - Dot indicators
- `FBPagination.arrows()` - Arrow navigation

**Add to project:**
```bash
flutter_beautify add pagination
```

**Example:**
```dart
import 'package:my_app/widgets/pagination.dart';

FBPagination.numbered(
  totalPages: 10,
  currentPage: 1,
  onPageChanged: (page) {},
)
```

---

### 18. Accordion

Collapsible sections component.

**Factory Methods:**
- `FBAccordion.basic()` - Standard accordion
- `FBAccordion.single()` - Single open at a time
- `FBAccordion.multiple()` - Multiple open
- `FBAccordion.nested()` - Nested accordions

**Add to project:**
```bash
flutter_beautify add accordion
```

**Example:**
```dart
import 'package:my_app/widgets/accordion.dart';

FBAccordion.basic(
  items: [
    AccordionItem('Section 1', Text('Content 1')),
    AccordionItem('Section 2', Text('Content 2')),
  ],
)
```

---

### 19. Modal

Modal dialog component.

**Factory Methods:**
- `FBModal.basic()` - Standard modal
- `FBModal.fullscreen()` - Full screen
- `FBModal.centered()` - Centered modal
- `FBModal.bottomSheet()` - Bottom sheet

**Add to project:**
```bash
flutter_beautify add modal
```

**Example:**
```dart
import 'package:my_app/widgets/modal.dart';

showDialog(
  context: context,
  builder: (context) => FBModal.basic(
    title: 'Confirm',
    child: Text('Are you sure?'),
  ),
)
```

---

## Progress & Loading

### 20. CircularProgress

Circular progress indicator.

**Factory Methods:**
- `FBCircularProgress.basic()` - Standard circular
- `FBCircularProgress.determinate()` - With percentage
- `FBCircularProgress.indeterminate()` - Loading spinner

**Add to project:**
```bash
flutter_beautify add circular-progress
```

**Example:**
```dart
import 'package:my_app/widgets/circular_progress.dart';

FBCircularProgress.determinate(
  value: 0.7,
  size: 50,
)
```

---

### 21. LinearProgress

Linear progress bar.

**Factory Methods:**
- `FBLinearProgress.basic()` - Standard linear
- `FBLinearProgress.determinate()` - With percentage
- `FBLinearProgress.indeterminate()` - Loading bar

**Add to project:**
```bash
flutter_beautify add linear-progress
```

**Example:**
```dart
import 'package:my_app/widgets/linear_progress.dart';

FBLinearProgress.determinate(value: 0.65)
```

---

### 22. Skeleton

Loading skeleton component.

**Factory Methods:**
- `FBSkeleton.line()` - Skeleton line
- `FBSkeleton.circle()` - Skeleton circle
- `FBSkeleton.rectangle()` - Skeleton rectangle
- `FBSkeleton.card()` - Skeleton card

**Add to project:**
```bash
flutter_beautify add skeleton
```

**Example:**
```dart
import 'package:my_app/widgets/skeleton.dart';

FBSkeleton.card()
```

---

### 23. Spinner

Loading spinner animation.

**Factory Methods:**
- `FBSpinner.basic()` - Standard spinner
- `FBSpinner.dots()` - Dot animation
- `FBSpinner.bars()` - Bar animation
- `FBSpinner.pulse()` - Pulse animation

**Add to project:**
```bash
flutter_beautify add spinner
```

**Example:**
```dart
import 'package:my_app/widgets/spinner.dart';

FBSpinner.dots()
```

---

## Status & Feedback

### 24. AppBar

App bar header component.

**Factory Methods:**
- `FBAppBar.basic()` - Standard app bar
- `FBAppBar.withSearch()` - With search
- `FBAppBar.withMenu()` - With menu
- `FBAppBar.transparent()` - Transparent

**Add to project:**
```bash
flutter_beautify add appbar
```

**Example:**
```dart
import 'package:my_app/widgets/appbar.dart';

FBAppBar.basic(
  title: 'My App',
  backgroundColor: Colors.blue,
)
```

---

### 25. Dialog

Dialog component.

**Factory Methods:**
- `FBDialog.basic()` - Standard dialog
- `FBDialog.alert()` - Alert dialog
- `FBDialog.confirmation()` - Confirmation dialog
- `FBDialog.custom()` - Custom dialog

**Add to project:**
```bash
flutter_beautify add dialog
```

**Example:**
```dart
import 'package:my_app/widgets/dialog.dart';

showDialog(
  context: context,
  builder: (context) => FBDialog.confirmation(
    title: 'Confirm Action',
    message: 'Are you sure?',
    onConfirm: () {},
  ),
)
```

---

### 26. Snackbar

Bottom notification component.

**Factory Methods:**
- `FBSnackbar.basic()` - Standard snackbar
- `FBSnackbar.success()` - Success message
- `FBSnackbar.error()` - Error message
- `FBSnackbar.info()` - Info message

**Add to project:**
```bash
flutter_beautify add snackbar
```

**Example:**
```dart
import 'package:my_app/widgets/snackbar.dart';

ScaffoldMessenger.of(context).showSnackBar(
  FBSnackbar.success(
    message: 'Operation completed!',
  ),
)
```

---

## Summary

| Category | Components | Count |
|----------|-----------|-------|
| Form Components | TextField, Checkbox, Radio, Toggle, Dropdown | 5 |
| Display Components | Card, Badge, Avatar, Tooltip, Divider | 5 |
| Button Components | Button, IconButton, FloatingButton, Chip | 4 |
| Layout Components | Sidebar, Tabs, Pagination, Accordion, Modal | 5 |
| Progress & Loading | CircularProgress, LinearProgress, Skeleton, Spinner | 4 |
| Status & Feedback | AppBar, Dialog, Snackbar | 3 |
| **Total** | | **26** |

---

## Usage Tips

### Import Organization

```dart
// Single imports
import 'package:my_app/widgets/button.dart';

// Or organized imports
export 'widgets/button.dart';
export 'widgets/card.dart';
export 'widgets/textfield.dart';
```

### Custom Styling

All components support Flutter's standard theming:

```dart
Theme.of(context).copyWith(
  primaryColor: Colors.blue,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
  ),
)
```

### Responsive Design

Use MediaQuery for responsive layouts:

```dart
final width = MediaQuery.of(context).size.width;
if (width > 600) {
  // Tablet layout
} else {
  // Mobile layout
}
```

---

## Next Steps

- 🚀 [Quick Start](./quick-start.md) - Get started
- 🔧 [CLI Commands](./cli-commands.md) - Command reference
- 📖 [Examples](./examples.md) - Real-world examples

---

[← CLI Commands](./cli-commands.md) | [Examples →](./examples.md)

# Flutter Beautify - Complete Components Reference

**Total Widgets Created: 25+** ✨

All widgets follow the **factory pattern** architecture with multiple style variants. Each widget includes:
- ✓ Private const constructor
- ✓ Multiple factory methods for different styles
- ✓ Production-ready implementation
- ✓ Demo examples
- ✓ Full TypeScript-like documentation

---

## 📦 Form & Input Components

### 1. **FBButton** - Customizable Action Button
```dart
FBButton()                    // Default (solid style)
FBButton.solid()              // Filled button
FBButton.outline()            // Outlined button
FBButton.link()               // Text/link button
```
**Location:** `example/lib/widgets/button.dart`
**Demo:** `example/lib/demo/button_example.dart`

---

### 2. **FBCheckbox** - Custom Checkbox with Labels
```dart
FBCheckbox()                  // Default checkbox
FBCheckbox()                  // Factory with label support
```
**Location:** `example/lib/widgets/checkbox.dart`
**Demo:** `example/lib/demo/checkbox_example.dart`

---

### 3. **FBTextField** - Multi-style Text Input
```dart
FBTextField()                 // Default (outline style)
FBTextField.outline()         // Outlined border
FBTextField.filled()          // Filled background
FBTextField.underline()       // Underline style
```
**Features:**
- Input formatters support
- Error text management
- Label and hint styling
- Focus state handling

**Location:** `example/lib/widgets/textfield.dart`
**Demo:** `example/lib/demo/textfield_example.dart`

---

### 4. **FBDropdown** - Generic Dropdown Selection
```dart
FBDropdown<T>()               // Default (outline style)
FBDropdown.outlined()         // Outlined dropdown
FBDropdown.filled()           // Filled dropdown
```
**Location:** `example/lib/widgets/dropdown.dart`
**Demo:** `example/lib/demo/dropdown_example.dart`

---

### 5. **FBDatePicker** - Date Selection Widget
```dart
FBDatePicker()                // Default (outline style)
FBDatePicker.outlined()       // Outlined date picker
FBDatePicker.filled()         // Filled date picker
```
**Location:** `example/lib/widgets/date_picker.dart`
**Demo:** `example/lib/demo/date_picker_example.dart`

---

### 6. **FBRadioButton** - Radio Selection
```dart
FBRadioButton<T>()            // Default (standard)
FBRadioButton.standard()      // Standard radio button
FBRadioButton.outlined()      // Outlined style
```
**Location:** `example/lib/widgets/radio_button.dart`
**Demo:** `example/lib/demo/radio_button_example.dart`

---

### 7. **FBSlider** - Value Slider
```dart
FBSlider()                    // Default (continuous)
FBSlider.standard()           // Standard slider
FBSlider.discrete()           // Steps/discrete values
FBSlider.colored()            // Custom color
```
**Location:** `example/lib/widgets/slider.dart`
**Demo:** `example/lib/demo/slider_example.dart`

---

### 8. **FBSwitch** - Toggle Switch
```dart
FBSwitch()                    // Default (standard)
FBSwitch.standard()           // Standard switch
FBSwitch.tile()               // Tile/card layout
FBSwitch.android()            // Android Material style
```
**Location:** `example/lib/widgets/switch.dart`
**Demo:** `example/lib/demo/switch_example.dart`

---

## 🎨 Container & Layout Components

### 9. **FBCard** - Elegant Card Container
```dart
FBCard()                      // Default (elevated)
FBCard.elevated()             // Elevated card
FBCard.outlined()             // Outlined card
FBCard.flat()                 // Flat card
```
**Location:** `example/lib/widgets/card.dart`
**Demo:** `example/lib/demo/card_example.dart`

---

### 10. **FBBottomSheet** - Bottom Sheet Modals
```dart
FBBottomSheet.standard()      // Standard bottom sheet
FBBottomSheet.scrollable()    // Scrollable content
FBBottomSheet.fullscreen()    // Full screen modal
```
**Location:** `example/lib/widgets/bottom_sheet.dart`
**Demo:** `example/lib/demo/bottom_sheet_example.dart`

---

### 11. **FBAccordion** - Expandable Accordion
```dart
FBAccordion()                 // Default (standard)
FBAccordion.standard()        // Standard accordion
FBAccordion.outlined()        // Outlined style
```
**Features:**
- Single/multiple expand
- Custom styling
- Smooth animations

**Location:** `example/lib/widgets/accordion.dart`
**Demo:** `example/lib/demo/accordion_example.dart`

---

### 12. **FBAvatar** - User Avatar
```dart
FBAvatar()                    // Default (circular)
FBAvatar.circular()           // Circular avatar
FBAvatar.square()             // Square avatar
FBAvatar.rounded()            // Rounded square
```
**Location:** `example/lib/widgets/avatar.dart`
**Demo:** `example/lib/demo/avatar_example.dart`

---

### 13. **FBBadge** - Label Badges
```dart
FBBadge()                     // Default (standard)
FBBadge.standard()            // Standard badge
FBBadge.small()               // Small badge
FBBadge.large()               // Large badge
FBBadge.outlined()            // Outlined badge
```
**Location:** `example/lib/widgets/badge.dart`
**Demo:** `example/lib/demo/badge_example.dart`

---

## 📱 Navigation Components

### 14. **FBAppBar** - Custom App Bar
```dart
FBAppBar()                    // Default app bar
```
**Location:** `example/lib/widgets/appbar.dart`
**Demo:** `example/lib/demo/appbar_example.dart`

---

### 15. **FBBottomNavigationBar** - Bottom Navigation
```dart
FBBottomNavigationBar()       // Default (standard)
FBBottomNavigationBar.standard()  // Standard bottom nav
FBBottomNavigationBar.elevated()  // Elevated style
```
**Location:** `example/lib/widgets/bottom_navigation_bar.dart`
**Demo:** `example/lib/demo/bottom_navigation_bar_example.dart`

---

### 16. **FBTabs** - Tab Navigation
```dart
FBTabs()                      // Default (standard)
FBTabs.standard()             // Standard tabs
FBTabs.scrollable()           // Scrollable tabs
```
**Location:** `example/lib/widgets/tabs.dart`
**Demo:** `example/lib/demo/tabs_example.dart`

---

### 17. **FBBreadcrumb** - Navigation Breadcrumb
```dart
FBBreadcrumb()                // Default (standard)
FBBreadcrumb.standard()       // Standard breadcrumb
FBBreadcrumb.arrow()          // Arrow separator
```
**Location:** `example/lib/widgets/breadcrumb.dart`
**Demo:** `example/lib/demo/breadcrumb_example.dart`

---

### 18. **FBSidebar** - Side Navigation
```dart
FBSidebar()                   // Default (standard)
FBSidebar.standard()          // Standard sidebar
FBSidebar.collapsible()       // Collapsible sidebar
FBSidebar.dark()              // Dark theme sidebar
```
**Location:** `example/lib/widgets/sidebar.dart`
**Demo:** `example/lib/demo/sidebar_example.dart`

---

## 📊 Data Display Components

### 19. **FBCircularProgress** - Circular Progress Indicator
```dart
FBCircularProgress()          // Default (standard)
FBCircularProgress.standard() // Standard progress
FBCircularProgress.withLabel()// With percentage label
```
**Location:** `example/lib/widgets/circular_progress.dart`
**Demo:** `example/lib/demo/progress_example.dart`

---

### 20. **FBLinearProgress** - Linear Progress Bar
```dart
FBLinearProgress()            // Default (standard)
FBLinearProgress.standard()   // Standard progress
FBLinearProgress.withLabel()  // With label
FBLinearProgress.striped()    // Striped pattern
```
**Location:** `example/lib/widgets/linear_progress.dart`
**Demo:** `example/lib/demo/progress_example.dart`

---

### 21. **FBPagination** - Page Navigation
```dart
FBPagination()                // Default (standard)
FBPagination.standard()       // Standard pagination
FBPagination.minimal()        // Minimal pagination
```
**Location:** `example/lib/widgets/pagination.dart`
**Demo:** `example/lib/demo/pagination_example.dart`

---

### 22. **FBCalendar** - Date Calendar
```dart
FBCalendar()                  // Default (standard)
FBCalendar.standard()         // Standard calendar
FBCalendar.range()            // Range selection
```
**Location:** `example/lib/widgets/calendar.dart`
**Demo:** `example/lib/demo/calendar_example.dart`

---

## 💬 Feedback & Notification Components

### 23. **FBDialog** - Dialog Messages
```dart
FBDialog.alert()              // Alert dialog
FBDialog.confirmation()       // Confirmation dialog
FBDialog.custom()             // Custom dialog
```
**Location:** `example/lib/widgets/dialog.dart`
**Demo:** `example/lib/demo/dialog_example.dart`

---

### 24. **FBSnackbar** - Snackbar Notifications
```dart
FBSnackbar.show()             // Show snackbar
```
**Location:** `example/lib/widgets/snackbar.dart`
**Demo:** `example/lib/demo/snackbar_example.dart`

---

### 25. **FBToast** - Toast Notifications
```dart
FBToast.show()                // Show toast
```
**Location:** `example/lib/widgets/toast.dart`
**Demo:** `example/lib/demo/toast_example.dart`

---

### 26. **FBTooltip** - Hover Tooltips
```dart
FBTooltip()                   // Default (standard)
FBTooltip.standard()          // Standard tooltip
FBTooltip.dark()              // Dark tooltip
```
**Location:** `example/lib/widgets/tooltip.dart`
**Demo:** `example/lib/demo/tooltip_example.dart`

---

## 🎯 Usage Summary

### Quick Reference by Use Case

**Forms & Inputs:**
- Button, Checkbox, TextField, Dropdown, DatePicker, RadioButton, Slider, Switch

**Containers:**
- Card, BottomSheet, Accordion, Avatar, Badge

**Navigation:**
- AppBar, BottomNavigationBar, Tabs, Breadcrumb, Sidebar

**Data & Progress:**
- CircularProgress, LinearProgress, Pagination, Calendar

**Feedback:**
- Dialog, Snackbar, Toast, Tooltip

---

## 🚀 Installation

All components are in `example/lib/widgets/` directory. Copy any widget you need:

```bash
# Add specific component
flutter_beautify add button
flutter_beautify add textfield
flutter_beautify add card

# View all available
flutter_beautify add --help
```

---

## 📖 Factory Pattern Architecture

Every widget follows this pattern:

```dart
class FBComponent extends StatelessWidget {
  final String parameter;
  
  const FBComponent._({
    required this.parameter,
  });
  
  // Default → delegates to primary variant
  factory FBComponent({
    required String parameter,
  }) => FBComponent.primary(parameter: parameter);
  
  // Primary variant
  factory FBComponent.primary({
    required String parameter,
  }) => FBComponent._(parameter: parameter);
  
  // Alternative variant
  factory FBComponent.variant({
    required String parameter,
  }) => FBComponent._(parameter: parameter);
  
  @override
  Widget build(BuildContext context) { ... }
}
```

---

## ✨ Key Features

✅ **Factory Methods:** Multiple style variants per component  
✅ **Const Constructors:** Memory efficient  
✅ **Type Safe:** Generic type support where applicable  
✅ **Customizable:** Colors, sizes, styles all configurable  
✅ **Production Ready:** Error handling, state management  
✅ **Well Documented:** Demo files for each component  
✅ **Material Design 3:** Modern Flutter standards  

---

**Total: 25+ widgets with 60+ factory variants!** 🎉

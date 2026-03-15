# Flutter Beautify - Visual Quick Guide

## 🎯 All 25+ Widgets at a Glance

### Input & Form Components

#### **FBButton** (3 variants)
```
┌─────────────────┐     ┌──────────────┐     ┌──────────────┐
│  SOLID BUTTON   │     │ Outline Btn  │     │  Link Button │
└─────────────────┘     └──────────────┘     └──────────────┘

Usage:
FBButton(label: 'Click')
FBButton.outline(label: 'Cancel')
FBButton.link(label: 'Learn More')
```

#### **FBCheckbox**
```
☑ Remember me
☐ I agree to terms

Usage:
FBCheckbox(value: true, label: 'Remember me')
```

#### **FBTextField** (3 variants)
```
┌──────────────────┐  ┌──────────────────┐  ____________________
│ Outlined Input   │  │ Filled Input     │  Underline Input
│                  │  │ ░░░░░░░░░░░░░░  │
└──────────────────┘  └──────────────────┘

Usage:
FBTextField.outline(labelText: 'Email')
FBTextField.filled(labelText: 'Password')
FBTextField.underline(labelText: 'Name')
```

#### **FBDropdown** (2 variants)
```
┌─────────────────────┐  ┌─────────────────────┐
│ ▼ Select Language   │  │ ▼ Select Language   │
│ ░░░░░░░░░░░░░░░░░  │  │ ░░░░░░░░░░░░░░░░░  │
└─────────────────────┘  └─────────────────────┘

Usage:
FBDropdown<String>(items: [...])
FBDropdown.filled(items: [...])
```

#### **FBDatePicker** (2 variants)
```
┌──────────────────┐  ┌──────────────────┐
│ 📅 2024-03-15    │  │ 📅 2024-03-15    │
│ ░░░░░░░░░░░░░░  │  │ ░░░░░░░░░░░░░░  │
└──────────────────┘  └──────────────────┘

Usage:
FBDatePicker(labelText: 'Birth Date')
FBDatePicker.filled(labelText: 'Birth Date')
```

#### **FBRadioButton** (2 variants)
```
● Option 1          ○ Option 1
○ Option 2          ○ Option 2
○ Option 3          ○ Option 3

Usage:
FBRadioButton(value: 'opt1', groupValue: selected)
FBRadioButton.outlined(value: 'opt1', groupValue: selected)
```

#### **FBSlider** (3 variants)
```
◄─────●────────────► 65
◄──●────────────────► 25 (discrete)
◄─────●────────────► (colored)

Usage:
FBSlider(value: 0.65)
FBSlider.discrete(value: 25, divisions: 10)
FBSlider.colored(value: 65, activeColor: Colors.red)
```

#### **FBSwitch** (3 variants)
```
Notifications    [◉────○]    [◉────○]    [◉────○]
Dark Mode        Standard     Tile       Android

Usage:
FBSwitch(value: true, label: 'Notifications')
FBSwitch.tile(value: true, label: 'Dark Mode')
FBSwitch.android(value: true, label: 'WiFi')
```

---

### Container & Layout Components

#### **FBCard** (3 variants)
```
┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐
│  Elevated Card   │  │ Outlined Card    │  │  Flat Card       │
│   (shadow)       │  │   (border)       │  │  (minimal)       │
└──────────────────┘  └──────────────────┘  └──────────────────┘

Usage:
FBCard(child: widget)
FBCard.outlined(child: widget)
FBCard.flat(child: widget)
```

#### **FBBottomSheet** (3 variants)
```
┌────────────────────┐
│     Standard       │  Scrollable    Fullscreen
│   ─────────────    │  
│   Options          │  
└────────────────────┘

Usage:
FBBottomSheet.standard(context: context, child: widget)
FBBottomSheet.scrollable(context: context, child: widget)
FBBottomSheet.fullscreen(context: context, child: widget)
```

#### **FBAccordion** (2 variants)
```
► What is Flutter?      ▼ What is Flutter?
▼ What is Dart?         > What is Dart?
  Dart is a language    
> How to learn?         > How to learn?

Standard                Outlined

Usage:
FBAccordion(items: [...])
FBAccordion.outlined(items: [...])
```

#### **FBAvatar** (3 variants)
```
  ○JD       ┌JD┐     ┌──JD──┐
Circular   Square    Rounded

Usage:
FBAvatar.circular(initials: 'JD')
FBAvatar.square(initials: 'JD')
FBAvatar.rounded(initials: 'JD')
```

#### **FBBadge** (4 variants)
```
NEW    NEW    NEW     [New]
std   small  large   outlined

Usage:
FBBadge(label: 'NEW')
FBBadge.small(label: 'NEW')
FBBadge.large(label: 'NEW')
FBBadge.outlined(label: 'NEW')
```

---

### Navigation Components

#### **FBBottomNavigationBar** (2 variants)
```
🏠  🔍  ➕  👤     🏠  🔍  ➕  👤
Standard            Elevated

Usage:
FBBottomNavigationBar(items: [...])
FBBottomNavigationBar.elevated(items: [...])
```

#### **FBTabs** (2 variants)
```
│ Home │ Profile │ Settings │
├──────┴─────────┴──────────┤
│ Tab Content                │
│                            │
└────────────────────────────┘

Standard (fixed)      Scrollable

Usage:
FBTabs(tabs: [...])
FBTabs.scrollable(tabs: [...])
```

#### **FBBreadcrumb** (2 variants)
```
Home / Products / Electronics / Phones
Home → Products → Electronics → Phones

Standard              Arrow

Usage:
FBBreadcrumb(items: [...])
FBBreadcrumb.arrow(items: [...])
```

#### **FBSidebar** (3 variants)
```
┌──┐                 ┌──┐                 ┌──────────┐
│⌂ │ Dashboard       │⌐ │ Dashboard       │⌂ Home    │
│👥│ Users           │  │ Users           │👥 Users  │
│📦│ Products        │  │ Products        │📦 Prod.  │
└──┘                 └──┘                 └──────────┘

Standard            Collapsed             Dark

Usage:
FBSidebar(items: [...])
FBSidebar.collapsible(items: [...])
FBSidebar.dark(items: [...])
```

#### **FBAppBar**
```
◀ App Title                           ⋮

Usage:
FBAppBar(title: 'App Title')
```

---

### Data Display Components

#### **FBCircularProgress** (2 variants)
```
     ●               
   ◉   ◉      65%
    ◉ ◉    
                    
Standard            With Label

Usage:
FBCircularProgress(value: 0.65)
FBCircularProgress.withLabel(value: 0.65)
```

#### **FBLinearProgress** (3 variants)
```
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  Standard
Download ░░░░░░░░░░ 45%         With Label
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  Striped

Usage:
FBLinearProgress(value: 0.45)
FBLinearProgress.withLabel(value: 0.45, label: 'Download')
FBLinearProgress.striped(value: 0.45)
```

#### **FBPagination** (2 variants)
```
1 2 3 4 5 6 7       1 2 3
Standard            Minimal

Usage:
FBPagination(totalPages: 10)
FBPagination.minimal(totalPages: 20)
```

#### **FBCalendar** (2 variants)
```
March 2024              March 2024
Mo Tu We Th Fr Sa Su    Mo Tu We Th Fr Sa Su
             1  2       ... (calendar grid)
3  4  5  6  7  8  9     
...

Standard                Range

Usage:
FBCalendar(selectedDate: date)
FBCalendar.range(selectedDate: date)
```

---

### Feedback Components

#### **FBDialog** (3 methods)
```
┌─────────────────┐  ┌──────────────┐  ┌────────┐
│ Alert Dialog    │  │ Confirm?     │  │Custom  │
│ Message...      │  │ [No] [Yes]   │  │Dialog  │
│ [OK]            │  │              │  │        │
└─────────────────┘  └──────────────┘  └────────┘

Alert               Confirmation         Custom

Usage:
FBDialog.alert(context: context, ...)
FBDialog.confirmation(context: context, ...)
FBDialog.custom(context: context, ...)
```

#### **FBSnackbar**
```
─────────────────────────────
✓ Successfully saved!       ✕
─────────────────────────────

Usage:
FBSnackbar.show(context: context, message: 'Saved!')
```

#### **FBToast**
```
    ╭──────────────╮
    │  Welcome!    │
    ╰──────────────╯
    
Usage:
FBToast.show(context: context, message: 'Welcome!')
```

#### **FBTooltip** (2 variants)
```
┌──────────────────┐
│Helpful tooltip   │  Dark Tooltip
└──────────────────┘
     [Button]           [Icon]

Standard                Dark

Usage:
FBTooltip(message: 'Help text', child: widget)
FBTooltip.dark(message: 'Help text', child: widget)
```

---

## 📊 Component Summary

| Category | Count | Components |
|----------|-------|------------|
| Input | 8 | Button, Checkbox, TextField, Dropdown, DatePicker, RadioButton, Slider, Switch |
| Container | 4 | Card, BottomSheet, Accordion, Avatar |
| Display | 4 | Badge, CircularProgress, LinearProgress, Calendar |
| Navigation | 5 | AppBar, BottomNavigationBar, Tabs, Breadcrumb, Sidebar |
| Feedback | 4 | Dialog, Snackbar, Toast, Tooltip |
| **TOTAL** | **25+** | **60+ variants** |

---

## 🚀 Quick Start Code

```dart
// Import
import 'widgets/button.dart';
import 'widgets/textfield.dart';
import 'widgets/card.dart';

// Use
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My App')),
      body: Column(
        children: [
          FBCard(
            child: FBTextField.outline(
              labelText: 'Email',
            ),
          ),
          FBButton.solid(
            label: 'Submit',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
```

---

**All components are production-ready! 🎉**

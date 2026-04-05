# 🎨 Flutter Beautify
## Production-Grade UI Component CLI for Flutter

[![Pub Version](https://img.shields.io/pub/v/flutter_beautify.svg?color=blue&label=pub.dev)](https://pub.dev/packages/flutter_beautify)
[![Pub Likes](https://img.shields.io/pub/likes/flutter_beautify)](https://pub.dev/packages/flutter_beautify)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Dart SDK](https://img.shields.io/badge/Dart-3.9.2%2B-blue)](https://dart.dev)
[![Flutter](https://img.shields.io/badge/Flutter-Latest-02569B)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android%20%7C%20Web-lightgrey)](https://flutter.dev)

---

## 📖 [Full Documentation →](https://developerrejaul.github.io/flutter_beautify/)

**Explore 26+ production-ready components, comprehensive guides, and complete API reference on our GitHub Pages site.**

---

## ✨ What is Flutter Beautify?

Flutter Beautify is a **command-line interface tool** that dramatically accelerates Flutter development by providing:

- **26 Production-Ready UI Components** - Professionally designed widgets following Material Design 3
- **60+ Factory Method Variants** - 3-4 customizable versions of each component
- **Zero Dependencies** - Uses only Flutter's built-in Material widgets
- **Material Design 3 Compliant** - Always aligned with latest design standards
- **Rapid Code Generation** - Scaffold components in seconds via CLI
- **100% Customizable** - Full control over colors, sizes, and behavior
- **Comprehensive Examples** - Real-world usage patterns and demos
- **Production-Ready Code** - Enterprise-grade quality, no compromises

---

## 🚀 Quick Start (30 Seconds)

### 1. Install Globally

```bash
dart pub global activate flutter_beautify
```

### 2. Initialize Your Project

```bash
cd your_flutter_project
flutter_beautify init
```

### 3. Add Your First Component

```bash
flutter_beautify add button
```

### 4. Use in Your Code

```dart
import 'package:your_app/widgets/button.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FBButton.solid(
          label: 'Click Me',
          onPressed: () => print('Tapped!'),
        ),
      ),
    );
  }
}
```

---

## 📦 Available Components

### 📝 Form Components (5)
Input fields, checkboxes, radio buttons, switches, and sliders for user data collection.

```dart
FBTextField.outlined(label: 'Email', hint: 'Enter email')
FBCheckbox.withLabel(label: 'I agree')
FBRadioButton.withLabel(label: 'Option 1')
FBSwitch.withLabel(label: 'Dark Mode')
FBSlider.labeled(value: 50, min: 0, max: 100)
```

### 🎯 Button Components (4)
Multiple button styles, icon buttons, FABs, and toggle buttons.

```dart
FBButton.solid(label: 'Save', onPressed: save)
FBButton.outlined(label: 'Cancel', onPressed: cancel)
FBIconButton.filled(icon: Icons.delete, onPressed: delete)
FBFAB.extended(icon: Icons.add, label: 'New')
```

### 🎨 Layout Components (5)
Cards, bottom sheets, sidebars, breadcrumbs, and accordions.

```dart
FBCard.elevated(child: content)
FBBottomSheet.modal(title: 'Options', child: menu)
FBSidebar.collapsible(items: navItems)
FBBreadcrumb.clickable(items: paths)
FBAccordion.basic(items: sections)
```

### 🧭 Navigation Components (5)
AppBars, bottom navigation, tabs, pagination, and avatars.

```dart
FBAppBar.withActions(title: 'My App', actions: buttons)
FBBottomNavigationBar.labeled(items: navItems)
FBTabs.basic(tabs: tabList)
FBPagination.basic(currentPage: 1, totalPages: 10)
FBAvatar.image(imageUrl: 'https://...')
```

### ⏳ Progress & Loading (4)
Progress bars, loaders, spinners, and toast notifications.

```dart
FBLinearProgress.animated(value: 0.65)
FBCircularProgress.labeled(value: 0.75, label: '75%')
FBCircularLoader.dots(size: 48)
FBToast.success(message: 'Saved!')
```

### 💬 Feedback & Status (3)
Dialogs, snackbars, badges, and tooltips.

```dart
FBDialog.confirm(title: 'Delete?', onConfirm: delete)
FBSnackbar.action(message: 'Undo', onAction: undo)
FBBadge.number(count: 5)
FBTooltip.basic(message: 'Save your work')
```

**[→ View All Components](https://developerrejaul.github.io/flutter_beautify/doc/components/)**

---

## ⚡ Why Choose Flutter Beautify?

### Traditional Approach ❌

```dart
// Repetitive boilerplate for every button
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 4,
  ),
  onPressed: () => handleClick(),
  child: Text('Click Me'),
)

// Same for hundreds of other components...
```

### Flutter Beautify Approach ✅

```dart
// Clean, consistent, production-ready
FBButton.solid(
  label: 'Click Me',
  onPressed: () => handleClick(),
)
```

**That's it.** No styling boilerplate. No Material Design compliance worries. Just use it.

---

## 📊 Comparison

| Feature | Flutter Beautify | Manual Approach |
|---------|------------------|-----------------|
| Setup Time | < 5 minutes | Hours/Days |
| Code Per Component | 1-2 lines | 10-20 lines |
| Design Consistency | ✅ Guaranteed | ❌ Manual maintenance |
| Material Design 3 | ✅ Built-in | ❌ Manual updates |
| Customization | ✅ 60+ variants | ⚠️ Custom code required |
| Production Ready | ✅ Yes | ⚠️ Depends on implementation |
| Learning Curve | ⬇️ Minimal | ⬆️ Steep |

---

## 🛠️ CLI Commands

```bash
# Display help
flutter_beautify help

# Initialize project
flutter_beautify init

# Add a component
flutter_beautify add button
flutter_beautify add textfield
flutter_beautify add card

# List all available components
flutter_beautify list

# Show component details
flutter_beautify info button
```

**[→ Full CLI Reference](https://developerrejaul.github.io/flutter_beautify/doc/cli-commands-reference/)**

---

## 📚 Documentation

- **[Installation Guide](https://developerrejaul.github.io/flutter_beautify/doc/installation/)** - Setup instructions
- **[Quick Start](https://developerrejaul.github.io/flutter_beautify/doc/quick-start-guide/)** - Get running in 5 minutes
- **[Component Catalog](https://developerrejaul.github.io/flutter_beautify/doc/components/)** - All 26 components with examples
- **[API Reference](https://developerrejaul.github.io/flutter_beautify/doc/api-reference/)** - Detailed method documentation
- **[Examples & Demos](https://developerrejaul.github.io/flutter_beautify/doc/examples-demos/)** - Real-world usage patterns
- **[Troubleshooting](https://developerrejaul.github.io/flutter_beautify/doc/troubleshooting/)** - Common issues and solutions

---

## 💻 Requirements

- **Dart SDK**: 3.9.2 or higher
- **Flutter SDK**: Latest stable version
- **Platforms**: macOS, Linux, Windows
- **Minimum Flutter Version**: 3.0

---

## 📦 Installation Methods

### Method 1: From pub.dev (Recommended)

```bash
dart pub global activate flutter_beautify
```

Verify installation:

```bash
flutter_beautify --version
```

### Method 2: Build from Source

```bash
git clone https://github.com/DeveloperRejaul/flutter_beautify.git
cd flutter_beautify
dart pub global activate --source path .
```

### Uninstall

```bash
dart pub global deactivate flutter_beautify
```

---

## 🎯 Use Cases

✅ **Startup MVPs** - Launch quickly with production-ready components  
✅ **Enterprise Apps** - Material Design 3 compliance built-in  
✅ **Design Systems** - Use as component library foundation  
✅ **Mobile & Web** - Works on iOS, Android, and web  
✅ **Prototyping** - Rapid UI prototyping and iteration  

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- Bug reports and feature requests
- Development setup
- Pull request guidelines
- Code style standards

---

## 📄 License

Flutter Beautify is released under the **MIT License**. See [LICENSE](LICENSE) file for details.

---

## 🔗 Links

- **[pub.dev Package](https://pub.dev/packages/flutter_beautify)** - Latest version and documentation
- **[GitHub Repository](https://github.com/DeveloperRejaul/flutter_beautify)** - Source code
- **[GitHub Pages Documentation](https://developerrejaul.github.io/flutter_beautify/)** - Full docs site
- **[Report an Issue](https://github.com/DeveloperRejaul/flutter_beautify/issues)** - Bug reports
- **[Discussions](https://github.com/DeveloperRejaul/flutter_beautify/discussions)** - Community Q&A

---

## ⭐ Show Your Support

If Flutter Beautify helps your project, please consider:
- ⭐ Starring this repository
- 👍 Liking on pub.dev
- 📢 Sharing with other developers
- 🐛 Contributing improvements

---

## 📮 Get in Touch

- **Issues**: [GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)
- **Discussions**: [GitHub Discussions](https://github.com/DeveloperRejaul/flutter_beautify/discussions)
- **Twitter**: [@DeveloperRejaul](https://twitter.com/DeveloperRejaul)

---

**Built with ❤️ for the Flutter community**

**[→ Start Building →](https://developerrejaul.github.io/flutter_beautify/doc/installation/)**
        ),
      ),
    );
  }
}
```
---

## CLI Commands Reference

### 1. `flutter_beautify init`

Initialize Flutter Beautify configuration for your project.

**Syntax:**
```bash
flutter_beautify init
```

**Use Cases:**
- ✅ First-time setup
- ✅ Custom project structure
- ✅ Team standardization

---

### 2. `flutter_beautify config`

Display the current Flutter Beautify configuration.

**Syntax:**
```bash
flutter_beautify config
```

**Description:**
Reads and displays the current configuration from `.flutter_beautify_config.json`. If file doesn't exist, shows default values.

**Use Cases:**
- ✅ Verify configuration settings
- ✅ Check project structure
- ✅ Team alignment

---

### 3. `flutter_beautify add <component>`

Add a component to your project.

**Syntax:**
```bash
flutter_beautify add <component_name>
```

**Parameters:**

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| `<component_name>` | ✅ Yes | string | Name of the component to add |

**Example Usage:**

```bash
# Add a single component
flutter_beautify add button

# Add multiple components sequentially
flutter_beautify add checkbox
flutter_beautify add textfield
flutter_beautify add card
```

**Supported Component Commands:**

```bash
# Input Components
flutter_beautify add button          # Action button
flutter_beautify add checkbox        # Checkbox input
flutter_beautify add textfield       # Text input field
flutter_beautify add radio-button    # Radio button group
flutter_beautify add slider          # Slider control
flutter_beautify add switch          # Toggle switch
flutter_beautify add dropdown        # Dropdown select

# Display Components
flutter_beautify add card            # Card container
flutter_beautify add badge           # Status badge
flutter_beautify add avatar          # User avatar
flutter_beautify add tooltip         # Tooltip overlay
flutter_beautify add breadcrumb      # Breadcrumb trail
flutter_beautify add appbar          # Custom app bar
flutter_beautify add divider         # Visual divider

# Progress & Status
flutter_beautify add circular-progress    # Circular progress
flutter_beautify add linear-progress      # Progress bar
flutter_beautify add skeleton             # Loading skeleton

# Navigation
flutter_beautify add tabs                      # Tab navigation
flutter_beautify add pagination               # Page navigation
flutter_beautify add bottom-navigation-bar    # Bottom nav
flutter_beautify add sidebar                  # Side navigation

# Modals & Overlays
flutter_beautify add dialog             # Dialog modal
flutter_beautify add bottom-sheet       # Bottom sheet
flutter_beautify add snackbar           # Snackbar notification
flutter_beautify add toast              # Toast notification

# Date & Time
flutter_beautify add date-picker    # Date picker
flutter_beautify add calendar       # Calendar widget

# Special
flutter_beautify add accordion      # Accordion component
```

---

## Component Catalog

### Overview

Flutter Beautify provides **26 production-ready components** organized into 7 categories.

### Complete Component List

#### **Input Components** (7 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Button** | `add button` | `.solid()` `.outline()` `.link()` | Action buttons with multiple styles |
| **Checkbox** | `add checkbox` | `.standard()` `.outlined()` | Checkbox input with validation |
| **TextField** | `add textfield` | `.outline()` `.filled()` `.underline()` | Text input with variants |
| **RadioButton** | `add radio-button` | `.standard()` `.card()` | Radio button groups |
| **Slider** | `add slider` | `.standard()` `.range()` | Range slider input |
| **Switch** | `add switch` | `.standard()` `.outlined()` | Toggle switch control |
| **Dropdown** | `add dropdown` | `.standard()` `.outlined()` | Dropdown menu select |

#### **Display Components** (7 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Card** | `add card` | `.elevated()` `.outlined()` `.flat()` | Container with styling |
| **Badge** | `add badge` | `.standard()` `.small()` `.large()` `.outlined()` | Status/label badges |
| **Avatar** | `add avatar` | `.circular()` `.square()` `.rounded()` | User profile avatars |
| **Tooltip** | `add tooltip` | `.standard()` `.dark()` | Hover information overlay |
| **Breadcrumb** | `add breadcrumb` | `.standard()` `.arrow()` | Navigation breadcrumb trail |
| **AppBar** | `add appbar` | `.standard()` `.transparent()` `.gradient()` | Custom app bar |
| **Divider** | `add divider` | `.horizontal()` `.vertical()` | Visual dividers |

#### **Progress & Status** (3 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **CircularProgress** | `add circular-progress` | `.standard()` `.withLabel()` `.spinner()` | Circular progress indicator |
| **LinearProgress** | `add linear-progress` | `.standard()` `.withLabel()` `.striped()` | Horizontal progress bar |
| **Skeleton** | `add skeleton` | `.text()` `.image()` `.card()` | Loading skeleton screens |

#### **Navigation Components** (4 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Tabs** | `add tabs` | `.standard()` `.scrollable()` | Tab navigation |
| **Pagination** | `add pagination` | `.standard()` `.minimal()` | Page navigation |
| **BottomNavigationBar** | `add bottom-navigation-bar` | `.standard()` `.elevated()` | Bottom navigation |
| **Sidebar** | `add sidebar` | `.standard()` `.dark()` `.collapsible()` | Side navigation panel |

#### **Modal & Overlay** (4 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Dialog** | `add dialog` | `.alert()` `.confirmation()` `.custom()` | Modal dialogs |
| **BottomSheet** | `add bottom-sheet` | `.standard()` `.scrollable()` `.fullscreen()` | Bottom sheet modals |
| **Snackbar** | `add snackbar` | `.info()` `.success()` `.error()` `.warning()` | Snackbar notifications |
| **Toast** | `add toast` | `.short()` `.long()` `.custom()` | Toast notifications |

#### **Date & Time** (2 widgets)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **DatePicker** | `add date-picker` | `.standard()` `.range()` | Date selection picker |
| **Calendar** | `add calendar` | `.standard()` `.range()` | Interactive calendar widget |

#### **Special Components** (1 widget)

| Component | Command | Factory Methods | Description |
|-----------|---------|-----------------|-------------|
| **Accordion** | `add accordion` | `.standard()` `.outlined()` | Expandable accordion items |

---

## 📞 Support

- **📖 Documentation**: [GitHub Wiki](https://github.com/DeveloperRejaul/flutter_beautify/wiki)
- **🐛 Issues**: [GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)
- **💬 Discussions**: [GitHub Discussions](https://github.com/DeveloperRejaul/flutter_beautify/discussions)
- **📧 Email**: [Contact Developer](mailto:rejaul.pro@gmail.com)

---

## 🙌 Acknowledgments

- Built with ❤️ using [Dart](https://dart.dev) and [Flutter](https://flutter.dev)
- Inspired by [Material Design 3](https://m3.material.io/)
- Thanks to the Flutter community for feedback and contributions

---

## 🔗 Quick Links

### 📚 Documentation
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute to the project
- **[CONTACT.md](CONTACT.md)** - Contact information and support channels
- **[PUB_DEV_SETUP.md](PUB_DEV_SETUP.md)** - Pub.dev publishing guide
- **[GITHUB_ACTIONS_SETUP.md](GITHUB_ACTIONS_SETUP.md)** - GitHub Actions automation
- **[CHANGELOG.md](CHANGELOG.md)** - Version history and updates

### 🤝 Community
- **[GitHub Issues](https://github.com/DeveloperRejaul/flutter_beautify/issues)** - Report bugs or request features
- **[GitHub Discussions](https://github.com/DeveloperRejaul/flutter_beautify/discussions)** - Ask questions and discuss ideas
- **[GitHub Repository](https://github.com/DeveloperRejaul/flutter_beautify)** - View source code

### 📞 Get Help
- **[CONTACT.md](CONTACT.md)** - For support and contact information
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Development setup and guidelines
- **README.md** - Main documentation (you are here!)

---

## 📊 Statistics

- **26** Production-Ready Components
- **60+** Factory Method Variants
- **20+** Demo Examples
- **100%** Dart Code Coverage (widgets)
- **Active** Maintenance & Support

---

**Made with ❤️ by [DeveloperRejaul](https://github.com/DeveloperRejaul)**

**⭐ If you find this useful, please consider giving it a star on GitHub!**


---
layout: default
title: CLI Commands Reference
nav_order: 5
---

# CLI Commands Reference

Complete reference guide for Flutter Beautify CLI commands.

## Available Commands

### flutter_beautify help

Display help information for Flutter Beautify.

```bash
flutter_beautify help
```

**Output:**
Shows all available commands with descriptions.

### flutter_beautify help [command]

Display help for a specific command.

```bash
flutter_beautify help add
flutter_beautify help init
```

---

## flutter_beautify init

Initialize Flutter Beautify in your project.

```bash
flutter_beautify init
```

**What it does:**
- Creates configuration file (`.flutter_beautify.yaml`)
- Sets up widget storage paths
- Initializes project structure

**Prompts:**
```
Enter widgets path [lib/widgets]: 
Enter utils path [lib/utils]: 
Enter demo path [lib/demo]:
```

**Configuration file** (`.flutter_beautify.yaml`):
```yaml
widgets_path: lib/widgets
utils_path: lib/utils
demo_path: lib/demo
```

**Use cases:**
- ✅ First-time setup in a new project
- ✅ Reset configuration
- ✅ Change storage paths

---

## flutter_beautify add [component]

Add a component to your project.

```bash
flutter_beautify add button
flutter_beautify add card
flutter_beautify add textfield
```

**What it does:**
- Creates component file in `widgets_path`
- Adds factory methods for common variants
- Includes documentation and examples

**Supported Components (26 total):**

#### Form Components
- `textfield` - Text input field with variants
- `checkbox` - Checkbox with states
- `radio` - Radio button with variants
- `toggle` - Toggle switch component
- `dropdown` - Dropdown select component

#### Display Components
- `card` - Card container component
- `badge` - Badge/tag component
- `avatar` - User avatar component
- `tooltip` - Tooltip hover component
- `divider` - Visual separator

#### Button Components
- `button` - Primary button variants
- `icon-button` - Icon-only button
- `floating-button` - FAB component
- `chip` - Clickable chip component

#### Layout Components
- `sidebar` - Sidebar navigation
- `tabs` - Tab navigation
- `pagination` - Page navigation
- `accordion` - Collapsible sections
- `modal` - Modal dialog

#### Progress & Loading
- `circular-progress` - Circular progress indicator
- `linear-progress` - Linear progress bar
- `skeleton` - Loading skeleton
- `spinner` - Loading spinner animation

#### Status & Feedback
- `appbar` - App bar header
- `dialog` - Dialog box
- `snackbar` - Bottom notification

**Example:**
```bash
flutter_beautify add button
```

Creates `lib/widgets/button.dart` with:
- Factory method: `FBButton.solid()`
- Factory method: `FBButton.outline()`
- Factory method: `FBButton.ghost()`
- Factory method: `FBButton.loading()`
- Full documentation

**Use cases:**
- ✅ Adding new component to project
- ✅ Rebuilding accidentally deleted components
- ✅ Adding to new project areas

---

## flutter_beautify config

Display current configuration.

```bash
flutter_beautify config
```

**Output:**
```
Flutter Beautify Configuration:
  Widgets path: lib/widgets
  Utils path: lib/utils
  Demo path: lib/demo
  Version: 1.0.4
```

**Use cases:**
- ✅ Verify current settings
- ✅ Check project configuration
- ✅ Troubleshoot path issues

---

## flutter_beautify version

Display Flutter Beautify version.

```bash
flutter_beautify version
```

**Output:**
```
Flutter Beautify version 1.0.4
```

**Use cases:**
- ✅ Check installed version
- ✅ Verify compatibility
- ✅ Report version in issues

---

## Command Reference Table

| Command | Purpose | Example |
|---------|---------|---------|
| `init` | Initialize project | `flutter_beautify init` |
| `add` | Add component | `flutter_beautify add button` |
| `config` | Show configuration | `flutter_beautify config` |
| `version` | Show version | `flutter_beautify version` |
| `help` | Show help | `flutter_beautify help` |

---

## Tips & Best Practices

### Add Multiple Components

```bash
flutter_beautify add button
flutter_beautify add card
flutter_beautify add textfield
flutter_beautify add dialog
```

### Organize by Feature

You can modify paths per feature:

```bash
# Default
flutter_beautify init

# Then create feature-specific folders
mkdir -p lib/features/auth/widgets
mkdir -p lib/features/home/widgets
```

### Import Components

```dart
// Import from widgets folder
import 'package:my_app/widgets/button.dart';
import 'package:my_app/widgets/card.dart';

// Use factory methods
FBButton.solid(label: 'Submit', onPressed: () {})
FBCard.elevated(child: Text('Content'))
```

### Update Configuration

1. Edit `.flutter_beautify.yaml`:
```yaml
widgets_path: lib/ui/widgets
utils_path: lib/ui/utils
demo_path: lib/ui/demo
```

2. Or reinitialize:
```bash
flutter_beautify init
```

---

## Troubleshooting

### Configuration file not found

**Problem:** "Could not find .flutter_beautify.yaml"

**Solution:**
```bash
flutter_beautify init
```

### Component already exists

**Problem:** "Component already exists at path"

**Solution:**
- Delete existing component file, or
- Manually edit the existing file

### Permission denied

**Problem:** "Permission denied" when adding components

**Solution:**
```bash
# Ensure correct permissions
chmod +x $(which flutter_beautify)

# Or use sudo
sudo flutter_beautify add button
```

### Path not found

**Problem:** "Path does not exist"

**Solution:**
```bash
# Create directories first
mkdir -p lib/widgets
mkdir -p lib/utils

# Then initialize
flutter_beautify init
```

---

## Advanced Usage

### Environment Variables

Coming soon: Support for environment configuration

### Custom Paths

Edit `.flutter_beautify.yaml` manually:

```yaml
widgets_path: my_custom_widgets_path
utils_path: my_custom_utils_path
demo_path: my_custom_demo_path
```

### Batch Component Addition

Create a script to add multiple components:

```bash
#!/bin/bash
# add_components.sh

components=(
  "button"
  "card"
  "textfield"
  "checkbox"
  "dialog"
)

for component in "${components[@]}"; do
  flutter_beautify add "$component"
done
```

Run:
```bash
bash add_components.sh
```

---

## Next Steps

- 🚀 [Quick Start](./quick-start.html) - Get started guide
- 📚 [Components](./widgets/index.html) - See all components
- 📖 [Examples](./examples.html) - Real-world examples

---

[← Quick Start](./quick-start.html) | [Components →](./widgets/index.html)

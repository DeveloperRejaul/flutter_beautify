---
layout: default
title: Installation
nav_order: 2
parent: Documentation
permalink: /doc/installation
---

# Installation Guide

## Prerequisites

- **Dart SDK**: 3.9.2 or higher
- **Flutter SDK**: Latest stable version (for component usage)
- **macOS/Linux/Windows**: Supported on all platforms

## Installation Methods

### Method 1: From pub.dev (Recommended)

Install globally from pub.dev:

```bash
dart pub global activate flutter_beautify
```

Verify installation:

```bash
flutter_beautify --version
```

### Method 2: Build from Source

Clone and build from GitHub:

```bash
git clone https://github.com/DeveloperRejaul/flutter_beautify.git
cd flutter_beautify
dart pub global activate --source path .
```

### Method 3: Add as Dev Dependency

Add to your `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_beautify: ^1.0.0
```

Then activate:

```bash
dart pub global activate flutter_beautify
```

## Verify Installation

Check if Flutter Beautify is installed:

```bash
flutter_beautify --version
```

Get help:

```bash
flutter_beautify help
```

## Uninstall

Remove Flutter Beautify:

```bash
dart pub global deactivate flutter_beautify
```

## Troubleshooting

### Command not found

Make sure Dart's pub cache bin directory is in your PATH:

```bash
# Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

### Version mismatch

Update to the latest version:

```bash
dart pub global activate flutter_beautify --overwrite
```

### Permission denied

Try with sudo:

```bash
sudo dart pub global activate flutter_beautify
```

---

[← Back to Home](/) | [Next: Quick Start →](./quick-start.md)

---
layout: default
title: Examples
nav_order: 6
parent: Documentation
permalink: /docs/examples
---

# Real-World Examples

Practical examples showing how to use Flutter Beautify components.

## Table of Contents

- [Login Screen](#login-screen)
- [Form Screen](#form-screen)
- [Dashboard](#dashboard)
- [Product Listing](#product-listing)
- [Settings Screen](#settings-screen)

---

## Login Screen

Complete login screen with Flutter Beautify components.

```dart
import 'package:flutter/material.dart';
import 'package:my_app/widgets/textfield.dart';
import 'package:my_app/widgets/button.dart';
import 'package:my_app/widgets/divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  void handleLogin() {
    setState(() => isLoading = true);
    
    // Simulate API call
    Future.delayed(Duration(seconds: 2), () {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              Text(
                'Sign in to your account',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 32),
              FBTextField.outlined(
                label: 'Email',
                hintText: 'your@email.com',
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 16),
              FBTextField.password(
                label: 'Password',
                hintText: 'Enter your password',
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?'),
                ),
              ),
              SizedBox(height: 24),
              FBButton.solid(
                label: isLoading ? 'Signing in...' : 'Sign In',
                onPressed: isLoading ? null : handleLogin,
              ),
              SizedBox(height: 24),
              FBDivider.text(label: 'OR'),
              SizedBox(height: 24),
              FBButton.outline(
                label: 'Sign in with Google',
                onPressed: () {},
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## Form Screen

Multi-step form with validation.

```dart
import 'package:flutter/material.dart';
import 'package:my_app/widgets/textfield.dart';
import 'package:my_app/widgets/checkbox.dart';
import 'package:my_app/widgets/radio.dart';
import 'package:my_app/widgets/dropdown.dart';
import 'package:my_app/widgets/button.dart';
import 'package:my_app/widgets/card.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  int currentStep = 0;
  String fullName = '';
  String email = '';
  String country = '';
  String category = '';
  bool agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currentStep == 0) ...[
              Text('Step 1: Personal Information'),
              SizedBox(height: 24),
              FBTextField.outlined(
                label: 'Full Name',
                hintText: 'Enter your full name',
                onChanged: (value) => fullName = value,
              ),
              SizedBox(height: 16),
              FBTextField.email(
                label: 'Email',
                hintText: 'your@email.com',
                onChanged: (value) => email = value,
              ),
              SizedBox(height: 16),
              FBTextField.phone(
                label: 'Phone',
                hintText: '+1 (555) 000-0000',
              ),
            ] else if (currentStep == 1) ...[
              Text('Step 2: Location & Category'),
              SizedBox(height: 24),
              FBDropdown.basic(
                label: 'Country',
                items: ['USA', 'UK', 'Canada', 'Australia'],
                onChanged: (value) => country = value,
              ),
              SizedBox(height: 16),
              FBDropdown.basic(
                label: 'Category',
                items: ['Business', 'Personal', 'Education'],
                onChanged: (value) => category = value,
              ),
            ] else if (currentStep == 2) ...[
              Text('Step 3: Preferences'),
              SizedBox(height: 24),
              Text('Select your preferences:'),
              SizedBox(height: 16),
              FBCheckbox.basic(
                value: true,
                label: 'Subscribe to newsletter',
              ),
              SizedBox(height: 12),
              FBCheckbox.basic(
                value: false,
                label: 'Receive promotional offers',
              ),
              SizedBox(height: 12),
              FBCheckbox.basic(
                value: false,
                label: 'Enable notifications',
              ),
              SizedBox(height: 24),
              Text('Choose your plan:'),
              SizedBox(height: 16),
              FBRadio.horizontal(
                options: ['Free', 'Pro', 'Enterprise'],
              ),
            ] else if (currentStep == 3) ...[
              Text('Step 4: Review & Confirm'),
              SizedBox(height: 24),
              FBCard.outlined(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ReviewItem('Name', fullName),
                      _ReviewItem('Email', email),
                      _ReviewItem('Country', country),
                      _ReviewItem('Category', category),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              FBCheckbox.basic(
                value: agreeTerms,
                onChanged: (value) {
                  setState(() => agreeTerms = value ?? false);
                },
                label: 'I agree to the Terms and Conditions',
              ),
            ],
            SizedBox(height: 32),
            Row(
              children: [
                if (currentStep > 0)
                  Expanded(
                    child: FBButton.outline(
                      label: 'Previous',
                      onPressed: () {
                        setState(() => currentStep--);
                      },
                    ),
                  ),
                if (currentStep > 0) SizedBox(width: 16),
                Expanded(
                  child: FBButton.solid(
                    label: currentStep == 3 ? 'Submit' : 'Next',
                    onPressed: () {
                      if (currentStep < 3) {
                        setState(() => currentStep++);
                      } else {
                        // Handle submission
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final String label;
  final String value;

  const _ReviewItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
```

---

## Dashboard

Dashboard layout with cards and progress indicators.

```dart
import 'package:flutter/material.dart';
import 'package:my_app/widgets/card.dart';
import 'package:my_app/widgets/circular_progress.dart';
import 'package:my_app/widgets/linear_progress.dart';
import 'package:my_app/widgets/avatar.dart';
import 'package:my_app/widgets/badge.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          FBAvatar.initials(
            initials: 'JD',
            backgroundColor: Colors.blue,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, John!'),
            SizedBox(height: 24),
            // Stats Row
            Row(
              children: [
                Expanded(
                  child: FBCard.elevated(
                    child: Column(
                      children: [
                        Text('Total Users', style: TextStyle(fontSize: 12)),
                        SizedBox(height: 8),
                        Text('1,234', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: FBCard.elevated(
                    child: Column(
                      children: [
                        Text('Revenue', style: TextStyle(fontSize: 12)),
                        SizedBox(height: 8),
                        Text('\$12.5K', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Progress Indicators
            FBCard.outlined(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Monthly Sales Goal'),
                        FBBadge.filled(label: '70%'),
                      ],
                    ),
                    SizedBox(height: 12),
                    FBLinearProgress.determinate(value: 0.7),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Performance Section
            Text('Performance Metrics'),
            SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _MetricCard('Conversion', 45.2, 0.452),
                _MetricCard('Retention', 78.5, 0.785),
                _MetricCard('Growth', 23.1, 0.231),
                _MetricCard('Engagement', 89.4, 0.894),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final double value;
  final double progress;

  const _MetricCard(this.label, this.value, this.progress);

  @override
  Widget build(BuildContext context) {
    return FBCard.elevated(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                FBCircularProgress.determinate(value: progress, size: 80),
                Text('${value.toStringAsFixed(1)}%'),
              ],
            ),
          ),
          SizedBox(height: 12),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
```

---

## Product Listing

Product list with cards and navigation.

```dart
import 'package:flutter/material.dart';
import 'package:my_app/widgets/card.dart';
import 'package:my_app/widgets/badge.dart';
import 'package:my_app/widgets/rating.dart';
import 'package:my_app/widgets/button.dart';

class ProductListingScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Premium Headphones',
      price: 199.99,
      rating: 4.5,
      reviews: 245,
      isNew: true,
    ),
    Product(
      id: 2,
      name: 'Wireless Charger',
      price: 49.99,
      rating: 4.2,
      reviews: 128,
      isNew: false,
    ),
    Product(
      id: 3,
      name: 'USB-C Cable',
      price: 19.99,
      rating: 4.8,
      reviews: 512,
      isNew: false,
    ),
  ];

  ProductListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _ProductCard(product: product);
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return FBCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                color: Colors.grey[300],
                child: Center(
                  child: Icon(Icons.image, size: 48),
                ),
              ),
              if (product.isNew)
                Positioned(
                  top: 8,
                  right: 8,
                  child: FBBadge.filled(
                    label: 'NEW',
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    SizedBox(width: 4),
                    Text('${product.rating} (${product.reviews})'),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FBButton.solid(
                      label: 'Add to Cart',
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final double rating;
  final int reviews;
  final bool isNew;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.isNew,
  });
}
```

---

## Settings Screen

Settings screen with toggles and options.

```dart
import 'package:flutter/material.dart';
import 'package:my_app/widgets/card.dart';
import 'package:my_app/widgets/toggle.dart';
import 'package:my_app/widgets/radio.dart';
import 'package:my_app/widgets/button.dart';
import 'package:my_app/widgets/divider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool darkMode = false;
  String theme = 'system';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          _SettingsSection(
            title: 'Display',
            children: [
              _SettingsTile(
                title: 'Dark Mode',
                trailing: FBToggle.basic(
                  value: darkMode,
                  onChanged: (value) {
                    setState(() => darkMode = value);
                  },
                ),
              ),
              _SettingsTile(
                title: 'Theme',
                subtitle: 'Choose your preferred theme',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    FBRadio.vertical(
                      options: ['Light', 'Dark', 'System'],
                      groupValue: theme,
                      onChanged: (value) {
                        setState(() => theme = value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          _SettingsSection(
            title: 'Notifications',
            children: [
              _SettingsTile(
                title: 'Enable Notifications',
                trailing: FBToggle.basic(
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() => notificationsEnabled = value);
                  },
                ),
              ),
              if (notificationsEnabled) ...[
                _SettingsTile(
                  title: 'Email Notifications',
                  subtitle: 'Receive updates via email',
                ),
                _SettingsTile(
                  title: 'Push Notifications',
                  subtitle: 'Receive push alerts',
                ),
              ],
            ],
          ),
          _SettingsSection(
            title: 'Account',
            children: [
              _SettingsTile(
                title: 'Change Password',
                onTap: () {},
              ),
              _SettingsTile(
                title: 'Privacy Policy',
                onTap: () {},
              ),
              _SettingsTile(
                title: 'Terms of Service',
                onTap: () {},
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: FBButton.outline(
              label: 'Logout',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        ...children,
        FBDivider.horizontal(),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
```

---

## Tips

- **Combine Components**: Mix and match components for custom UIs
- **Responsive Design**: Use `MediaQuery` for responsive layouts
- **State Management**: Use `setState` for simple state, or Provider/Bloc for complex apps
- **Theming**: Apply Flutter theme customization across all components
- **Error Handling**: Always handle async operations with try-catch

---

## Next Steps

- 💡 [Components](./components.md) - Detailed component documentation
- 🔧 [CLI Commands](./cli-commands.md) - Command reference

---

[← Components](./components.md) | [Back to Docs](/)

---
layout: default
title: Form Components Guide
nav_order: 7
parent: Documentation
description: "Complete guide to all form input components"
---

# Form Components Guide

Master all 5 form input components with real-world examples.

## Table of Contents

1. [TextField](#textfield) - Text input fields
2. [Checkbox](#checkbox) - Boolean input
3. [Radio](#radio) - Single selection
4. [Toggle](#toggle) - Switch input
5. [Dropdown](#dropdown) - List selection

---

## TextField

The most versatile form component with 8 variants for different input types.

### All Variants

```dart
import 'package:flutter/material.dart';
import 'package:my_app/widgets/textfield.dart';

// 1. Basic text field
FBTextField.basic(
  label: 'Username',
  hintText: 'Enter username',
)

// 2. Outlined style
FBTextField.outlined(
  label: 'Full Name',
  hintText: 'John Doe',
  prefixIcon: Icons.person,
)

// 3. Filled background
FBTextField.filled(
  label: 'Description',
  hintText: 'Enter details',
  maxLines: 3,
)

// 4. Password field with visibility toggle
FBTextField.password(
  label: 'Password',
  hintText: 'Enter password',
  obscureText: true,
)

// 5. Search field
FBTextField.search(
  label: 'Search',
  hintText: 'Type to search...',
  prefixIcon: Icons.search,
)

// 6. Email validation
FBTextField.email(
  label: 'Email Address',
  hintText: 'user@example.com',
  keyboardType: TextInputType.emailAddress,
)

// 7. Phone number
FBTextField.phone(
  label: 'Phone',
  hintText: '+1 (555) 000-0000',
  keyboardType: TextInputType.phone,
)

// 8. Numeric input
FBTextField.number(
  label: 'Amount',
  hintText: '0.00',
  keyboardType: TextInputType.number,
)
```

### Real-World Example: Login Form

```dart
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isLoading = false;

  void handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => isLoading = true);
      
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));
      
      setState(() => isLoading = false);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Sign in to continue'),
                SizedBox(height: 32),

                // Email field
                FBTextField.email(
                  label: 'Email',
                  hintText: 'your@email.com',
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Email required';
                    if (!value!.contains('@')) return 'Invalid email';
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Password field
                FBTextField.password(
                  label: 'Password',
                  hintText: 'Enter password',
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Password required';
                    if (value!.length < 6) return 'Min 6 characters';
                    return null;
                  },
                ),
                SizedBox(height: 12),

                // Forgot password link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?'),
                  ),
                ),
                SizedBox(height: 24),

                // Login button
                SizedBox(
                  width: double.infinity,
                  child: FBButton.solid(
                    label: isLoading ? 'Signing in...' : 'Sign In',
                    onPressed: isLoading ? null : handleLogin,
                  ),
                ),
                SizedBox(height: 16),

                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account? "),
                    TextButton(
                      onPressed: () {},
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### Advanced Features

```dart
// With error messages
FBTextField.email(
  label: 'Email',
  errorText: 'Invalid email format',
)

// With counter
FBTextField.basic(
  label: 'Bio',
  maxLength: 160,
  buildCounter: (context,
      {required currentLength, required isFocused, maxLength}) {
    return Text('$currentLength/$maxLength');
  },
)

// With custom prefix/suffix
FBTextField.filled(
  label: 'Amount',
  prefixText: '\$ ',
  suffixIcon: Icons.attach_money,
)

// Disabled state
FBTextField.outlined(
  label: 'Disabled Field',
  enabled: false,
)
```

---

## Checkbox

Binary choice component for single or multiple selections.

### All Variants

```dart
import 'package:my_app/widgets/checkbox.dart';

// 1. Basic checkbox
FBCheckbox.basic(
  value: true,
  onChanged: (value) {},
  label: 'Accept terms',
)

// 2. Outlined style
FBCheckbox.outlined(
  value: false,
  onChanged: (value) {},
  label: 'Subscribe to newsletter',
)

// 3. Filled style
FBCheckbox.filled(
  value: true,
  onChanged: (value) {},
  label: 'Remember me',
)

// 4. Small size
FBCheckbox.small(
  value: true,
  onChanged: (value) {},
  label: 'Small checkbox',
)

// 5. Large size
FBCheckbox.large(
  value: false,
  onChanged: (value) {},
  label: 'Large checkbox',
)
```

### Real-World Example: Settings Form

```dart
class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  bool emailNotifications = true;
  bool pushNotifications = false;
  bool marketingEmails = false;
  bool rememberLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Notifications',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),

          FBCheckbox.basic(
            value: emailNotifications,
            label: 'Email Notifications',
            onChanged: (value) {
              setState(() => emailNotifications = value ?? false);
            },
          ),

          FBCheckbox.basic(
            value: pushNotifications,
            label: 'Push Notifications',
            onChanged: (value) {
              setState(() => pushNotifications = value ?? false);
            },
          ),

          FBCheckbox.basic(
            value: marketingEmails,
            label: 'Marketing Emails',
            onChanged: (value) {
              setState(() => marketingEmails = value ?? false);
            },
          ),

          SizedBox(height: 32),

          Text(
            'Security',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),

          FBCheckbox.basic(
            value: rememberLogin,
            label: 'Remember Login on This Device',
            onChanged: (value) {
              setState(() => rememberLogin = value ?? false);
            },
          ),

          SizedBox(height: 32),

          FBButton.solid(
            label: 'Save Settings',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Settings saved!')),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

### Checkbox Group

```dart
class CheckboxGroup extends StatefulWidget {
  @override
  _CheckboxGroupState createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    final items = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

    return Column(
      children: items
          .map(
            (item) => FBCheckbox.basic(
              value: selectedItems.contains(item),
              label: item,
              onChanged: (value) {
                setState(() {
                  if (value ?? false) {
                    selectedItems.add(item);
                  } else {
                    selectedItems.remove(item);
                  }
                });
              },
            ),
          )
          .toList(),
    );
  }
}
```

---

## Radio

Single selection from multiple options.

### All Variants

```dart
import 'package:my_app/widgets/radio.dart';

// 1. Basic radio
FBRadio.basic(
  value: 'option1',
  groupValue: selectedOption,
  label: 'Option 1',
  onChanged: (value) {},
)

// 2. Outlined style
FBRadio.outlined(
  value: 'option2',
  groupValue: selectedOption,
  label: 'Option 2',
  onChanged: (value) {},
)

// 3. Horizontal layout
FBRadio.horizontal(
  options: ['Option 1', 'Option 2', 'Option 3'],
  groupValue: selectedOption,
  onChanged: (value) {},
)

// 4. Vertical layout (default)
FBRadio.vertical(
  options: ['Option 1', 'Option 2', 'Option 3'],
  groupValue: selectedOption,
  onChanged: (value) {},
)
```

### Real-World Example: Subscription Plan

```dart
class PlanSelector extends StatefulWidget {
  @override
  _PlanSelectorState createState() => _PlanSelectorState();
}

class _PlanSelectorState extends State<PlanSelector> {
  String selectedPlan = 'basic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Plan')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Choose your plan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),

          // Basic Plan
          _buildPlanCard(
            title: 'Basic',
            price: '\$0/month',
            features: ['5 projects', 'Community support'],
            value: 'basic',
          ),

          SizedBox(height: 16),

          // Pro Plan
          _buildPlanCard(
            title: 'Pro',
            price: '\$9.99/month',
            features: ['Unlimited projects', 'Email support', 'Advanced features'],
            value: 'pro',
            isPopular: true,
          ),

          SizedBox(height: 16),

          // Enterprise Plan
          _buildPlanCard(
            title: 'Enterprise',
            price: 'Contact us',
            features: ['Everything in Pro', 'Phone support', 'Custom features'],
            value: 'enterprise',
          ),

          SizedBox(height: 32),

          FBButton.solid(
            label: 'Continue with ${selectedPlan.toUpperCase()}',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required List<String> features,
    required String value,
    bool isPopular = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedPlan == value ? Colors.blue : Colors.grey[300]!,
          width: selectedPlan == value ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (isPopular)
                          FBBadge.filled(
                            label: 'POPULAR',
                            color: Colors.amber,
                          ),
                      ],
                    ),
                    Text(
                      price,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ...features.map((f) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Icon(Icons.check, color: Colors.green, size: 20),
                      SizedBox(width: 8),
                      Text(f),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Divider(height: 0),
          FBRadio.basic(
            value: value,
            groupValue: selectedPlan,
            label: 'Select this plan',
            onChanged: (val) {
              setState(() => selectedPlan = val ?? 'basic');
            },
          ),
        ],
      ),
    );
  }
}
```

---

## Toggle

On/Off switch for boolean settings.

### All Variants

```dart
import 'package:my_app/widgets/toggle.dart';

// 1. Basic toggle
FBToggle.basic(
  value: isDarkMode,
  onChanged: (value) {},
)

// 2. Outlined style
FBToggle.outlined(
  value: isEnabled,
  onChanged: (value) {},
)

// 3. Small size
FBToggle.small(
  value: true,
  onChanged: (value) {},
)

// 4. Large size
FBToggle.large(
  value: false,
  onChanged: (value) {},
)
```

### Real-World Example: Theme Switcher

```dart
class ThemeSwitcher extends StatefulWidget {
  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme Settings')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      isDarkMode ? 'Enabled' : 'Disabled',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                FBToggle.basic(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() => isDarkMode = value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## Dropdown

Select from a list of options.

### All Variants

```dart
import 'package:my_app/widgets/dropdown.dart';

// 1. Basic dropdown
FBDropdown.basic(
  label: 'Country',
  initialValue: 'usa',
  items: const ['usa', 'uk', 'canada'],
  onChanged: (value) {},
)

// 2. Outlined style
FBDropdown.outlined(
  label: 'Category',
  items: const ['Electronics', 'Books', 'Clothing'],
  onChanged: (value) {},
)

// 3. Searchable dropdown
FBDropdown.searchable(
  label: 'Search User',
  items: users,
  onChanged: (value) {},
)

// 4. Multi-select dropdown
FBDropdown.multiSelect(
  label: 'Select Tags',
  items: const ['Flutter', 'Dart', 'Mobile'],
  onChanged: (values) {},
)
```

### Real-World Example: Country Selector

```dart
class CountrySelector extends StatefulWidget {
  @override
  _CountrySelectorState createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  String? selectedCountry;

  final countries = {
    'us': '🇺🇸 United States',
    'uk': '🇬🇧 United Kingdom',
    'ca': '🇨🇦 Canada',
    'au': '🇦🇺 Australia',
    'in': '🇮🇳 India',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Country')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            FBDropdown.outlined(
              label: 'Country',
              items: countries.values.toList(),
              initialValue: selectedCountry != null ? countries[selectedCountry] : null,
              onChanged: (value) {
                setState(() {
                  selectedCountry = countries.entries
                      .firstWhere((e) => e.value == value)
                      .key;
                });
              },
            ),
            SizedBox(height: 24),
            if (selectedCountry != null)
              FBCard.elevated(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Selected: ${countries[selectedCountry]}'),
                      SizedBox(height: 12),
                      Text(
                        'Country code: $selectedCountry',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
```

---

## Complete Form Example

Combining all form components in one screen:

```dart
class CompleteForm extends StatefulWidget {
  @override
  _CompleteFormState createState() => _CompleteFormState();
}

class _CompleteFormState extends State<CompleteForm> {
  final _formKey = GlobalKey<FormState>();
  
  String name = '';
  String email = '';
  String country = 'us';
  String gender = 'male';
  bool newsletter = false;
  bool terms = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complete Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // TextFields
              FBTextField.outlined(
                label: 'Full Name',
                hintText: 'John Doe',
                onChanged: (v) => name = v,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16),

              FBTextField.email(
                label: 'Email',
                hintText: 'john@example.com',
                onChanged: (v) => email = v,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16),

              // Dropdown
              FBDropdown.outlined(
                label: 'Country',
                items: ['United States', 'United Kingdom', 'Canada'],
                onChanged: (v) => country = v ?? 'us',
              ),
              SizedBox(height: 16),

              // Radio
              FBRadio.vertical(
                options: ['Male', 'Female', 'Other'],
                groupValue: gender,
                onChanged: (v) => setState(() => gender = v),
              ),
              SizedBox(height: 16),

              // Checkboxes
              FBCheckbox.basic(
                value: newsletter,
                label: 'Subscribe to newsletter',
                onChanged: (v) => setState(() => newsletter = v ?? false),
              ),
              FBCheckbox.basic(
                value: notifications,
                label: 'Enable notifications',
                onChanged: (v) => setState(() => notifications = v ?? false),
              ),
              FBCheckbox.basic(
                value: terms,
                label: 'I agree to terms',
                onChanged: (v) => setState(() => terms = v ?? false),
              ),
              SizedBox(height: 16),

              // Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('2FA Security'),
                  FBToggle.basic(
                    value: false,
                    onChanged: (v) {},
                  ),
                ],
              ),
              SizedBox(height: 32),

              // Submit
              FBButton.solid(
                label: 'Submit Form',
                onPressed: terms
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Form submitted!')),
                          );
                        }
                      }
                    : null,
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

## Best Practices

1. **Always validate** - Use validator in TextFields
2. **Show errors** - Display validation messages
3. **Disable when needed** - Use `enabled: false` for loading states
4. **Group related fields** - Use Cards or Sections
5. **Provide defaults** - Set `initialValue` where appropriate
6. **Label everything** - Always include label for accessibility

---

## Next Steps

- 📚 [Display Components](./display-components-guide.md)
- 🔘 [Button Components](./button-components-guide.md)
- 📖 [Complete Examples](./examples.md)

---

[← Getting Started](./getting-started.md) | [Display Components →](./display-components-guide.md)

import 'package:flutter/material.dart';
import '../widgets/textfield.dart';
import '../utils/validators.dart';

class TextfieldExample extends StatefulWidget {
  const TextfieldExample({super.key});

  @override
  State<TextfieldExample> createState() => _TextfieldExampleState();
}

class _TextfieldExampleState extends State<TextfieldExample> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          FBTextField(
            label: 'Email',
            hint: 'Enter your email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
            validator: FBValidators.validateEmail,
          ),
          FBTextField(
            label: 'Password',
            hint: 'Enter your password',
            controller: _passwordController,
            obscureText: true,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: const Icon(Icons.visibility),
            validator: FBValidators.validatePassword,
          ),
          FBTextField(
            label: 'Phone',
            hint: '(123) 456-7890',
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone),
            validator: FBValidators.validatePhone,
          ),
          FBTextField(
            label: 'Disabled Field',
            hint: 'This field is disabled',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/checkbox.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {

  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FBCheckbox(
        value: _value,
        onChanged: (bool? newValue) => setState(()=>  _value = newValue!),
        boxColor: Colors.green,
        label: "Accept Terms and Conditions",
        isError: true,
        disable: false,
      ),
    );
  }
}
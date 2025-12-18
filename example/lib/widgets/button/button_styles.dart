import 'package:flutter/material.dart';

class ButtonStyles {
  ButtonStyles._();

  static ButtonStyle primary() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  static ButtonStyle secondary() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade200,
      foregroundColor: Colors.black,
      elevation: 0,
      side: const BorderSide(color: Colors.grey),
    );
  }

  static ButtonStyle danger() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    );
  }
}

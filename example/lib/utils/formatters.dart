import 'package:flutter/services.dart';

class FBFormatters {
  /// Format text to uppercase
  static TextInputFormatter uppercaseFormatter() => UppercaseTextFormatter();

  /// Format text to lowercase
  static TextInputFormatter lowercaseFormatter() => LowercaseTextFormatter();

  /// Format currency (USD)
  static TextInputFormatter currencyFormatter({String symbol = '\$'}) =>
      CurrencyTextFormatter(symbol: symbol);

  /// Format phone number (XXX) XXX-XXXX
  static TextInputFormatter phoneNumberFormatter() => PhoneNumberFormatter();

  /// Allow only digits
  static TextInputFormatter digitsOnly() => FilteringTextInputFormatter.digitsOnly;

  /// Allow only letters
  static TextInputFormatter lettersOnly() => LettersOnlyFormatter();

  /// Format date (MM/DD/YYYY)
  static TextInputFormatter dateFormatter() => DateTextFormatter();

  /// Allow alphanumeric only
  static TextInputFormatter alphanumericOnly() =>
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'));
}

class UppercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class CurrencyTextFormatter extends TextInputFormatter {
  final String symbol;

  CurrencyTextFormatter({required this.symbol});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final value = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (value.isEmpty) {
      return newValue.copyWith(text: '');
    }
    final amount = int.parse(value);
    final formatted = (amount / 100).toStringAsFixed(2);
    return newValue.copyWith(
      text: '$symbol$formatted',
      selection: TextSelection.collapsed(offset: '$symbol$formatted'.length),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final value = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (value.isEmpty) {
      return newValue.copyWith(text: '');
    }
    if (value.length <= 3) {
      return newValue.copyWith(text: value);
    } else if (value.length <= 6) {
      return newValue.copyWith(text: '(${value.substring(0, 3)}) ${value.substring(3)}');
    } else {
      return newValue.copyWith(
        text:
            '(${value.substring(0, 3)}) ${value.substring(3, 6)}-${value.substring(6, min(10, value.length))}',
      );
    }
  }

  int min(int a, int b) => a < b ? a : b;
}

class LettersOnlyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final filtered = newValue.text.replaceAll(RegExp(r'[^a-zA-Z\s]'), '');
    return newValue.copyWith(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final value = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (value.isEmpty) {
      return newValue.copyWith(text: '');
    }
    if (value.length <= 2) {
      return newValue.copyWith(text: value);
    } else if (value.length <= 4) {
      return newValue.copyWith(text: '${value.substring(0, 2)}/${value.substring(2)}');
    } else {
      return newValue.copyWith(
        text:
            '${value.substring(0, 2)}/${value.substring(2, 4)}/${value.substring(4, min(8, value.length))}',
      );
    }
  }

  int min(int a, int b) => a < b ? a : b;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FBTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final int? maxLength;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final EdgeInsets contentPadding;
  final BorderRadius borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color fillColor;
  final bool filled;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final bool readOnly;
  final String? errorText;
  final bool? isError;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;

  const FBTextField._({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.onChanged,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.errorBorderColor = Colors.red,
    this.fillColor = Colors.white,
    this.filled = true,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    bool readOnly = false,
    this.errorText,
    this.isError = false,
    this.inputFormatters,
    InputDecoration? decoration,
  })  : labelStyle = labelStyle,
        hintStyle = hintStyle,
        readOnly = readOnly,
        decoration = decoration;

  // -------- OUTLINE (Default) --------
  factory FBTextField({
    Key? key,
    String? label,
    String? hint,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    int maxLines = 1,
    int? maxLength,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
    Color borderColor = Colors.grey,
    Color focusedBorderColor = Colors.blue,
    Color errorBorderColor = Colors.red,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    bool? isError,
  }) {
    return FBTextField.outline(
      key: key,
      label: label,
      hint: hint,
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      inputFormatters: inputFormatters,
      errorText: errorText,
      isError: isError,
    );
  }

  // -------- OUTLINE --------
  factory FBTextField.outline({
    Key? key,
    String? label,
    String? hint,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    int maxLines = 1,
    int? maxLength,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
    Color borderColor = Colors.grey,
    Color focusedBorderColor = Colors.blue,
    Color errorBorderColor = Colors.red,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    bool? isError,
  }) {
    return FBTextField._(
      key: key,
      label: label,
      hint: hint,
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      filled: false,
      fillColor: Colors.transparent,
      inputFormatters: inputFormatters,
      errorText: errorText,
      isError: isError,
    );
  }

  // -------- FILLED --------
  factory FBTextField.filled({
    Key? key,
    String? label,
    String? hint,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    int maxLines = 1,
    int? maxLength,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    Color fillColor = const Color(0xFFF5F5F5),
    Color focusedBorderColor = Colors.blue,
    Color errorBorderColor = Colors.red,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    bool? isError,
  }) {
    return FBTextField._(
      key: key,
      label: label,
      hint: hint,
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      contentPadding: contentPadding,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderColor: Colors.transparent,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      filled: true,
      fillColor: fillColor,
      inputFormatters: inputFormatters,
      errorText: errorText,
      isError: isError,
    );
  }

  // -------- UNDERLINE --------
  factory FBTextField.underline({
    Key? key,
    String? label,
    String? hint,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    int maxLines = 1,
    int? maxLength,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    Color borderColor = Colors.grey,
    Color focusedBorderColor = Colors.blue,
    Color errorBorderColor = Colors.red,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    bool? isError,
  }) {
    return FBTextField._(
      key: key,
      label: label,
      hint: hint,
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      borderRadius: BorderRadius.zero,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      filled: false,
      fillColor: Colors.transparent,
      inputFormatters: inputFormatters,
      errorText: errorText,
      isError: isError,
    );
  }

  @override
  State<FBTextField> createState() => _FBTextFieldState();
}

class _FBTextFieldState extends State<FBTextField> {
  late FocusNode _focusNode;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _errorText = widget.errorText;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFBError = widget.isError ?? false;
    final errorColor = widget.errorBorderColor;

    // Use custom decoration if provided
    if (widget.decoration != null) {
      return TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        maxLength: widget.maxLength,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        decoration: widget.decoration,
      );
    }

    // Build default decoration based on type
    InputDecoration decoration;

    if (widget.borderRadius == BorderRadius.zero) {
      // Underline style
      decoration = InputDecoration(
        label: widget.label != null ? Text(widget.label!) : null,
        hintText: widget.hint,
        labelStyle: widget.labelStyle,
        hintStyle: widget.hintStyle ?? TextStyle(color: Colors.grey[400]),
        errorText: _errorText,
        border: const UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isFBError ? errorColor : widget.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isFBError ? errorColor : widget.focusedBorderColor,
            width: 2,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: errorColor, width: 1.5),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: errorColor, width: 2),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        counterText: '',
      );
    } else {
      // Outline or filled style
      decoration = InputDecoration(
        label: widget.label != null ? Text(widget.label!) : null,
        hintText: widget.hint,
        labelStyle: widget.labelStyle,
        hintStyle: widget.hintStyle ?? TextStyle(color: Colors.grey[400]),
        errorText: _errorText,
        errorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(color: errorColor, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(color: errorColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(
            color: isFBError ? errorColor : widget.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(
            color: isFBError ? errorColor : widget.focusedBorderColor,
            width: 2,
          ),
        ),
        filled: widget.filled,
        fillColor: widget.fillColor,
        contentPadding: widget.contentPadding,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        counterText: '',
      );
    }

    return TextField(
      controller: widget.controller,
      onChanged: (value) {
        widget.onChanged?.call(value);
        if (_errorText != null) {
          setState(() => _errorText = null);
        }
      },
      onTap: widget.onTap,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      decoration: decoration,
    );
  }
}

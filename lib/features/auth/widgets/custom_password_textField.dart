import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconButton? iconButton;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  const CustomPasswordFormField({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.iconButton,
    required this.keyboardType,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: iconButton,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}

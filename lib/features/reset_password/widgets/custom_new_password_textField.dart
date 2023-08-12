import 'package:flutter/material.dart';

class CustomNewPasswordTextField extends StatefulWidget {
  const CustomNewPasswordTextField({super.key});

  @override
  State<CustomNewPasswordTextField> createState() =>
      _CustomNewPasswordTextFieldState();
}

class _CustomNewPasswordTextFieldState
    extends State<CustomNewPasswordTextField> {
  bool hiddenText = true;

  void _onHidden() {
    setState(() {
      hiddenText = !hiddenText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 25.0,
      ),
      child: TextFormField(
        obscureText: hiddenText,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: _onHidden,
            icon: Icon(hiddenText ? Icons.visibility_off : Icons.visibility),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          hintText: 'New Password',
        ),
      ),
    );
  }
}

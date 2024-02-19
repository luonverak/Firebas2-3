import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.obscureText,
  });
  var controller = TextEditingController();
  IconButton? suffixIcon;
  var label;
  bool? obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 18, color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        focusColor: Colors.white,
        labelStyle: TextStyle(fontSize: 18, color: Colors.white),
      ),
      obscureText: obscureText!,
    );
  }
}

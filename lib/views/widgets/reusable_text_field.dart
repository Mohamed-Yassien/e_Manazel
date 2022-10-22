import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.hasPassword = false,
    required this.validate,
    this.suffixIcon,
    required this.textInputType,
    this.secureText = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool hasPassword;
  final Function validate;
  final IconButton? suffixIcon;
  final TextInputType textInputType;
  final bool secureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xffeaa504),
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.caption,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide.none,
        ),
        suffixIcon: hasPassword ? suffixIcon : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(
            color: Color(0xffeaa504),
            width: 2,
          ),
        ),
      ),
      obscureText: hasPassword ?  secureText : false,
      validator: (val) => validate(val),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Icon? iconPrefix;

  const CustomTextFiled({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.iconPrefix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: const Color(0xFF6F35A5),
      decoration: InputDecoration(
        label: Text(labelText ?? ""),
        hintText: hintText,
        prefixIcon: iconPrefix ??
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: iconPrefix,
            ),
      ),
    );
  }
}

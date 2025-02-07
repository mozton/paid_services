import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? intText;
  final TextEditingController controller;

  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
    this.intText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        autofocus: false,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        obscureText: obscureText,
        //  onChanged: ( value ) => formValues[formProperty] = value,
        validator: (value) {
          if (value == null) return 'Este campo es requerido';
          return value.isEmpty ? '' : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          // hintText: hintText,
          labelText: labelText,
          // helperText: helperText,
          // prefixIcon: Icon( Icons.verified_user_outlined ),
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon),
        ));
  }
}

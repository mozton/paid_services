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
  final void Function()? onTap;
  final String formProperty;
  final Map<String, String> formValues;
  final bool? onTapAlwaysCalled;
  final Color? colors ;
  

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
    this.onTap,
    this.onTapAlwaysCalled = false, 
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
        controller: controller,
        autofocus: false,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onTapAlwaysCalled: false,
    
        //  onChanged: ( value ) => formValues[formProperty] = value,
        validator: (value) {
          if (value == null) return 'Este campo es requerido';
          return value.isEmpty ? '' : null; 
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon:icon == null ? null : Icon(icon),
          border:  const OutlineInputBorder(
          
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)
              )
          ),
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          // prefixIcon: Icon( Icons.verified_user_outlined ),
          // suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          // icon: icon == null ? null : Icon(icon),
        ));
  }
}

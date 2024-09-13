import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboard;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Function(String value) onChanged;
  final double? fontSize;
  const AuthTextField(
      {super.key,
      required this.label,
      required this.onChanged,
      this.keyboard,
      this.obscureText,
      this.suffixIcon,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w600,
          color: ColorPallete.primary),
      obscureText: obscureText ?? false,
      cursorColor: ColorPallete.primary,
      decoration: const InputDecoration().copyWith(
          contentPadding: EdgeInsets.zero,
          labelText: label,
          labelStyle: TextStyle(
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.w600,
              color: ColorPallete.primary),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPallete.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPallete.primary),
          ),
          suffixIcon: suffixIcon),
      // IconButton(
      //     icon: Icon(
      //       !controller.showPassword
      //               .value
      //           ? Icons.visibility
      //           : Icons
      //               .visibility_off,
      //     ),
      //     onPressed: () {
      //       controller.showPassword
      //               .value =
      //           !controller
      //               .showPassword
      //               .value;
      //     }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter text';
        }
        if (value.length < 6) {
          return 'Password should be at least 6 characters long';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}

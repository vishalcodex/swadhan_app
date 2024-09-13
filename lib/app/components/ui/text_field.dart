import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/color_pallete.dart';
import '../../../common/utils.dart';

class MyTextField extends StatelessWidget {
  final Color? textColor;
  final Color? hintColor;
  final double? fontSize;
  final String? initialValue;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool? showLine;
  final bool? enabled;
  final int? maxLines;
  final int? length;
  final bool? capitalisation;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  const MyTextField(
      {super.key,
      this.textColor,
      this.hintColor,
      this.initialValue,
      this.hintText,
      this.obscureText,
      this.showLine,
      this.fontSize,
      this.keyboardType,
      this.onChanged,
      this.validator,
      this.length,
      this.capitalisation,
      this.maxLines,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return TextFormField(
      enabled: enabled,
      validator: validator,
      maxLines: maxLines,
      key: Key(initialValue ?? ""),
      onChanged: onChanged,
      initialValue: initialValue ?? "",
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      textCapitalization: (capitalisation ?? false)
          ? TextCapitalization.characters
          : TextCapitalization.none,
      inputFormatters: [
        if (length != null) LengthLimitingTextInputFormatter(length),
        if (capitalisation ?? false) UpperCaseTextFormatter(),
      ],
      decoration: const InputDecoration().copyWith(
        border: showLine ?? false ? null : InputBorder.none,
        hintText: hintText ?? "",
        hintStyle: SafeGoogleFont('Roboto',
            fontSize: (fontSize ?? 12) * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2175 * ffem / fem,
            color: hintColor ?? ColorPallete.grey),
        errorStyle: SafeGoogleFont('Roboto',
            fontSize: (fontSize ?? 12) * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2175 * ffem / fem,
            color: ColorPallete.red),
      ),
      style: SafeGoogleFont('Roboto',
          fontSize: (fontSize ?? 12) * ffem,
          fontWeight: FontWeight.w500,
          height: 1.2175 * ffem / fem,
          color: textColor ?? ColorPallete.secondary),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

import 'package:flutter/material.dart';

Widget CustomTextField(
    ValueKey key,
    TextInputType textType,
    Function volidator,
    Function onSaved,
    //IconData icon,
    String label,
    //String hintText,
    BuildContext context) {
  return TextFormField(
    key: key,
    keyboardType: textType,
    //autovalidateMode: AutovalidateMode.,

    obscureText: textType.hashCode == TextInputType.visiblePassword.hashCode
        ? true
        : false,
    autofocus: false,
    validator: (value) => volidator(value),
    onChanged: (value) => onSaved(value),
    decoration: InputDecoration(
      labelText: label,
      //prefixIcon: Icon(icon),
      // hintText: hintText,
      // hintStyle: TextStyle(
      //     color: const Color(0xffa9c8cb),
      //     fontFamily: 'PTSansRegular',
      //     fontStyle: FontStyle.normal,
      //     fontSize: 9.0 //* getScaleHeight(context),
      //     ),

      //filled: true,
    ),
  );
}

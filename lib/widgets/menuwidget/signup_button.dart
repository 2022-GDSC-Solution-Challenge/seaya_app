import 'package:flutter/material.dart';

Widget customElevatedButton(
    Function onPressed, String text, BuildContext context) {
  return ElevatedButton(
    onPressed: () async => onPressed(),
    child: Text(text,
        style: TextStyle(
          color: const Color(0xff2B2B2B),
          fontFamily: 'PTSansRegular',
          fontStyle: FontStyle.normal,
          fontSize: 13,
        )),
    style: ElevatedButton.styleFrom(
      primary: const Color(0xffEFF1F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
    ),
  );
}

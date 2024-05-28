import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: 'Poppins',
  extensions: const <ThemeExtension<dynamic>>[
    CustomColors(
      brown: Color.fromRGBO(75, 44, 32, 1.0),
      cream: Color.fromRGBO(236, 206, 180, 1),
      lightBrown: Color.fromRGBO(166, 124, 82, 1.0),
      green: Color.fromRGBO(78, 141, 124, 1.0),
      black: Color.fromRGBO(39, 39, 39, 1.0),
      white: Colors.white,
      textColor: Colors.black,
      background: Color.fromRGBO(250, 240, 232, 1)
    )
  ]
);

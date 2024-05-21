import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  fontFamily: 'Poppins',
  extensions: const <ThemeExtension<dynamic>>[
    CustomColors(
      brown: Color.fromRGBO(51, 41, 32, 1.0),
      cream: Color.fromRGBO(30, 20, 16, 1.0),
      lightBrown: Color.fromRGBO(140, 106, 79, 1.0),
      green: Color.fromRGBO(60, 114, 102, 1.0),
      black: Color.fromRGBO(46, 42, 39, 1.0),
      white: Color.fromRGBO(152, 152, 152, 1.0),
      background: Colors.black54
    )
  ]
);

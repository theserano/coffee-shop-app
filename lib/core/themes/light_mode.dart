import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: 'Poppins',
  extensions: const <ThemeExtension<dynamic>>[
    CustomColors(
      brown: Color.fromRGBO(75, 44, 32, 1.0),
      cream: Color.fromRGBO(213, 187, 162, 1.0),
      lightBrown: Color.fromRGBO(166, 124, 82, 1.0),
      green: Color.fromRGBO(78, 141, 124, 1.0),
      black: Color.fromRGBO(39, 39, 39, 1.0),
      white: Color.fromRGBO(246, 242, 237, 1.0),
      background: Colors.white
    )
  ]
);

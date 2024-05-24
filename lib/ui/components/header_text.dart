import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Text(
      text,
      style: TextStyle(
        color: customColors?.white,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontFamily: 'poppins'
      ),
    );
  }
}

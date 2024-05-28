import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrinkTile extends StatelessWidget {
  final Function()? onTap;
  final Drink drink;
  const DrinkTile({super.key, required this.drink, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            SvgPicture.asset(drink.imagePath),
            Text(drink.name)
          ],
        ),
      ),
    );
  }
}
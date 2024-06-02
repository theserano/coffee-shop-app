import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:flutter/material.dart';


class DrinkTile extends StatelessWidget {
  final Function()? onTap;
  final Drink drink;
  const DrinkTile({super.key, required this.drink, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: customColors?.white,
          ),
          child: Column(
            children: [
              Image.asset(drink.imagePath, fit: BoxFit.cover,),
              const Spacer(),
              Text(drink.name),
              const SizedBox(height: 10.0,)
            ],
          ),
        ),
      ),
    );
  }
}
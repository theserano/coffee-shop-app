import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:coffee_shop_app/data/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
        elevation: 4.0,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Provider.of<ThemeProvider>(context).isDarkMode ? customColors?.black : customColors?.background,
          ),
          child: Column(
            children: [
              Opacity(
                opacity: Provider.of<ThemeProvider>(context).isDarkMode ? 0.7 : 0.8,
                child: Image.asset(drink.imagePath, fit: BoxFit.cover, width: 100.0,)
              ),
              const Spacer(),
              Text(drink.name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: customColors?.textColor ),),
              const SizedBox(height: 10.0,)
            ],
          ),
        ),
      ),
    );
  }
}
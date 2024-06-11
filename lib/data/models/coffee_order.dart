import 'package:coffee_shop_app/data/models/drinks.dart';

class CoffeeOrder {
  final Drink drink;
  final String cupSize;
  final String addIns;

  CoffeeOrder({required this.drink, required this.cupSize, required this.addIns});
}
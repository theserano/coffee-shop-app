import 'package:coffee_shop_app/data/models/drinks.dart';

class CoffeeOrder {
  final Drink drink;
  final String? cupSize;
  final String? addIns;
  final String? sweetener;
  final String? flavour;

  CoffeeOrder({required this.drink, required this.cupSize, required this.addIns, required this.sweetener, required this.flavour});
}
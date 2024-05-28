import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Drink> _menu = [
    Drink(
        name: 'Hot coffees',
        imagePath: 'lib/assets/hot_coffee.svg',
        description: 'Steaming hot coffees',
        price: '24.99'),
    Drink(
        name: 'Hot Teas',
        imagePath: 'lib/assets/hot_tea.svg',
        description: 'Steaming hot teas',
        price: '22.99'),
    Drink(
        name: 'Hot Drinks',
        imagePath: 'lib/assets/hot_drinks.svg',
        description: 'Steaming hot drinks',
        price: '26.99'),
    Drink(
        name: 'Frappucino',
        imagePath: 'lib/assets/frappucino.svg',
        description: 'Steaming hot teas',
        price: '32.99'),
    Drink(
        name: 'Ice Teas',
        imagePath: 'lib/assets/ice_tea.svg',
        description: 'Chilled teas',
        price: '28.99'),
    Drink(
        name: 'Cold Drinks',
        imagePath: 'lib/assets/cold_drinks.svg',
        description: 'Iced cold teas',
        price: '18.99'),
  ];

  List<Drink> get menu => _menu;
}

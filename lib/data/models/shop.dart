import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Drink> _menu = [
    Drink(
        name: 'Hot coffees',
        imagePath: 'lib/assets/hot_coffee.png',
        description: 'Steaming hot coffees',
        price: '24.99'),
    Drink(
        name: 'Hot Teas',
        imagePath: 'lib/assets/hot_tea.png',
        description: 'Steaming hot teas',
        price: '22.99'),
    Drink(
        name: 'Hot Drinks',
        imagePath: 'lib/assets/hot_drinks.png',
        description: 'Steaming hot drinks',
        price: '26.99'),
    Drink(
        name: 'Frappucino',
        imagePath: 'lib/assets/frappucino.png',
        description: 'Steaming hot teas',
        price: '32.99'),
    Drink(
        name: 'Ice Teas',
        imagePath: 'lib/assets/ice_tea.png',
        description: 'Chilled teas',
        price: '28.99'),
    Drink(
        name: 'Cold Coffees',
        imagePath: 'lib/assets/cold_coffees.png',
        description: 'Iced cold teas',
        price: '18.99'),
  ];

  List<Drink> get menu => _menu;


}

import 'package:coffee_shop_app/data/models/coffee_order.dart';
import 'package:flutter/material.dart';

class Coffee extends ChangeNotifier {
  final List <CoffeeOrder> _orders = [];

  List<CoffeeOrder> get orders => _orders;

  void addOrder(CoffeeOrder order) {
    _orders.add(order);
    notifyListeners();
  }

  void removeOrder(CoffeeOrder order) {
    _orders.remove(order);
    notifyListeners();
  }

  void clearOrder(){
    _orders.clear();
    notifyListeners();
  }

  String getTotalPrice() {
    double prices =
        _orders.fold(0.0, (sum, e) => sum + double.parse(e.drink.price));
    return prices.toStringAsFixed(2);
  }

}
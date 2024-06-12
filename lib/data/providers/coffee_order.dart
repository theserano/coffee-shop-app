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
}
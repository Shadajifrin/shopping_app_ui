import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  int count;
  final double price;

  CartItem({required this.name, required this.image, required this.count, required this.price});
}

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void incrementItem(CartItem item) {
    item.count++;
    notifyListeners();
  }

  void decrementItem(CartItem item) {
    if (item.count > 1) {
      item.count--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }
}

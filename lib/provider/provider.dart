import 'package:flutter/material.dart';

class MyScreenProvider with ChangeNotifier {
  int value = 1;
  List<CartItem> cartItems = [];

  void addCounter() {
    value++;
    notifyListeners();
  }

  void removeCounter() {
    if (value > 1) {
      value--;
      notifyListeners();
    }
  }

  void addToCart(String img, int price, String tit) {
    cartItems.add(CartItem(image: img, price: price, titles: tit));
    notifyListeners();
  }

  String totPrice(int price) {
    int tot = value * price;
    notifyListeners();
    return tot.toString();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }
}

class CartItem {
  int? quantity;
  final String image;
  final int price;
  String? titles;

  CartItem(
      {required this.image, required this.price, this.titles, this.quantity});
}

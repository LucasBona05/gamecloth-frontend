import 'package:flutter/cupertino.dart';
import 'package:gamecloth_frontend/models/cart.dart';

class CartController extends ChangeNotifier {
  List<Cart> cart = [];

  void addProducts(Cart cart) {
    this.cart.add(cart);
    notifyListeners();
  }

  void removeProducts(Cart cart) {
    this.cart.remove(cart);
    notifyListeners();
  }

  void changeQuantity(int index, bool operation) {
    if(operation) {
      this.cart[index].quantity++;
    } else {
      this.cart[index].quantity--;
    }
    notifyListeners();
  }

  void cleanList() {
    this.cart.clear();
    notifyListeners();
  }
}
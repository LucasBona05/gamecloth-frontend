import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/controllers/cart_controller.dart';
import 'package:gamecloth_frontend/models/cart.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:provider/provider.dart';

String parseEnumGame(Game game) {
  switch (game) {
    case Game.FORTNITE:
      return ParseEnumGame.FORTNITE;
    case Game.CS:
      return ParseEnumGame.CS;
    case Game.FREEFIRE:
      return ParseEnumGame.FREEFIRE;
    case Game.ROCKETLEAGUE:
      return ParseEnumGame.ROCKETLEAGUE;
    case Game.LOL:
      return ParseEnumGame.LOL;
    case Game.VALORANT:
      return ParseEnumGame.VALORANT;
    default:
      return 'Erro';
  }
}

abstract class ParseEnumGame {
  static const FORTNITE = 'Fortnite';
  static const CS = 'Counter Strike Global Offensive';
  static const FREEFIRE = 'Free Fire';
  static const ROCKETLEAGUE = 'Rocket League';
  static const LOL = 'League of Legends';
  static const VALORANT = 'Valorant';
}

double setCartTotalPrice(List<Cart> cart) {
  double totalValue = 0;
  for (int i = 0; i < cart.length; i++) {
    totalValue += cart[i].product.price * cart[i].quantity;
  }
  return totalValue;
}

void addProductToCart(
    {required BuildContext context, required Product product}) {
  List<Cart> provider =
      Provider.of<CartController>(context, listen: false).cart;
  if (provider
      .any((element) => element.product.idProduct == product.idProduct)) {
    Provider.of<CartController>(context, listen: false).changeQuantity(
        provider
            .indexWhere((element) => element.product.title == product.title),
        true);
  } else {
    Cart itemCart = Cart(product: product, quantity: 1);
    Provider.of<CartController>(context, listen: false).addProducts(itemCart);
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: accentColor,
      duration: Duration(milliseconds: 500),
      content: Text('Item adicionado ao carrinho!'),
    ),
  );
}

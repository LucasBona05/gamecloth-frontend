import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/add_button.dart';
import 'package:gamecloth_frontend/components/game_cloth_alert_dialog.dart';
import 'package:gamecloth_frontend/components/list_cart_product_card.dart';
import 'package:gamecloth_frontend/controllers/cart_controller.dart';
import 'package:gamecloth_frontend/models/cart.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/functions/functions.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CARRINHO',
          style: kAppTitle,
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        brightness: Brightness.dark,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
            onPressed: () {
              Provider.of<CartController>(context, listen: false).cleanList();
            },
          ),
        ],
      ),
      body: Consumer<CartController>(
        builder: (context, item, _) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
            child: item.cart.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: item.cart.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListCartProductCard(
                                cartProduct: item.cart[index], index: index);
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ),
                      ),
                      CartScreenFooter(
                        cart: item.cart,
                      )
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Icon(
                            Icons.sentiment_dissatisfied_rounded,
                            color: accentColor,
                            size: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        Text(
                          'Seu carrinho está vazio',
                          style: kAppDescript_1,
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class CartScreenFooter extends StatelessWidget {
  final List<Cart> cart;
  const CartScreenFooter({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: backgroundImageCardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [priceLabel(), footerButton(context)],
          ),
        ),
      ),
    );
  }

  GameClothButton footerButton(BuildContext context) {
    return GameClothButton(
      icon: Icons.shopping_cart_outlined,
      iconColor: primaryTextColor,
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.4,
      onPressed: () {
        showGameClothAlertDialog(
          context: context,
          dialogTitle: 'Comprar skins',
          dialogContent:
              'Deseja realmente comprar essas skin? O valor final é R\$${NumberFormat.currency(locale: 'pt_BR').format(setCartTotalPrice(cart)).substring(3)}',
          action: 'Comprar',
          onPressed: () {
            Provider.of<CartController>(context, listen: false).cleanList();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  RichText priceLabel() {
    return RichText(
      text: TextSpan(
        text: 'R\$',
        style: kCartFooterTextStyle,
        children: [
          TextSpan(
            text:
                '${NumberFormat.currency(locale: 'pt_BR').format(setCartTotalPrice(cart)).substring(3)}',
            style: kCartFooterMoneyTextStyle,
          ),
        ],
      ),
    );
  }
}

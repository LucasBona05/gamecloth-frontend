import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/add_button.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/functions/functions.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatelessWidget {
  static final String route = '/productPage';
  final Product product;
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  ProductPage({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageStack(context),
                productTitle(),
                productUsername(),
                productGame(),
                productDate(),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.32,
                // ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 16.0,
                      right: 24.0,
                      top: MediaQuery.of(context).size.height * 0.38),
                  child: screenFooter(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack imageStack(BuildContext context) {
    return Stack(
      children: [
        // Image.network('${product!.image}'),
        Container(
          decoration: BoxDecoration(
            color: backgroundImageCardColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network('${product.image}'),
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          child: GameClothButton(
            icon: Icons.arrow_back_rounded,
            height: 30,
            width: 30,
            iconColor: primaryTextColor,
            iconSize: 25,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Padding productTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16),
      child: Text(
        '${product.title}',
        style: kAppTitle,
      ),
    );
  }

  Padding productGame() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16),
      child: Text(
        'Postado por: ${product.user.username}',
        style: kPriceTextStyle,
      ),
    );
  }

  Padding productUsername() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        '${parseEnumGame(product.game)}',
        style: kProductGameTextStyle,
      ),
    );
  }

  Padding productDate() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16),
      child: Text(
        'Criado em: ${dateFormat.format(product.createDate)}',
        style: kPriceTextStyle,
      ),
    );
  }

  Row screenFooter(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: Column(
            children: [
              Text(
                'Preço',
                style: kProductPriceLabelTextStyle,
              ),
              RichText(
                text: TextSpan(
                  text: 'R\$',
                  style: kFrontPriceTextStyle,
                  children: [
                    TextSpan(
                      text:
                          '${NumberFormat.currency(locale: 'pt_BR').format(product.price).substring(3)}',
                      style: kPriceTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GameClothButton(
            icon: Icons.shopping_cart_outlined,
            iconColor: primaryTextColor,
            height: MediaQuery.of(context).size.height * 0.06,
            onPressed: () {
              addProductToCart(context: context, product: product);
            },
          ),
        ),
      ],
    );
  }
}

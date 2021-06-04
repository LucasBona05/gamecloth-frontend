import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/add_button.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatelessWidget {
  static final String route = '/productPage';
  final Product? product;

  const ProductPage({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                // Image.network('${product!.image}'),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: backgroundImageCardColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Image.network(
                      'https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDkyNGxaS0luLTdMUDdMV25uOXU1TVJqamV5UG80bXMwRkxrcUVVNk1EdjdKZGZFSjFWdllWdURfMWZybExycGpaLTZ2c3ZNeVNGcTczWXI0V0dkd1VJdC1HUUk5Zy81MTJ4Mzg0/auto/auto/85/notrim/d83bf6fcfd61bd794bf74e3690748675.png'),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16),
              child: Text(
                '${product!.title}',
                style: kAppTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '${product!.game}',
                style: kProductGameTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16),
              child: Text(
                'Postado por: ${product!.user!.username}',
                style: kPriceTextStyle,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.32,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 24.0),
              child: Row(
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
                                    '${NumberFormat.currency(locale: 'pt_BR').format(product!.price).substring(3)}',
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/add_button.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/pages/product_page/product_page.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/functions/functions.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:intl/intl.dart';

class HomeProductCard extends StatelessWidget {
  final Product product;

  const HomeProductCard({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.22),
            blurRadius: 23.0,
            offset: Offset(4, 6),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: backgroundColor,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => ProductPage(product: product),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageContainer(context: context, url: product.image),
              _cardTitle(name: product.title),
              _cardGame(game: product.game),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _cardPrice(price: product.price),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 8),
                    child: GameClothButton(
                      icon: Icons.add_rounded,
                      height: 24,
                      width: 24,
                      iconColor: primaryTextColor,
                      iconSize: 20,
                      onPressed: () {
                        addProductToCart(context: context, product: product);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _cardPrice({required double price}) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16),
      child: RichText(
        text: TextSpan(
          text: 'R\$ ',
          style: kPriceLowerTextStyle,
          children: [
            TextSpan(
              text:
                  '${NumberFormat.currency(locale: 'pt_BR').format(price).substring(3)}',
              style: kPriceTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Padding _cardGame({required Game game}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        parseEnumGame(game),
        style: kCardGameTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Padding _cardTitle({required String name}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, left: 16),
      child: Text(
        name,
        style: kCardTitleTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Padding _imageContainer(
      {required BuildContext context, required String url}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundImageCardColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            url,
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.34,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

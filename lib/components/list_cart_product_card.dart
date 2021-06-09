import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/controllers/cart_controller.dart';
import 'package:gamecloth_frontend/models/cart.dart';
import 'package:gamecloth_frontend/pages/product_page/product_page.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/functions/functions.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListCartProductCard extends StatefulWidget {
  final Cart cartProduct;
  final int index;
  const ListCartProductCard(
      {Key? key, required this.cartProduct, required this.index})
      : super(key: key);

  @override
  _ListCartProductCardState createState() => _ListCartProductCardState();
}

class _ListCartProductCardState extends State<ListCartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white54,
            blurRadius: 7.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: primaryTextColor,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) =>
                    ProductPage(product: widget.cartProduct.product),
              ),
            );
          },
          onLongPress: () {
            Provider.of<CartController>(context, listen: false)
                .removeProducts(widget.cartProduct);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardImage(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText(),
                      Text(
                        parseEnumGame(widget.cartProduct.product.game),
                        overflow: TextOverflow.ellipsis,
                        style: kListCardContentTextStyle,
                      ),
                      priceText(),
                      quantityRow(
                        context: context,
                        index: widget.index,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding titleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 4),
      child: Text(
        widget.cartProduct.product.title,
        overflow: TextOverflow.ellipsis,
        style: kListCardContentTextStyle,
      ),
    );
  }

  Padding cardImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          widget.cartProduct.product.image,
          height: MediaQuery.of(context).size.height * 0.11,
          width: MediaQuery.of(context).size.width * 0.34,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Padding priceText() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: RichText(
        text: TextSpan(
          text: 'R\$',
          style: kListCardContentTextStyle,
          children: [
            TextSpan(
              text:
                  '${NumberFormat.currency(locale: 'pt_BR').format(widget.cartProduct.product.price * widget.cartProduct.quantity).substring(3)}',
              style: kListCardPriceTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Row quantityRow({required BuildContext context, required int index}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: Icon(
            Icons.remove,
            size: 20,
          ),
          onTap: () {
            if (widget.cartProduct.quantity > 1) {
              Provider.of<CartController>(context, listen: false)
                  .changeQuantity(index, false);
            } else {
              Provider.of<CartController>(context, listen: false)
                  .removeProducts(widget.cartProduct);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '${widget.cartProduct.quantity}',
            style: kListCardContentTextStyle,
          ),
        ),
        InkWell(
          child: Icon(
            Icons.add,
            size: 20,
          ),
          onTap: () {
            Provider.of<CartController>(context, listen: false)
                .changeQuantity(index, true);
          },
        ),
      ],
    );
  }
}

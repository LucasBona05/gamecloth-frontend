import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/game_cloth_alert_dialog.dart';
import 'package:gamecloth_frontend/components/simple_error_dialog.dart';
import 'package:gamecloth_frontend/controllers/product_controller.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/pages/edit_product_page/edit_product_page.dart';
import 'package:gamecloth_frontend/pages/product_page/product_page.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/functions/functions.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:intl/intl.dart';

class ListStoreProductCard extends StatefulWidget {
  final Product product;
  const ListStoreProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ListStoreProductCardState createState() => _ListStoreProductCardState();
}

class _ListStoreProductCardState extends State<ListStoreProductCard> {
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
          onLongPress: () {
            showGameClothAlertDialog(
              context: context,
              dialogTitle: 'Deletando Produto',
              dialogContent: 'Deseja realmente apagar esse produto?',
              action: 'Deletar',
              onPressed: () async {
                bool response = await ProductController()
                    .deleteProduct(idProduct: widget.product.idProduct);
                if (response) {
                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleErrorDialog();
                    },
                  );
                }
              },
            );
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => ProductPage(product: widget.product),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageComponent(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText(),
                      gameText(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            priceText(),
                            IconButton(
                              icon: Icon(
                                Icons.edit_outlined,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => EditProductPage(
                                        product: widget.product),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
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

  Padding imageComponent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          widget.product.image,
          height: MediaQuery.of(context).size.height * 0.11,
          width: MediaQuery.of(context).size.width * 0.34,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Padding titleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 4),
      child: Text(
        widget.product.title,
        overflow: TextOverflow.ellipsis,
        style: kListCardContentTextStyle,
      ),
    );
  }

  Text gameText() {
    return Text(
      parseEnumGame(widget.product.game),
      overflow: TextOverflow.ellipsis,
      style: kListCardContentTextStyle,
    );
  }

  RichText priceText() {
    return RichText(
      text: TextSpan(
        text: 'R\$',
        style: kListCardContentTextStyle,
        children: [
          TextSpan(
            text:
                '${NumberFormat.currency(locale: 'pt_BR').format(widget.product.price).substring(3)}',
            style: kListCardPriceTextStyle,
          ),
        ],
      ),
    );
  }
}

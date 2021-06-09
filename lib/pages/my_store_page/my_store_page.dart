import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/list_store_product_card.dart';
import 'package:gamecloth_frontend/controllers/user_controller.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:provider/provider.dart';

class MyStorePage extends StatefulWidget {
  const MyStorePage({Key? key}) : super(key: key);

  @override
  _MyStorePageState createState() => _MyStorePageState();
}

class _MyStorePageState extends State<MyStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MINHA LOJA', style: kAppTitle),
        centerTitle: true,
        backgroundColor: backgroundColor,
        brightness: Brightness.dark,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newProductPage');
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: accentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: FutureBuilder<List<Product>>(
          future: context.watch<UserController>().fetchUserStore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListStoreProductCard(
                      product: snapshot.data![index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                );
              } else {
                return Center(
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
                        'Seu carrinho está vazio, tente adicionar skins!',
                        style: kAppDescript_1,
                      ),
                    ],
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

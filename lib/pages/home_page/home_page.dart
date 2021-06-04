import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/bottom_navbar.dart';
import 'package:gamecloth_frontend/components/home_product_card.dart';
import 'package:gamecloth_frontend/controllers/product_controller.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String route = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Skins perfeitas',
                    style: kAppTitle,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'pra você',
                    style: kBottomTitleStyle,
                  ),
                ),
                FutureBuilder<List<Product?>>(
                  future: context.watch<ProductController>().fetchAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 18,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 0.87),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return HomeProductCard(snapshot: snapshot, index: index,);
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

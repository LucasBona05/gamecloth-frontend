import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/home_product_card.dart';
import 'package:gamecloth_frontend/controllers/product_controller.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/components/bottom_navbar.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {});
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          header: WaterDropHeader(waterDropColor: accentColor,),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  mainText(),
                  FutureBuilder<List<Product>>(
                    future:
                        context.watch<ProductController>().fetchAllProducts(),
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
                              return HomeProductCard(
                                product: snapshot.data![index],
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(accentColor),),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  Column mainText() {
    return Column(
      children: [
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
      ],
    );
  }
}

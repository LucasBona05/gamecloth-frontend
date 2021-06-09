import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamecloth_frontend/controllers/cart_controller.dart';

import 'package:gamecloth_frontend/controllers/product_controller.dart';
import 'package:gamecloth_frontend/controllers/user_controller.dart';
import 'package:gamecloth_frontend/pages/cart_page/cart_page.dart';
import 'package:gamecloth_frontend/pages/home_page/home_page.dart';
import 'package:gamecloth_frontend/pages/login_page/login_page.dart';
import 'package:gamecloth_frontend/pages/my_store_page/my_store_page.dart';
import 'package:gamecloth_frontend/pages/new_product_page/new_product_page.dart';
import 'package:gamecloth_frontend/pages/splash_page/splash_page.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black54, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(),
        ),
      ],
      child: MaterialApp(
        title: 'GameCloth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: 'Poppins',
        ),
        initialRoute: '/splashPage',
        routes: {
          '/splashPage': (context) => SplashPage(),
          '/loginPage': (context) => LoginPage(),
          '/homePage': (context) => HomePage(),
          '/myStorePage': (context) => MyStorePage(),
          '/cartPage': (context) => CartPage(),
          '/newProductPage': (context) => NewProductPage(),
        },
      ),
    );
  }
}

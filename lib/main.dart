import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/controllers/product_controller.dart';
import 'package:gamecloth_frontend/pages/home_page/home_page.dart';
import 'package:gamecloth_frontend/pages/login_page/login_page.dart';
import 'package:gamecloth_frontend/pages/splash_page/splash_page.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';
import 'package:provider/provider.dart';

void main() {
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
        )
      ],
      child: MaterialApp(
        title: 'GameCloth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: 'Poppins',
        ),
        initialRoute: '/homePage',
        routes: {
          '/splashPage': (context) => SplashPage(),
          '/loginPage': (context) => LoginPage(),
          '/homePage': (context) => HomePage(),
        },
      ),
    );
  }
}

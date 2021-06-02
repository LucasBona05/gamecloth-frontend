import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/pages/login_page/login_page.dart';
import 'package:gamecloth_frontend/pages/splash_page/splash_page.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}

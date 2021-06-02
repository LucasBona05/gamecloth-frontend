import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/style/animations/fade_animation.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';

class SplashPage extends StatefulWidget {
  static final String route = '/splashPage';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() async {
    await Future.delayed(new Duration(seconds: 4));
    Navigator.pushNamed(context, '/loginPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
              child: _textTitle(),
            ),
            FadeAnimation(
              child: _icon(),
            )
          ],
        ),
      ),
    );
  }

  Padding _icon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/AppLogo.png'),
    );
  }

  Padding _textTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'GAMECLOTH',
        style: kAppTitle,
      ),
    );
  }
}

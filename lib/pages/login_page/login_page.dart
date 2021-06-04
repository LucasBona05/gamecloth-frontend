import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/style/colors.dart';

class LoginPage extends StatefulWidget {
  static final String route = '/loginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Image.asset('assets/AppLogo.png'),
          ),
          Center(
            child: new Text(
              "GAMECLOTH",
              style: kAppTitle,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: new Text(
              "The simple way to",
              style: kAppDescript_1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: new Text(
              "find any skin!",
              style: kAppDescript_2,
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/homePage');
              },
              child: new Container(
                padding: EdgeInsets.fromLTRB(110, 0, 20, 0),
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: shadowButton,
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      "Acessar",
                      style: kButtonApp,
                    ),
                    new Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                "Don't have account?",
                style: kButtonApp,
              ),
              new Text(
                "  Sign Up",
                style: kTextRegister,
              ),
            ],
          )
        ],
      ),
    );
  }
}

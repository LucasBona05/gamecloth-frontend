import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/game_cloth_label_button.dart';
import 'package:gamecloth_frontend/components/simple_error_dialog.dart';
import 'package:gamecloth_frontend/controllers/user_controller.dart';

import '../../utils/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: Image.asset('assets/AppLogo.png'),
          ),
          Text(
            "GAMECLOTH",
            style: kAppTitle,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32.0, top: 24, bottom: 32),
            child: RichText(
              text: TextSpan(
                text: 'A maneira mais simples de\n',
                style: kAppDescript_1,
                children: [
                  TextSpan(
                    text: 'encontrar skins!',
                    style: kAppDescript_2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Center(
              child: GameClothLabelButton(
                width: 300,
                height: 60,
                label: 'Acessar',
                icon: Icons.arrow_forward,
                onTap: () async {
                  bool response = await UserController()
                      .signIn(username: 'lucas', password: 'lucas');
                  if (response) {
                    Navigator.pushNamed(context, '/homePage');
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleErrorDialog();
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

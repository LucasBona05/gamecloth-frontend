import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class HomePage extends StatefulWidget {
  static final String route = '/homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Text(
        "HomePage",
        style: kAppTitle,
      ),
    );
  }
}

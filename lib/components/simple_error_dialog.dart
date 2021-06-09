import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';

class SimpleErrorDialog extends StatelessWidget {
  const SimpleErrorDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: backgroundColor,
      title: Text(
        'Ocorreu um erro',
        style: TextStyle(color: primaryTextColor),
      ),
    );
  }
}
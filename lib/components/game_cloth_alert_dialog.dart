import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';

showGameClothAlertDialog(
    {required BuildContext context,
    required String dialogTitle,
    required String dialogContent,
    required String action,
    void Function()? onPressed}) {
  Widget cancelButton = TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Text('Cancelar'),
  );
  Widget actionButton = TextButton(
    onPressed: onPressed,
    child: Text(action),
  );
  AlertDialog alert = AlertDialog(
    title: Text(
      dialogTitle,
      style: TextStyle(color: primaryTextColor),
    ),
    content: Text(
      dialogContent,
      style: TextStyle(color: primaryTextColor),
    ),
    actions: [
      cancelButton,
      actionButton,
    ],
    backgroundColor: backgroundColor,
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';

class GameClothLabelButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String label;
  final IconData? icon;
  final void Function()? onTap;

  const GameClothLabelButton({
    Key? key,
    this.width,
    this.height,
    required this.label,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: new Container(
        padding: EdgeInsets.fromLTRB(110, 0, 20, 0),
        width: width,
        height: height,
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
              label,
              style: kButtonApp,
            ),
            new Icon(
              icon,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
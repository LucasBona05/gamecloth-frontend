import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';

class GameClothButton extends StatelessWidget {
  final double? height;
  final double? width;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? onPressed;

  const GameClothButton({this.height, this.width, required this.icon, this.iconColor, this.iconSize, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: accentColor,
              blurRadius: 7.5,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}

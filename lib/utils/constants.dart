import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';

const double kBottomNavbarIconSize = 40.0;

const kAppDescript_1 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: primaryTextColor,
  height: 1.7,
);

const kAppDescript_2 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w400,
  color: primaryTextColor,
  height: 1.7,
);

const kButtonApp = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: primaryTextColor,
);

const kTextRegister = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: accentColor,
);

const kAppTitle = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w600,
  color: primaryTextColor,
);

const kTextFormFieldLabelStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: accentColor,
);

const kBottomTitleStyle = TextStyle(
  fontSize: 36,
  color: primaryTextColor,
);

const kPriceLowerTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 12,
);

const kFrontPriceTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: accentColor);

const kPriceTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: primaryTextColor);

const kCardGameTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  color: descriptionCardColor,
  fontSize: 13,
);

const kCardTitleTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  color: secondaryTextColor,
  fontSize: 15,
);

const kProductGameTextStyle = TextStyle(
  fontSize: 30,
  fontFamily: 'Montserrat',
  color: descriptionCardColor,
);

const kListCardContentTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 13.0,
  color: Colors.black,
);

const kListCardPriceTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
  color: Colors.black,
);

const kProductPriceLabelTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 15,
  color: primaryTextColor,
);

const kCartFooterTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14.0,
  color: primaryTextColor,
);

const kCartFooterMoneyTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 34.0,
  color: primaryTextColor,
);

const kTextFormFieldTitleInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Insira o nome da skin',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kTextFormFieldImageInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Insira a url da imagem da skin',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kTextFormFieldMoneyInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Insira preço da skin',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

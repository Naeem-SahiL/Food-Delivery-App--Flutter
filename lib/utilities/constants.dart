import 'package:flutter/material.dart';

const kbackgroundColor = Color(0xFFF5F5F8);
const kOrnageColor = Color(0xFFFA4A0C);
const kunselectedColor = Color(0xFFADADAF);

ThemeData kAppTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
        color: Colors.black, fontFamily: 'SFProTextSemibold', fontSize: 18),
    elevation: 0.0,
  ),
);

const kNormalTextStyle = TextStyle(
  fontFamily: 'SFProTextSemibold',
  color: Colors.black,
  fontSize: 15
);
const kHeaderTextStyle = TextStyle(
  fontFamily: 'SFProRoundedBold',
  fontSize: 25,
  color: Colors.black,
  
  
);
const kItemLabelTextStyle = TextStyle(
  fontFamily: 'SFProRoundedSemiBold',
  fontSize: 22,
  color: Colors.black,
  
);
const kButtonLabelTextStyle = TextStyle(
  fontFamily: 'SFProRoundedSemiBold',
  fontSize: 22,
  color: kbackgroundColor,
  
);

const kItemPriceTextStyle = TextStyle(
  fontFamily: 'SFProRoundedBold',
  fontSize: 17,
  color: kOrnageColor,
);
const kGreyTextStyle = TextStyle(
  fontFamily: 'SFProRoundedBold',
  fontSize: 17,
  color: kunselectedColor,
);
const kNavitemTextStyle = TextStyle(
  fontFamily: 'SFProRoundedBold',
  fontSize: 17,
  color: kbackgroundColor,
);

const klinkTextStyle = TextStyle(
  fontFamily: 'SFProRoundedBold',
  fontSize: 15,
  color: kOrnageColor,
);

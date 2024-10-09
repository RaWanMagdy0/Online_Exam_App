import 'package:flutter/material.dart';

class MyTheme {
  static Color greyColor = Color(0xFF1D192B1F);
  static Color lightGreyColor = Color(0xFF535353);
  static Color redColor = Color(0xFFCC1010);
  static Color blackColor = Color(0xFF0F0F0F);
  static Color whiteColor = Color(0xFFFFFFFF);
  static const darkMainColor = Color(0xFF06004F);
  static const mainColor = Color(0xFF004182);
  static const blueColor = Color(0xFFDFE7F7);
  static const blueBaseColor = Color(0xFF02369C);


  static ThemeData LightTheme = ThemeData(
    textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: MyTheme.whiteColor,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: MyTheme.lightGreyColor,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: MyTheme.blackColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
  );
}

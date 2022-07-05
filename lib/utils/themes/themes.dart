import 'package:flutter/material.dart';

class Themes {
  final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0XFFc02268),
    canvasColor: Colors.black,
    brightness: Brightness.light,
    backgroundColor: Colors.white70,
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.grey.shade200,
    cardColor: Colors.grey.shade200,
    focusColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
      ),
      headline2: TextStyle(
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        color: Colors.grey.shade500,
      ),
    ),
    fontFamily: "Poppins",
  );

  final ThemeData darkTheme = ThemeData(
    primaryColor: Color(0XFFc02268),
    canvasColor: Colors.white,
    brightness: Brightness.dark,
    backgroundColor: Colors.black54,
    scaffoldBackgroundColor: Colors.black,
    shadowColor: Colors.black54,
    cardColor: Color(0XFF18191b),
    focusColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
      ),
      headline2: TextStyle(
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        color: Colors.grey.shade500,
      ),
    ),
    fontFamily: "Poppins",
  );
}

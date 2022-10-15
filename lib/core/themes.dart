import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  fontFamily: 'Kanit',
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    caption: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w200,
      fontSize: 12,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 25,
    ),
    elevation: 0,
  ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   elevation: 20,
  //   backgroundColor: HexColor('3d3d3d'),
  //   selectedItemColor: defaultColor,
  //   type: BottomNavigationBarType.fixed,
  //   unselectedItemColor: Colors.white,
  // ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  fontFamily: 'Kanit',
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    caption: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w100,
      fontSize: 13,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.teal,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    selectedItemColor: Colors.teal,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey[400],
    type: BottomNavigationBarType.fixed,
  ),
);

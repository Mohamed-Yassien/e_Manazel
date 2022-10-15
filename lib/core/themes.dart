import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w200,
      fontSize: 13,
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
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    elevation: 0,
  ),
);

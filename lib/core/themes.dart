import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color(0xffeaa504),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    bodyText2: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    caption: TextStyle(
      color: Colors.black87,
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
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    iconTheme: IconThemeData(
      color:Colors.black87,
      size: 24,
    ),
    elevation: 0,
  ),
);

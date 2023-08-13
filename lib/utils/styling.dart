import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  // scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Roboto',
  appBarTheme: const AppBarTheme(
    elevation: 3,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xFFF1F1F1),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    labelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),
);

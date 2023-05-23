import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFF010101),
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: const Color(0xFFF8F8F8),
  cardColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color:  Color(0xFFF8F8F8),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black
      )
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.black
        )
    ),
    //hintStyle: TextStyle(color: Colors.black),

  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.black.withOpacity(0.3),
    selectionHandleColor: Colors.black
  ),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF010101), fontFamily: "cairo"),
      bodyLarge: TextStyle(color: Color(0xFFBFBFBF), fontFamily: "cairo")),
);

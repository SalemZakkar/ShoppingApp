import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFFD6A03),
    primarySwatch: Colors.orange,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Color(0xFF5D5E65)),
        iconTheme: IconThemeData(color: Color(0xFF5D5E65)),
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Color(0xFF5D5E65))),
    fontFamily: 'cairo',
    cardColor: const Color(0xFFF7F7F7),
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.orange,
        selectionHandleColor: Colors.orange,
        selectionColor: Colors.orange.withOpacity(0.5)),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
      fillColor: const Color(0xFFF7F7F7),
      filled: true,
      //  hintText: "Email",
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Color(0xFF5D5E65)),
        headlineMedium: TextStyle(color: Color(0xFF5D5E65))));

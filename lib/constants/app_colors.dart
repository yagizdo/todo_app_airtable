import 'package:flutter/material.dart';

class AppTheme {
  final appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black45,
    appBarTheme: const AppBarTheme(
      color: Colors.black45,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black, backgroundColor: Colors.white),
    brightness: Brightness.dark,
  );
}

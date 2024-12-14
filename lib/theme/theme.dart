import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 38, 38, 38),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.yellow),
  scaffoldBackgroundColor: const Color.fromARGB(255, 38, 38, 38),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
    labelSmall: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10.10),
  ),
  dividerTheme: const DividerThemeData(color: Colors.white10),
);

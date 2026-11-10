import 'package:flutter/material.dart';

class AppTheme {
  static const navy = Color(0xFF14243A);
  static const gold = Color(0xFFC8A45D);
  static const surface = Color(0xFFF3F5F8);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: navy,
      primary: navy,
      secondary: gold,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: surface,
    appBarTheme: const AppBarTheme(
      backgroundColor: navy,
      foregroundColor: Colors.white,
      centerTitle: false,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: navy,
      brightness: Brightness.dark,
      secondary: gold,
    ),
    scaffoldBackgroundColor: const Color(0xFF101820),
  );
}

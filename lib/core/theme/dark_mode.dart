import 'package:flutter/material.dart';
import 'package:weather/core/theme/app_theme_extension.dart';

final ThemeData darkMode = ThemeData.dark().copyWith(
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 32, color: Colors.white),
    bodyMedium: TextStyle(
      fontSize: 28,
      color: Colors.white,
      letterSpacing: 0.3,
      fontWeight: FontWeight.w200,
    ),
    displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w200),
    labelSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: CircleBorder(),
    backgroundColor: const Color.fromARGB(90, 190, 243, 234),
    elevation: 0,
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppThemeExtension(
      scaffoldGradient: const LinearGradient(
        colors: [
          Color(0xFF35495e),
          Color.fromARGB(255, 48, 69, 90),
          Color.fromARGB(255, 41, 119, 139),
          Color(0xFF42b883),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  ],
);

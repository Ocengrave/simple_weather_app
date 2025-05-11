import 'package:flutter/material.dart';
import 'package:weather/core/theme/app_theme_extension.dart';

final ThemeData lightMode = ThemeData.light().copyWith(
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 48,
      color: Color.fromARGB(255, 0, 82, 72),
      fontWeight: FontWeight.w200,
    ),
    displayMedium: TextStyle(
      fontSize: 36,
      color: Color.fromARGB(255, 0, 82, 72),
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(fontSize: 32, color: Color.fromARGB(255, 0, 82, 72)),
    bodyMedium: TextStyle(
      fontSize: 28,
      color: Color.fromARGB(255, 0, 82, 72),
      letterSpacing: 0.3,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 46, 120, 128),
      fontWeight: FontWeight.w300,
    ),
  ),

  extensions: <ThemeExtension<dynamic>>[
    AppThemeExtension(
      scaffoldGradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 163, 243, 254),
          Color.fromARGB(255, 121, 212, 224),
          Color(0xFF00ACC1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.1, 0.6, 1.0],
      ),
    ),
  ],
);

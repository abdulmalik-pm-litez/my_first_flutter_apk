import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black, //Фон для Body

  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),

  //colorScheme - дефолт, приоритет Высокий
  //primaryColor - устаревший подход, приоритет Средний
  //primarySwatch - для простого использования, приоритет Низкий

  //dividerColor: Colors.pink, - этот метод не сработал, походу старый метод
  dividerTheme: const DividerThemeData(color: Colors.white24, thickness: 1),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),

  listTileTheme: const ListTileThemeData(iconColor: Colors.white),

  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),

    labelSmall: TextStyle(
      color: Colors.white.withValues(alpha: 0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
);

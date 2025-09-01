import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Theme/app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.black, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
      headlineSmall:TextStyle(
        color: Colors.black,
        fontFamily: 'Inter',
        fontSize: 24,
        fontWeight: FontWeight.w600,

      ) ,
      titleLarge:TextStyle(
          color: Colors.black,
        fontFamily: 'Inter',
        fontSize: 28,
        fontWeight: FontWeight.w600,

      ) ,
      titleMedium:TextStyle(
          color: Colors.black,
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w600,

      ) ,
      titleSmall:TextStyle(
          color: Colors.black,
        fontFamily: 'Inter',
        fontSize: 18,
        fontWeight: FontWeight.w600,

      ) ,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
     selectedItemColor: Colors.white,
     selectedIconTheme: IconThemeData(
      color: Colors.white
     ),
     unselectedItemColor: Colors.white,
     unselectedIconTheme: IconThemeData(
      color: Colors.white
     )
    ),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.DarkBackgroundColor,
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.white, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
    headlineSmall:TextStyle(
        color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 24,
        fontWeight: FontWeight.w600,

      ) ,
      titleLarge:TextStyle(
          color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 28,
        fontWeight: FontWeight.w600,

      ) ,
      titleMedium:TextStyle(
          color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w600,

      ) ,
      titleSmall:TextStyle(
          color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 18,
        fontWeight: FontWeight.w600,

      ) ,
     
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
    ),
  );
}

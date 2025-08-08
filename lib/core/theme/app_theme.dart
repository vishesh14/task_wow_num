
import 'package:flutter/material.dart';


class AppColors {
  static const primary = Color(0xFF6C63FF);
  static const background = Color(0xFFF7F7FB);
  static const accent = Color(0xFFFF6584);
  static const success = Color(0xFF2ECBAA);
  static const textPrimary = Color(0xFF1F1F39);
  static const textColor= Color(0xFFFFFFFF);
}

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.textColor, centerTitle: true),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
  ),
);

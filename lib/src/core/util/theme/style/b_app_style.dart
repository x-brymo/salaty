import 'package:flutter/material.dart';

import '../handdler_color.dart';
import 'c_app_color.dart';

class AppStyle {
  final int themeIndex;

  AppStyle({this.themeIndex = 0});

  ThemeData get currentTheme {
    if (themeIndex >= 0 && themeIndex < AppColor.availableColorSchemes.length) {
      return ThemeData(
        fontFamily: 'Uthman',
        useMaterial3: true,
        primarySwatch: getMaterialColor(),
        colorScheme: AppColor.availableColorSchemes[themeIndex],
      );
    } else {
      // Return a default theme or any fallback behavior if the index is out of range.
      return ThemeData(
        useMaterial3: true,
        colorScheme: AppColor.availableColorSchemes[0],
      );
    }
  }
}

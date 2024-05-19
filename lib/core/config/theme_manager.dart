import 'package:flutter/material.dart';

class AppThemeManager {
  static ThemeData themeStyle = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Colors.blue,
        size: 25
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
        size: 22
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.grey,
        size: 25
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.blue
      )
    ),
  );
}
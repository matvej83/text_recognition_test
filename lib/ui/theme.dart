import 'package:flutter/material.dart';

mixin AppTheme {
  static ThemeData mainTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 24.0,
        color: Colors.black,
      ),
      unselectedIconTheme: IconThemeData(
        size: 24.0,
        color: Colors.black12,
      ),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black12,
      selectedLabelStyle: TextStyle(fontSize: 14),
      unselectedLabelStyle: TextStyle(fontSize: 14),
    ),
  );
}

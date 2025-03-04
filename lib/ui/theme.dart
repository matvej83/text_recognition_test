import 'package:flutter/material.dart';

mixin AppTheme {
  static ThemeData mainTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
    ),
  );
}

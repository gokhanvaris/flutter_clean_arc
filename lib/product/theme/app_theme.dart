import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData _lightTheme = ThemeData(
    fontFamily: 'poppins',
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff284297),
      surface: Colors.white,
      secondary: Colors.black,
      shadow: const Color(0xffAAAAAA),
      onSecondary: Colors.white,
      tertiary: Colors.white,
    ),
  );

  final ThemeData _darkTheme = ThemeData(
    fontFamily: 'poppins',
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff284297),
      surface: const Color(0xff292929),
      secondary: Colors.white,
      shadow: const Color(0xffAAAAAA),
      onSecondary: Colors.white.withOpacity(0.8),
      tertiary: Colors.white,
    ),
  );

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;
}

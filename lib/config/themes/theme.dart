import 'package:flutter/material.dart';

import '../../domain/extensions/hex_color.dart';

abstract class AppTheme {
  static ThemeData get(context) {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 24, 39, 50),
      primarySwatch: Colors.blue,
      inputDecorationTheme: _getInputDecorationTheme(context),
    );
  }

  static InputDecorationTheme _getInputDecorationTheme(BuildContext context) {
    return InputDecorationTheme(
      fillColor: const Color.fromARGB(230, 53, 81, 107),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 42, 50, 61),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 18, 107, 176),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      contentPadding: const EdgeInsets.all(10.00),
      hoverColor: Colors.transparent,
    );
  }
}

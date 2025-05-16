import 'package:flutter/material.dart';

// Styling & Theming
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

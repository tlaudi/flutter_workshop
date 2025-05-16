import 'package:flutter/material.dart';
import 'styles.dart';
import 'widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workshop',
      // Styling & Theming
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold gives us a basic material design layout structure
    // Also gives us access to the AppBar and SnackBar used in widgets.dart
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Workshop')),
      // LayoutBuilder allows us to build different layouts based on the screen size
      // This is useful for responsive design
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const WideLayout();
          } else {
            return const NormalLayout();
          }
        },
      ),
    );
  }
}
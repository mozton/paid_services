import 'package:flutter/material.dart';

class AppTheme {
  // Constructor que acepta el valor de isDarkmode
  AppTheme({required this.isDarkmode});

  final bool isDarkmode;

  // Método para obtener el ThemeData dependiendo del modo
  ThemeData get themeData {
    return isDarkmode ? dark() : light();
  }

  // Tema claro
  static ThemeData light() {
    return ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        appBarTheme:
            const AppBarTheme(color: Color.fromARGB(255, 54, 164, 253)),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // General text
          bodyMedium: TextStyle(color: Colors.black), // Smaller text
          titleLarge: TextStyle(color: Colors.red), // Headlines
          // Otros ajustes del tema claro
        ));
  }

  // Tema oscuro
  static ThemeData dark() {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(color: Colors.black),
      textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black), // General text
          bodyMedium: TextStyle(color: Colors.black), // Smaller text
          titleLarge: TextStyle(color: Colors.red), // Headlines)
          
      ),
  
      // Otros ajustes del tema oscuro
    );
  }
}

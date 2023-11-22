import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 = const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 101, 0, 110),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 101, 0, 110),
    onSecondary: Color.fromARGB(255, 101, 0, 110),
    error: Color.fromARGB(255, 197, 23, 11),
    onError: Color.fromARGB(255, 228, 4, 4),
    background: Color.fromARGB(255, 123, 96, 139),
    onBackground: Color.fromARGB(255, 123, 96, 139),
    onSurface: Color.fromARGB(255, 78, 20, 83),
    surface: Color.fromARGB(255, 234, 225, 235));
CardTheme cardTheme1 = const CardTheme(color: Color.fromARGB(192, 71, 22, 65));
TextTheme textTheme1 = const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme1,
          appBarTheme: AppBarTheme(
              backgroundColor: colorScheme1.onPrimaryContainer,
              foregroundColor: colorScheme1.primaryContainer),
          cardTheme: CardTheme(
            color: colorScheme1.onPrimaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                bodyMedium: TextStyle(),
              )),
      home: MainPage(),
    ),
  );
}

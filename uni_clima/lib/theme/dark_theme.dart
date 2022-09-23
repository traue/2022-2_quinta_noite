import 'package:flutter/material.dart';


ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[800],
    appBarTheme: AppBarTheme(color: Colors.blueGrey[700]),
    textTheme: const TextTheme(
      headline3: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
      headline4: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)
    )
  );
}
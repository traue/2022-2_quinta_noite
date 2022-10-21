import 'package:flutter/material.dart';
import 'package:todo_list/screens/home.dart';
import 'package:todo_list/theme/dark_theme.dart';
import 'package:todo_list/theme/light_theme.dart';

void main() {
  runApp(MaterialApp(
    title: 'ToDo List',
    debugShowCheckedModeBanner: false,
    home: const Home(),
    themeMode: ThemeMode.system,
    theme: lightTheme(),
    darkTheme: darkTheme(),
  ));
}
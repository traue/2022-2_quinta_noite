import 'package:flutter/material.dart';
import 'package:uni_zap/screens/home.dart';
import 'package:uni_zap/screens/login_screen.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const LoginScreen(),
    '/home': (context) => const Home(),
  };
}

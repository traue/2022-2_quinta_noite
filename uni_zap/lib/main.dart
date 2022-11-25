import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uni_zap/navigation/navigate.dart';
import 'package:uni_zap/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const UniZap());
}

class UniZap extends StatelessWidget {
  const UniZap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      initialRoute: '/',
      routes: Navigate.routes,
    );
  }
}

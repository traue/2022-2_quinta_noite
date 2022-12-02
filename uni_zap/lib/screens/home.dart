import 'package:uni_zap/service/firebase_service.dart';
import 'package:uni_zap/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
              onPressed: () async {
                FirebaseService service = FirebaseService();
                await service.signOutFromGoogle().then((value) =>
                    Navigator.pushReplacementNamed(
                        context, Constants.signInNavigate));
              },
            )
          ],
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.blue),
          title: const Text("Home"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
              radius: 70,
            ),
            const SizedBox(height: 20),
            Text(user!.displayName!),
            Text(user!.email!),
          ],
        )));
  }
}

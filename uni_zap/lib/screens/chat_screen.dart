import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uni_zap/utils/constants.dart';
import 'package:uni_zap/widgets/message_composer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isLoading = false;
  User? user = FirebaseAuth.instance.currentUser;

  void sendMessage({String? message, XFile? image}) async {
    Map<String, dynamic> data = {
      'uid': user!.uid,
      'displayName': user!.displayName,
      'photoUrl': user!.photoURL,
      'time': Timestamp.now()
    };

    if (message != null) {
      data['message'] = message;
    }

    if (image != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(user!.uid + DateTime.now().microsecondsSinceEpoch.toString())
          .putFile(File(image.path));

      setState(() {
        _isLoading = true;
      });

      final TaskSnapshot downloadUrl = (await task);
      final String url = await downloadUrl.ref.getDownloadURL();

      data['imgUrl'] = url;

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    //paramos aqui
  }
}

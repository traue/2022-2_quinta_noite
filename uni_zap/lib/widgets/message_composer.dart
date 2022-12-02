import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uni_zap/utils/constants.dart';
import 'dart:io';

class MessageComposer extends StatefulWidget {
  const MessageComposer({Key? key, required this.sendMessage})
      : super(key: key);

  final Function({String message, File image}) sendMessage;

  @override
  State<MessageComposer> createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  bool _isComposing = false;
  final TextEditingController _controller = TextEditingController();
  late XFile _img;

  _imgFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _img = photo!;
      _sendImg();
    });
  }

  _imgFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _img = image!;
      _sendImg();
    });
  }

  void _showPicker(contex) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text(Constants.galleryText),
                onTap: () {
                  _imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera_rounded),
                title: const Text(Constants.camaraText),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.clear, color: Colors.red),
                title: const Text(
                  Constants.cancelText,
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
        });
  }

  void _sendImg() {
    if (_img == null) return;
    widget.sendMessage(image: File(_img.path));
  }

  void _clearMessageField() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                _showPicker(context);
              },
              icon: const Icon(Icons.photo_camera_outlined)),
          Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration.collapsed(hintText: Constants.sendMessageText),
                onChanged: (value) {
                  setState(() {
                    _isComposing = value.isNotEmpty;
                  });
                },
                onSubmitted: (value) {
                  widget.sendMessage(message: _controller.text);
                  _clearMessageField();
                },
              )
          ),
          IconButton(
              onPressed: _isComposing ? () {
                widget.sendMessage(message: _controller.text);
                _clearMessageField();
              } : null,
              icon: const Icon(Icons.send_rounded),
              color: _isComposing ? Constants.kDarkBlueColor : Constants.kGreyColor,
          )
        ],
      ),
    );
  }
}

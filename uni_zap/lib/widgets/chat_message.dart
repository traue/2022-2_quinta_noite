import 'package:flutter/material.dart';
import 'package:uni_zap/utils/constants.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key, required this.data, required this.messageFromSelf})
      : super(key: key);

  final Map<String, dynamic> data;
  final bool messageFromSelf;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:
              messageFromSelf ? Constants.kLighGreen : Constants.kDarkBlueColor,
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          !messageFromSelf
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['photoUrl']),
                  ),
                )
              : Container(),
          Expanded(
              child: Column(
            crossAxisAlignment: messageFromSelf
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                data['displayName'],
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              data['imgUrl'] != null
                  ? Image.network(data['imgUrl'], width: 190)
                  : Text(
                      data['message'],
                      textAlign:
                          messageFromSelf ? TextAlign.end : TextAlign.start,
                      style: const TextStyle(fontSize: 20),
                    )
            ],
          )),
          messageFromSelf
              ? Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['photoUrl']),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

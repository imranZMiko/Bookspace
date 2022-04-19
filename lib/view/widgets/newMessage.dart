import 'package:bookspace/models/conversation.dart';
import 'package:bookspace/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key, required this.conversation}) : super(key: key);

  final Conversation conversation;

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    await FirebaseFirestore.instance
        .collection('inboxes')
        .doc(widget.conversation.getConversationID())
        .collection('chat')
        .add({
      'message': _enteredMessage,
      'createdAt': Timestamp.now(),
      'sender_email': Provider.of<UserProvider>(context, listen: false)
          .currentUser
          .getEmail(),
      'receiver_email': widget.conversation.getReceiverEmail(),
      'sender_image': Provider.of<UserProvider>(context, listen: false)
          .currentUser
          .getProfilePictureUrl(),
      'sender_name': Provider.of<UserProvider>(context, listen: false)
          .currentUser
          .getName(),
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Send a Message...",
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.send,
            ),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          )
        ],
      ),
    );
  }
}

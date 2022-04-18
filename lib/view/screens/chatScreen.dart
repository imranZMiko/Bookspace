import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const String routeName = '/chatScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        elevation: 0,
        toolbarHeight: Constants.toolbarHeight,
      ),
    );
  }
}

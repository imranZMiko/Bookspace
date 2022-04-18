import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/view/screens/chatScreen.dart';
import 'package:bookspace/view/widgets/profileAvatar.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        leading: const ProfileAvatar(
          size: 25,
        ),
        title: const Text("User name"),
        subtitle: const Text("Last text"),
        onTap: () {
          CustomNavigator.pushWithoutAnimation(context, ChatScreen());
        },
      ),
    );
  }
}

import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/models/conversation.dart';
import 'package:bookspace/providers/userProvider.dart';
import 'package:bookspace/view/screens/chatScreen.dart';
import 'package:bookspace/view/widgets/profileAvatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookspace/models/user.dart' as bookspace_user;

class ConversationTile extends StatelessWidget {
  const ConversationTile({Key? key, required this.convID}) : super(key: key);

  final String convID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future:
          FirebaseFirestore.instance.collection("inboxes").doc(convID).get(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        final senderEmail = snapshot.data!.data()!['sender_email'];
        final receiverEmail = snapshot.data!.data()!['receiver_email'];

        final otherEmail = (senderEmail ==
                Provider.of<UserProvider>(context, listen: false)
                    .currentUser
                    .getEmail())
            ? receiverEmail
            : senderEmail;

        return FutureBuilder<bookspace_user.User>(
          future: Provider.of<UserProvider>(context, listen: false)
              .userByEmail(otherEmail),
          builder: (_, userSnapshot) {
            if (!userSnapshot.hasData) {
              return Container();
            }

            String senderName;
            String receiverName;

            if (senderEmail ==
                Provider.of<UserProvider>(context, listen: false)
                    .currentUser
                    .getEmail()) {
              senderName = Provider.of<UserProvider>(context, listen: false)
                  .currentUser
                  .getName();
              receiverName = userSnapshot.data!.getName();
            } else {
              senderName = userSnapshot.data!.getName();
              receiverName = Provider.of<UserProvider>(context, listen: false)
                  .currentUser
                  .getName();
            }



            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(

                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                leading: ProfileAvatar(
                  size: 25,
                  img: NetworkImage(userSnapshot.data!.getProfilePictureUrl()),
                ),
                title: Text(userSnapshot.data!.getName()),
                onTap: () async {
                  CustomNavigator.pushWithoutAnimation(
                      context,
                      ChatScreen(
                        conversation: Conversation(
                            conversationID: convID,
                            senderEmail: senderEmail,
                            receiverEmail: receiverEmail,
                            senderName: senderName,
                            receiverName: receiverName),
                      ),);
                },
              ),
            );
          },
        );
      },
    );
  }
}

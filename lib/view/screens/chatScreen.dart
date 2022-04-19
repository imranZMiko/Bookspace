import 'package:bookspace/models/conversation.dart';
import 'package:bookspace/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../widgets/messageBubble.dart';
import '../widgets/newMessage.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.conversation}) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    print(conversation.getConversationID());
    return Scaffold(
      appBar: AppBar(
        title: Text(conversation.getReceiverName()),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('inboxes')
                  .doc(conversation.getConversationID())
                  .collection('chat')
                  .orderBy(
                    'createdAt',
                    descending: true,
                  )
                  .snapshots(),
              builder: (ctx, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!chatSnapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final chatDocs = chatSnapshot.data!.docs..removeLast();
                final userData =
                    Provider.of<UserProvider>(context, listen: false);

                if (chatDocs.isEmpty) {
                  return const Center(child: Text("Please start texting"));
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) => MessageBubble(
                      message: chatDocs[index]['message'],
                      userImage: chatDocs[index]['sender_image'],
                      userName: chatDocs[index]['sender_name'],
                      isMe: chatDocs[index]['sender_email'] ==
                          userData.currentUser.getEmail()),
                );
              },
            ),
          ),
          NewMessage(
            conversation: conversation,
          ),
        ],
      ),
    );
  }
}

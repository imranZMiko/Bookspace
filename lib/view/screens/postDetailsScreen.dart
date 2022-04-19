import 'package:bookspace/constants/constants.dart';
import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/models/conversation.dart';
import 'package:bookspace/models/post.dart';
import 'package:bookspace/providers/conversationProvider.dart';
import 'package:bookspace/view/screens/chatScreen.dart';
import 'package:bookspace/view/widgets/contactButton.dart';
import 'package:bookspace/view/widgets/profileAvatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/listing.dart';
import '../../providers/userProvider.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({Key? key, required this.post}) : super(key: key);
  final Post post;

  static const String routeName = '/detailsScreen';

  @override
  Widget build(BuildContext context) {
    print(post.getPosterEmail());
    print(Provider.of<UserProvider>(context, listen: false).currentUser.getEmail());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(post.getBookName()),
        elevation: 0,
        toolbarHeight: Constants.toolbarHeight,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              if (post is Listing)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network((post as Listing).getImageUrl()),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 5, left: 18, right: 18),
                        child: Text(
                          post.getBookName(),
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                        child: Text(
                          post.getAuthorName(),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Text(
                          post.getGenre(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (post is Listing)
                    if ((post as Listing).getPrice() != -1)
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Text(
                          "৳${(post as Listing).getPrice()}",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Row(
                  children: [
                    ProfileAvatar(
                      size: 30,
                      img: NetworkImage(
                          Provider.of<UserProvider>(context, listen: false)
                              .currentUser
                              .getProfilePictureUrl()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Text(
                        Provider.of<UserProvider>(context, listen: false)
                            .currentUser
                            .getName(),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              if (post is Listing)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  child: Text((post as Listing).getCondition()),
                ),
              Text(
                post.getDescription(),
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if ( post.getPosterEmail() !=
                  Provider.of<UserProvider>(context, listen: false)
                      .currentUser
                      .getEmail() )
                Center(
                  child: FutureBuilder<
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
                    future: Provider.of<ConversationProvider>(context,
                            listen: false)
                        .ifConversationExists(
                            Provider.of<UserProvider>(context, listen: false)
                                .currentUser
                                .getEmail(),
                            post.getPosterEmail()),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.data!.isEmpty) {
                        return ContactButton(
                          text: "Contact",
                          onPressed: () async {
                            final myEmail = Provider.of<UserProvider>(context,
                                    listen: false)
                                .currentUser
                                .getEmail();
                            final myName = Provider.of<UserProvider>(context,
                                    listen: false)
                                .currentUser
                                .getName();
                            final ref = await FirebaseFirestore.instance
                                .collection('inboxes')
                                .add({
                              'receiver_email': post.getPosterEmail(),
                              'sender_email': myEmail,
                            });

                            await FirebaseFirestore.instance
                                .collection('inboxes')
                                .doc(ref.id)
                                .collection('chat')
                                .add({
                              'message': "Initial message",
                              'createdAt': Timestamp.now(),
                              'sender_email': "admin",
                              'receiver_email': "admin",
                            });

                            final receiver = await Provider.of<UserProvider>(
                                    context,
                                    listen: false)
                                .userByEmail(post.getPosterEmail());

                            CustomNavigator.pushWithoutAnimation(
                              context,
                              ChatScreen(
                                conversation: Conversation(
                                  conversationID: ref.id,
                                  senderEmail: myEmail,
                                  receiverEmail: post.getPosterEmail(),
                                  senderName: myName,
                                  receiverName: receiver.getName(),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        final convID = snapshot.data![0].id;

                        return ContactButton(
                          text: "Go to Conversation",
                          onPressed: () async {
                            final myEmail = Provider.of<UserProvider>(context,
                                    listen: false)
                                .currentUser
                                .getEmail();
                            final myName = Provider.of<UserProvider>(context,
                                    listen: false)
                                .currentUser
                                .getName();

                            final receiver = await Provider.of<UserProvider>(
                                    context,
                                    listen: false)
                                .userByEmail(post.getPosterEmail());

                            CustomNavigator.pushWithoutAnimation(
                              context,
                              ChatScreen(
                                conversation: Conversation(
                                  conversationID: convID,
                                  senderEmail: myEmail,
                                  receiverEmail: post.getPosterEmail(),
                                  senderName: myName,
                                  receiverName: receiver.getName(),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

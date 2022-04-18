import 'package:bookspace/constants/constants.dart';
import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/models/post.dart';
import 'package:bookspace/view/screens/chatScreen.dart';
import 'package:bookspace/view/widgets/authButton.dart';
import 'package:bookspace/view/widgets/contactButton.dart';
import 'package:bookspace/view/widgets/profileAvatar.dart';
import 'package:flutter/material.dart';

import '../../models/listing.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({Key? key, required this.post}) : super(key: key);
  final Post post;

  static const String routeName = '/detailsScreen';

  @override
  Widget build(BuildContext context) {
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/splash_background.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Text(
                  post.getBookName(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2, bottom: 5),
                child: Text(
                  post.getAuthorName(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2, bottom: 20),
                child: Text(
                  post.getGenre(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Row(
                  children: const [
                    ProfileAvatar(
                      size: 30,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Text("John Doe"),
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
              Center(
                child: ContactButton(
                    text: "Contact",
                    onPressed: () {
                      CustomNavigator.pushWithoutAnimation(
                          context, const ChatScreen());
                    }),
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

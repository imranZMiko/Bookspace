import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/models/listing.dart';
import 'package:bookspace/models/post.dart';
import 'package:bookspace/view/screens/postDetailsScreen.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
      child: Material(
        child: InkWell(
          onTap: () {
            CustomNavigator.pushWithoutAnimation(
                context, PostDetailsScreen(post: post));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/splash_background.jpg'),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 5, left: 18, right: 18),
                  child: Text(
                    'Dummy Book',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: Text(
                    'Dummy Author',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    'Dummy Genre',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

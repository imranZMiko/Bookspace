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
                if (post is Listing)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network((post as Listing).getImageUrl()),
                    ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          child: Text(
                            post.getAuthorName(),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

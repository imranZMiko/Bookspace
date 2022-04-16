import 'package:bookspace/models/listing.dart';
import 'package:bookspace/models/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/splash_background.jpg'),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Dummy Book',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Dummy Author',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Dummy Genre',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}

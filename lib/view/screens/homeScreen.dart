import 'package:bookspace/constants/constants.dart';
import 'package:bookspace/models/listing.dart';
import 'package:bookspace/models/post.dart';
import 'package:bookspace/providers/catalogueProvider.dart';
import 'package:bookspace/view/widgets/newPostButton.dart';
import 'package:bookspace/view/widgets/postCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookspace"),
        elevation: 0,
        toolbarHeight: Constants.toolbarHeight,
      ),
      body: Consumer<CatalogueProvider>(
        builder: (_, catalog, __) => RefreshIndicator(
          onRefresh: () async {
            await catalog.getRecentPosts();
          },
          child: FutureBuilder(
            future: catalog.getRecentPosts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return const CircularProgressIndicator();
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: catalog.recentPosts.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    post: catalog.recentPosts[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

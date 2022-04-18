import 'package:bookspace/constants/constants.dart';
import 'package:bookspace/models/listing.dart';
import 'package:bookspace/models/post.dart';
import 'package:bookspace/providers/catalogueProvider.dart';
import 'package:bookspace/providers/inboxProvider.dart';
import 'package:bookspace/view/widgets/conversationTile.dart';
import 'package:bookspace/view/widgets/newPostButton.dart';
import 'package:bookspace/view/widgets/postCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);
  static const String routeName = '/inboxScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
        elevation: 0,
        toolbarHeight: Constants.toolbarHeight,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Consumer<InboxProvider>(
              builder: (_, inbox, __) => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: inbox.convList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ConversationTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

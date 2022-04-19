import 'package:bookspace/constants/constants.dart';
import 'package:bookspace/providers/inboxProvider.dart';
import 'package:bookspace/view/widgets/conversationTile.dart';
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
            FutureBuilder(
              future:
                  Provider.of<InboxProvider>(context, listen: false).getInbox(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return RefreshIndicator(
                    onRefresh: () async {
                      Provider.of<InboxProvider>(context, listen: false)
                          .getInbox();
                    },
                    child: Consumer<InboxProvider>(
                      builder: (_, inbox, __) => ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: inbox.convList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ConversationTile(
                              convID: inbox.convList[index]);
                        },
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

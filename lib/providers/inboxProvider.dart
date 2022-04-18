import 'package:bookspace/models/conversation.dart';
import 'package:bookspace/models/inbox.dart';
import 'package:flutter/material.dart';

class InboxProvider with ChangeNotifier{
  final Inbox _inbox = Inbox(
    conversationList: [1, 2, 3, 4, 5,6,7,8,9,10],
    email: "dummy@dummy.com"
  );

  Inbox get inbox {
    return _inbox;
  }

  List<int> get convList {
    return [..._inbox.getConversationList()];
  }
}
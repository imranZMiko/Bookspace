import 'package:bookspace/models/inbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InboxProvider with ChangeNotifier {
  Inbox _inbox = Inbox(
    conversationList: [],
  );

  Future<void> getInbox() async {
    final auth = FirebaseAuth.instance;

    final email = auth.currentUser!.email;

    List<String> list = [];

    final ref = await FirebaseFirestore.instance
        .collection("inboxes").where('sender_email', isEqualTo: email).get();

    for (var element in ref.docs) {
      list.add(element.id);
    }

    final ref2 = await FirebaseFirestore.instance
        .collection("inboxes").where('receiver_email', isEqualTo: email).get();

    for (var element in ref2.docs) {
      list.add(element.id);
    }

    _inbox = Inbox(conversationList: list);

    print(convList);

    notifyListeners();
  }

  List<String> get convList {
    return [..._inbox.getConversationList()];
  }
}

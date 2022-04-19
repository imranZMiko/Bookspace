import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConversationProvider with ChangeNotifier {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> ifConversationExists(String sender, String receiver) async {
    final ref = await FirebaseFirestore.instance
        .collection("inboxes").where('sender_email', isEqualTo: sender).where('receiver_email', isEqualTo: receiver).get();

    return ref.docs;
  }
}

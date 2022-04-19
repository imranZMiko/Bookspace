import 'package:bookspace/models/user.dart' as bookspace_user;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProvider with ChangeNotifier {
  late bookspace_user.User _currentUser;

  Future<bookspace_user.User> currentUser() async {
    final user = FirebaseAuth.instance.currentUser;

    final ref = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();

    return bookspace_user.User(
        userID: user.uid,
        name: ref.data()!['username'],
        email: ref.data()!['email'],
        profilePictureUrl: ref.data()!['image_url']);
  }

  void updateProfileImage(){
    notifyListeners();
  }
}

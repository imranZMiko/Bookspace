import 'package:bookspace/models/user.dart' as bookspace_user;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProvider with ChangeNotifier {
  late bookspace_user.User _currentUser;

  bookspace_user.User get currentUser{
    return _currentUser;
  }

  Future<bookspace_user.User> userByEmail(String email) async {
    final ref = await FirebaseFirestore.instance
        .collection("users").where('email', isEqualTo: email).get();

    return bookspace_user.User(
        userID: ref.docs[0].id,
        name: ref.docs[0].data()['username'],
        email: ref.docs[0].data()['email'],
        profilePictureUrl: ref.docs[0].data()['']);
  }

  Future<void> getCurrentUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    final ref = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();

    _currentUser = bookspace_user.User(
        userID: user.uid,
        name: ref.data()!['username'],
        email: ref.data()!['email'],
        profilePictureUrl: ref.data()!['image_url']);
  }

  Future<void> updateProfileImage() async {
    await getCurrentUserData();
    notifyListeners();
  }
}

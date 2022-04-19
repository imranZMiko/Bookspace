import 'package:bookspace/models/catalogue.dart';
import 'package:bookspace/models/post.dart';
import 'package:bookspace/models/request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/listing.dart';

class CatalogueProvider with ChangeNotifier {
  Catalogue _recentCatalogue = Catalogue(postList: []);
  Catalogue _searchCatalogue = Catalogue(postList: []);
  Catalogue _myCatalogue = Catalogue(postList: []);

  List<Post> get recentPosts {
    return _recentCatalogue.getPostList();
  }

  List<Post> get searchPosts {
    return _searchCatalogue.getPostList();
  }
  
  List<Post> get myPosts {
    return _myCatalogue.getPostList();
  }

  Future<void> getSearchPosts(String query) async {
    final List<Post> list = [];
    if (query == "") {
      _searchCatalogue = Catalogue(postList: list);
      return;
    }

    final ref = await FirebaseFirestore.instance.collection("posts").get();

    for (var element in ref.docs) {
      if ((element.data()["name"] as String)
              .contains(RegExp(query, caseSensitive: false)) ||
          (element.data()["author"] as String)
              .contains(RegExp(query, caseSensitive: false)) ||
          (element.data()["genre"] as String)
              .contains(RegExp(query, caseSensitive: false))) {
        if (element.data()["type"] == "Request") {
          list.add(
            Request(
              requestID: element.id,
              bookName: element.data()["name"],
              authorName: element.data()["author"],
              genre: element.data()["genre"],
              posterEmail: element.data()["email"],
              description: element.data()["description"],
            ),
          );
        } else {
          list.add(
            Listing(
              listingID: element.id,
              bookName: element.data()["name"],
              authorName: element.data()["author"],
              genre: element.data()["genre"],
              posterEmail: element.data()["email"],
              description: element.data()["author"],
              price: element.data()["price"],
              condition: element.data()["condition"],
              imageUrl: element.data()["image"],
            ),
          );
        }
      }
    }
    _searchCatalogue = Catalogue(postList: list);

    notifyListeners();
  }

  Future<void> getRecentPosts() async {
    final List<Post> list = [];

    final ref = await FirebaseFirestore.instance
        .collection("posts")
        .limit(30)
        .orderBy("createdAt", descending: true)
        .get();

    for (var element in ref.docs) {
      if (element.data()["type"] == "Request") {
        list.add(
          Request(
            requestID: element.id,
            bookName: element.data()["name"],
            authorName: element.data()["author"],
            genre: element.data()["genre"],
            posterEmail: element.data()["email"],
            description: element.data()["description"],
          ),
        );
      } else {
        list.add(
          Listing(
            listingID: element.id,
            bookName: element.data()["name"],
            authorName: element.data()["author"],
            genre: element.data()["genre"],
            posterEmail: element.data()["email"],
            description: element.data()["author"],
            price: element.data()["price"],
            condition: element.data()["condition"],
            imageUrl: element.data()["image"],
          ),
        );
      }
    }
    _recentCatalogue = Catalogue(postList: list);
  }

  Future<void> getMyPosts() async {
    final List<Post> list = [];

    final auth = FirebaseAuth.instance;

    final email = auth.currentUser!.email;

    final ref = await FirebaseFirestore.instance
        .collection("posts").where("email", isEqualTo: email)
        .get();

    for (var element in ref.docs) {
      if (element.data()["type"] == "Request") {
        list.add(
          Request(
            requestID: element.id,
            bookName: element.data()["name"],
            authorName: element.data()["author"],
            genre: element.data()["genre"],
            posterEmail: element.data()["email"],
            description: element.data()["description"],
          ),
        );
      } else {
        list.add(
          Listing(
            listingID: element.id,
            bookName: element.data()["name"],
            authorName: element.data()["author"],
            genre: element.data()["genre"],
            posterEmail: element.data()["email"],
            description: element.data()["author"],
            price: element.data()["price"],
            condition: element.data()["condition"],
            imageUrl: element.data()["image"],
          ),
        );
      }
    }
    _myCatalogue = Catalogue(postList: list);
  }
}

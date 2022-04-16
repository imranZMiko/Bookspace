import 'package:bookspace/models/post.dart';
import 'package:bookspace/models/request.dart';
import 'package:flutter/material.dart';
import '../models/listing.dart';

class CatalogueProvider with ChangeNotifier {
  final List<Post> _list = [
    Listing(
      authorName: "Dummy author",
      bookName: "Dummy book",
      condition: "Good",
      description: "A book",
      genre: "Fiction",
      imageUrl: "assets/splash_background.jpg",
      listingID: 1,
      posterEmail: "dummy@dummy.com",
      price: 420.69,
    ),
    Listing(
      authorName: "Dummy author",
      bookName: "Dummy book",
      condition: "Good",
      description: "A book",
      genre: "Fiction",
      imageUrl: "assets/splash_background.jpg",
      listingID: 1,
      posterEmail: "dummy@dummy.com",
      price: 420.69,
    ),
    Request(
      authorName: "Dummy author",
      bookName: "Dummy book",
      description: "A book",
      genre: "Fiction",
      requestID: 1,
      posterEmail: "dummy@dummy.com",
    ),
    Listing(
      authorName: "Dummy author",
      bookName: "Dummy book",
      condition: "Good",
      description: "A book",
      genre: "Fiction",
      imageUrl: "assets/splash_background.jpg",
      listingID: 1,
      posterEmail: "dummy@dummy.com",
      price: 420.69,
    ),
    Request(
      authorName: "Dummy author",
      bookName: "Dummy book",
      description: "A book",
      genre: "Fiction",
      requestID: 1,
      posterEmail: "dummy@dummy.com",
    ),
  ];

  List<Post> get catalogueList {
    return [..._list];
  }
}

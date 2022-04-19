import 'package:bookspace/models/post.dart';

class Listing extends Post {
  late String _listingID;
  late double _price;
  late String _condition;
  late String _imageUrl;

  Listing({
    required String listingID,
    required String bookName,
    required String authorName,
    required String genre,
    required String posterEmail,
    required String description,
    required double price,
    required String condition,
    required String imageUrl,
  }) {
    _listingID = listingID;
    setBookName(bookName);
    setAuthorName(authorName);
    setGenre(genre);
    setPosterEmail(posterEmail);
    setDescription(description);
    _price = price;
    _condition = condition;
    _imageUrl = imageUrl;
  }

  String getListingID() => _listingID;
  void setListingID(String listingID) {
    _listingID = listingID;
  }

  double getPrice() => _price;
  void setPrice(double price) {
    _price = price;
  }

  String getCondition() => _condition;
  void setCondition(String condition) {
    _condition = condition;
  }

  String getImageUrl() => _imageUrl;
  void setImageUrl(String imageUrl){
    _imageUrl = imageUrl;
  }
}

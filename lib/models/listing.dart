import 'package:bookspace/models/post.dart';

class Request extends Post{
  late int _listingID;
  late double _price;
  late String _condition;

  Request({required int listingID, required String bookName, required String authorName, required String genre, required String posterEmail, required String description, required double price, required String condition}) {
    _listingID = listingID;
    setBookName(bookName);
    setAuthorName(authorName);
    setGenre(genre);
    setPosterEmail(posterEmail);
    setDescription(description);
    _price = price;
    _condition = condition;
  }

  int getListingID() => _listingID;
  void setListingID(int listingID){
    _listingID = listingID;
  }

  double getPrice() => _price;
  void setPrice(double price){
    _price = price;
  }

  String getCondition() => _condition;
  void setCondition(String condition){
    _condition = condition;
  }
}
import 'package:bookspace/models/post.dart';

class Request extends Post{
  late int _requestID;

  Request({required requestID, required bookName, required authorName, required genre, required posterEmail, required description}){
    _requestID = requestID;
    setBookName(bookName);
    setAuthorName(authorName);
    setGenre(genre);
    setPosterEmail(posterEmail);
    setDescription(description);
  }

  int getRequestID() => _requestID;
  void setRequestID(int requestID){
    _requestID = requestID;
  }
}
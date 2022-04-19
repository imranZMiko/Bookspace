import 'package:bookspace/models/post.dart';

class Request extends Post{
  late String _requestID;

  Request({required requestID, required bookName, required authorName, required genre, required posterEmail, required description}){
    _requestID = requestID;
    setBookName(bookName);
    setAuthorName(authorName);
    setGenre(genre);
    setPosterEmail(posterEmail);
    setDescription(description);
  }

  String getRequestID() => _requestID;
  void setRequestID(String requestID){
    _requestID = requestID;
  }
}
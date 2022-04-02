abstract class Post{
  late String _bookName;
  late String _authorName;
  late String _genre;
  late String _posterEmail;
  late String _description;

  String getBookName() => _bookName;
  void setBookName(String bookName){
    _bookName = bookName;
  }

  String getAuthorName() => _authorName;
  void setAuthorName(String authorName){
    _authorName = authorName;
  }

  String getGenre() => _genre;
  void setGenre(String genre){
    _genre = genre;
  }

  String getPosterEmail() => _posterEmail;
  void setPosterEmail(String posterEmail){
    _posterEmail = posterEmail;
  }

  String getDescription() => _description;
  void setDescription(String description){
    _description = description;
  }
}
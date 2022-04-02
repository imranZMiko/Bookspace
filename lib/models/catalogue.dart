import 'package:bookspace/models/post.dart';

class Catalogue{
  List<Post> _postList = [];

  Catalogue({required List<Post> postList}){
    _postList = postList;
  }

  List<Post> getPostList() => _postList;
  void setPostList(List<Post> postList){
    _postList = postList;
  }
}
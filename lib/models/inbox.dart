class Inbox{
  late String _userEmail;
  late List<int> _conversationList;

  Inbox({required String email, required List<int> conversationList}){
    _userEmail = email;
    _conversationList = conversationList;
  }

  String getUserEmail() => _userEmail;
  void setUserEmail(String email){
    _userEmail = email;
  }

  List<int> getConversationList() => _conversationList;
  void setConversationList(List<int> conversationList){
    _conversationList = conversationList;
  }
}
class Inbox{
  late List<String> _conversationList;

  Inbox({required List<String> conversationList}){
    _conversationList = conversationList;
  }


  List<String> getConversationList() => _conversationList;
  void setConversationList(List<String> conversationList){
    _conversationList = conversationList;
  }
}
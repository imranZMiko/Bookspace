import 'package:bookspace/models/message.dart';

class Conversation{
  late int _conversationID;
  late List<Message> _messageList;

  Conversation({required int conversationID, required List<Message> messageList}){
    _conversationID = conversationID;
    _messageList = messageList;
  }

  int getConversationID() => _conversationID;
  void setConversationID(int conversationID){
    _conversationID = conversationID;
  }

  List<Message> getMessageList() => _messageList;
  void setMessageList(List<Message> messageList){
    _messageList = messageList;
  }
}
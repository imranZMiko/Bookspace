import 'package:bookspace/models/message.dart';

class Conversation{
  late int _conversationID;
  late String _recipientEmail;
  late List<Message> _messageList;

  Conversation({required int conversationID, required String recipientEmail, required List<Message> messageList}){
    _conversationID = conversationID;
    _recipientEmail = recipientEmail;
    _messageList = messageList;
  }

  int getConversationID() => _conversationID;
  void setConversationID(int conversationID){
    _conversationID = conversationID;
  }

  String getRecipientEmail() => _recipientEmail;
  void setRecipientEmail(String recipientEmail){
    _recipientEmail = recipientEmail;
  }

  List<Message> getMessageList() => _messageList;
  void setMessageList(List<Message> messageList){
    _messageList = messageList;
  }
}
class Conversation {
  late String _conversationID;
  late String _senderEmail;
  late String _senderName;
  late String _receiverName;
  late String _receiverEmail;

  Conversation(
      {required String conversationID,
      required String senderEmail,
      required String receiverEmail,
      required String senderName,
      required String receiverName}) {
    _conversationID = conversationID;
    _senderEmail = senderEmail;
    _receiverEmail = receiverEmail;
    _senderName = senderName;
    _receiverName = receiverName;
  }

  String getConversationID() => _conversationID;
  void setConversationID(String conversationID) {
    _conversationID = conversationID;
  }

  String getSenderEmail() => _senderEmail;
  void setSenderEmail(String senderEmail) {
    _senderEmail = senderEmail;
  }

  String getReceiverEmail() => _receiverEmail;
  void setReceiverEmail(String receiverEmail) {
    _receiverEmail = receiverEmail;
  }

  String getSenderName() => _senderName;
  void setSenderName(String senderName) {
    _senderName = senderName;
  }

  String getReceiverName() => _receiverName;
  void setReceiverName(String receiverName) {
    _receiverName = receiverName;
  }
}

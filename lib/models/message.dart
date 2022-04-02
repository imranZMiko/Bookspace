class Message {
  late String _senderEmail;
  late String _recipientEmail;
  late String _contents;

  Message(
      {required String sender, required String recipient, required String contents}) {
    _senderEmail = sender;
    _recipientEmail = recipient;
    _contents = contents;
  }

  String getSenderEmail() => _senderEmail;

  void setSenderEmail(String sender) {
    _senderEmail = sender;
  }

  String getRecipientEmail() => _recipientEmail;

  void setRecipientEmail(String recipient) {
    _recipientEmail = recipient;
  }

  String getContents() => _contents;
  void setContents(String contents){
    _contents = contents;
  }
}
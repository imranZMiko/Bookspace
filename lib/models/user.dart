class User{
  late String _name;
  late String _email;
  late String _profilePictureUrl;
  late String _userID;

  User({required String userID, required String name, required String email, required String profilePictureUrl}){
    _userID = userID;
    _name = name;
    _email = email;
    _profilePictureUrl = profilePictureUrl;
  }

  String getUserID() => _userID;
  void setUserID(String userID){
    _userID = userID;
  }

  String getName() => _name;
  void setName(String name) {
    _name = name;
  }

  String getEmail() => _email;
  void setEmail(String email) {
    _email = email;
  }

  String getProfilePictureUrl() => _profilePictureUrl;
  void setProfilePictureUrl(String profilePictureUrl) {
    _profilePictureUrl = profilePictureUrl;
  }
}
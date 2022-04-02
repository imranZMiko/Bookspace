class User{
  late String _name;
  late String _email;
  late String _profilePictureUrl;

  User({required String name, required String email, required String profilePictureUrl}){
    _name = name;
    _email = email;
    _profilePictureUrl = profilePictureUrl;
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
import 'package:bookspace/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier{
  late User _currentUser;
  late String _token;

  late DateTime _expiryDate;
}
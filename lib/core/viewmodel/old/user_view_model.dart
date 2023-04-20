import 'package:flutter/material.dart';
import 'package:helloworld/core/model/old/user_info.dart';

class UserViewModel extends ChangeNotifier{
  UserInfo? _user;

  UserInfo? get user => _user;

  set user(UserInfo? value) {
    _user = value;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'dart:async';

class UserModel extends ChangeNotifier {

  bool isLoading = false;

  void signUp(){

  }

  void signIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();

  }

  void recoverPassword(){

  }

  void isLoggedIn(){

  }

}
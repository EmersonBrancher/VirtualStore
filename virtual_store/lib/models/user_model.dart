import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class UserModel extends Model {

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
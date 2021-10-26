import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class UserModel extends ChangeNotifier {

  FirebaseAuth _auth = FirebaseAuth.instance;
  User? firebaserUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void signUp({required Map<String, dynamic> userData, required String password, required VoidCallback onSuccess, required VoidCallback onFailure}){
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
        email: userData["email"], 
        password: password
    ).then((firebaseReturn) async {
      firebaserUser = firebaseReturn.user as User;

      await _saveUserData(userData);
      onSuccess();

      isLoading = false;
      notifyListeners();
    }).catchError((e){
      onFailure();
      isLoading = false;
      notifyListeners();
    });

  }

  void signIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();

  }

  void signOut() async {
    await _auth.signOut();

    userData = Map();
    firebaserUser = null;

    notifyListeners();
  }

  void recoverPassword(){

  }

  bool isLoggedIn(){
    if (firebaserUser != null) {
      return true;
    }else{
      return false;
    }
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance.collection("user").doc(firebaserUser!.uid).set(userData);
  }

}
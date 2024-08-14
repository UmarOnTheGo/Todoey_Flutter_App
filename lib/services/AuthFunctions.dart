
// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


// ignore: non_constant_identifier_names
void Login(String email, String password) {
  try {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
// ignore: non_constant_identifier_names
void SignUp(String email, String password){
  try {
   FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  FirebaseFirestore.instance.collection('Data').doc(FirebaseAuth.instance.currentUser!.email);
}
// ignore: non_constant_identifier_names
void SignOut(){
  FirebaseAuth.instance.signOut();
}

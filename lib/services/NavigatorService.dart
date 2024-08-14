import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter_app/screens/home.dart';
import 'package:todoey_flutter_app/screens/loginPage.dart';

class NavigatorService extends StatelessWidget {
  const NavigatorService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return home();
          }
          else{
            return LoginPage();
          }
        }
      )
    );
  }
}

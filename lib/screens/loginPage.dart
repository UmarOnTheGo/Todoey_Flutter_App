// ignore: file_names
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:todoey_flutter_app/constants.dart';

import 'package:todoey_flutter_app/services/AuthFunctions.dart';
import 'package:todoey_flutter_app/services/NavigatorService.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Todoey',
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.black),
                  speed: const Duration(seconds: 1))
            ],
            isRepeatingAnimation: true,
            repeatForever: true,
            displayFullTextOnTap: true),
        const SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: TextField(
            controller: emailController,
            decoration: kInputTextDecoration.copyWith(hintText: 'Enter Email'),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: TextField(
            controller: passwordController,
            decoration:
                kInputTextDecoration.copyWith(hintText: 'Enter Password'),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: isLoggedIn
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already logged in? '),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLoggedIn = !isLoggedIn;
                          });
                        },
                        child: Text('Login!'),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLoggedIn = !isLoggedIn;
                          });
                        },
                        child: Text('Sign Up!'),
                      )
                    ],
                  )),
        Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: FloatingActionButton.large(
            heroTag: 'button',
            onPressed: () {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                if (isLoggedIn) {
                  SignUp(emailController.text, passwordController.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigatorService()));
                } else {
                  Login(emailController.text, passwordController.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigatorService()));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')));
              }
            },
            child: isLoggedIn
                ? const Text('Sign up', style: TextStyle(fontSize: 20))
                : const Text('Login', style: TextStyle(fontSize: 20)),
          ),
        )
      ],
    ));
  }
}

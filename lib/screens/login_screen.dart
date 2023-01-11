// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_/components/buttonStyle.dart';
import 'package:flash_chat_/constants.dart';
import 'package:flash_chat_/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                    },
                    decoration:
                        kInputDecoration.copyWith(hintText: 'Enter your email')),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kInputDecoration.copyWith(
                        hintText: 'Enter your password.')),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  colour: Colors.lightBlueAccent,
                  ontap: (() async {
                    setState(() {
                      showSpinner=true;
                    });
                    //Implement login functionality.
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner=false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }),
                  text: 'Log In',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

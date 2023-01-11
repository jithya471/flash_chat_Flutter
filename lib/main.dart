// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_/screens/login_screen.dart';
import 'package:flash_chat_/screens/registration_screen.dart';
import 'package:flash_chat_/screens/chat_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen()
      },
    );
  }
}

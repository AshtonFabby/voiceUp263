import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:voice_up/logged_in.dart';
import 'package:voice_up/login_screen.dart';
import 'package:voice_up/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  runApp(const MyApp());
}
// Get the firebase user
User? firebaseUser = FirebaseAuth.instance.currentUser;
// Define a widget
late Widget firstWidget;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Assign widget based on availability of currentUser
    if (firebaseUser != null) {
      firstWidget = const SplashScreen();
    } else {
      firstWidget = const LoginScreen();
    }

    return MaterialApp(
      title: 'Voice up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: firstWidget,

    );
  }
}

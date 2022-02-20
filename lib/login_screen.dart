import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:voice_up/splash_screen.dart';

import 'logged_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userEmail = "";
  bool isLoggedIn = false;
  Map userObject = {};
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),
          Center(
            child: Text(
              "Voice Up 263",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              // textAlign: TextAlign.justify
            ),
          ),
          const SizedBox(height: 100,),
          Center(
            child: Image.asset(
              'assets/images/people.png',
              height: 150,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Get started to interact with your Parliament, Ministry of information and Urban Councils.",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 140,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () async {
                      await signInWithGoogle();
                      setState(() {
                      });

                    },
                    child: const Text("Sign in with Google"),
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.indigo[800],
                        // padding: const EdgeInsets.fromLTRB(100, 17, 100, 17),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    userEmail = googleUser!.email;


    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(builder: (context) => const LoggedIn()),
    //       (Route<dynamic> route) => false,
    // );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SplashScreen()));
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

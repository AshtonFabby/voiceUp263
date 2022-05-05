import 'package:flutter/material.dart';
import 'package:voice_up/logged_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLoggedIn();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Text(
            "Welcome to Voice Up 263",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.indigo[800]),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/images/people.png",
            width: 300,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            // "A platform for information sharing \n and inclusive participation \nin budgeting affairs",
            "Get started to interact with your \nurban councils",
            style: TextStyle(color: Colors.black54, height: 1.5, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }

  navigateToLoggedIn() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoggedIn()));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voice_up/list.dart';
import 'package:voice_up/login_screen.dart';



final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;
final displayName = user!.displayName;
final imageURL = user!.photoURL;

class LoggedIn extends StatefulWidget {
  const LoggedIn({Key? key}) : super(key: key);

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  @override
  Widget build(BuildContext context) {
    ModalRoute
        .of(context)!
        .settings
        .arguments;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ListView(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(imageURL!),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome to Voice Up 263",
                            style: TextStyle(
                                fontSize: 18),
                          ),
                          Text(
                            displayName!,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // Text("Voice Up 263"
                // ,style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey[800]
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  width: double.infinity,
                  child:
                    Card(
                        color: Colors.indigo[800],
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const LocalAuthorities()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Urban Local Authorities",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                Image.asset(
                                  "assets/images/local.png",
                                  width: double.infinity,
                                ),
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),

                ),
              ],
            )));
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}


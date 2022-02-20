import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voice_up/information_feed.dart';
import 'package:voice_up/list.dart';
import 'package:voice_up/login_screen.dart';
import 'package:voice_up/parliament_feed.dart';


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
        drawer: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Drawer(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.indigo[800],
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
                                "Welcome back,",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                displayName!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 100)),
                    const ListTile(
                      title: Text(
                        "Feed",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Chat",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const Chat()),
                        // );
                      },
                    ),
                    const ListTile(
                      title: Text(
                        "Settings",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        "Community Contact Details",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        "Support",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        "About ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        signOut();
                      },
                      child: const Text("logout"),
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                      ),
                    )
                  ],
                ),
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: ListView(
              children: [
                Text("Voice Up 263"
                ,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [


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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Urban Local \nAuthorities",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  "assets/images/local.png",
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    Card(
                        color: Colors.indigo[800],
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const InformationFeed()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Ministry of \ninformation",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  "assets/images/info.png",
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Card(
                        color: Colors.indigo[800],
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ParliamentFeed()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Parliament of \nZimbabwe",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  "assets/images/parliament.png",
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    // TextButton(onPressed: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => SplashScreen())
                    //   );
                    // }, child: Text("goto splash"))
                  ],
                )
              ],
            )));
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}


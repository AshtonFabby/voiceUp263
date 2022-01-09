import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:voice_up/login_screen.dart';

import 'card_update.dart';
import 'chat.dart';
import 'feed.dart';


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
    ModalRoute.of(context)!.settings.arguments;
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
                        children:  [
                          const Text(
                            "Welcome back,",
                            style: TextStyle(color: Colors.white, fontSize: 14),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Chat()),
                    );
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
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Feed()),
                      );

                    }, child: const Text(
                      "Harare",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),),
                    // const Padding(
                    //   padding: EdgeInsets.only(right: 30, left: 30),
                    //   child: Text(
                    //     "Local Government",
                    //     style: TextStyle(color: Colors.grey, fontSize: 14),
                    //   ),
                    // ),
                    // Text("Local Government"),
                    const Text("Ministry of infomation",
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 30),
                  child: Text("Latest from the Feed",
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: <Widget>[
                      Card(
                          color: Colors.indigo[800],
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CardUpdate()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "City of Bulawayo",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),const Text(
                                    "Budget Review",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15, bottom: 15),
                                    child: Text(
                                      "By staff / Bulawayo",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Image.asset("assets/images/zesa.png"),
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      Card(
                        // color: Colors.indigo[800],
                          child: InkWell(
                            //splashColor: Colors.red,
                            onTap: () {
                              // print("card tapped");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Road works",
                                    style: TextStyle(
                                      // color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15, bottom: 15),
                                    child: Text(
                                      "By staff / Harare / Ward 34",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Image.asset("assets/images/road.png"),
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ])),
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Text("More Feed Articles"),
                ),
                 ListTile(
                  leading: const Icon(Icons.account_balance_rounded),
                  title: const Text("Gov’t Budget review"),
                  subtitle: const Text("By staff / Harare / Ward 34"),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BudgetReview()),
                    );

                  },
                )
              ],
            ),
          )
        ));


  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
class BudgetReview extends StatefulWidget {
  const BudgetReview({Key? key}) : super(key: key);

  @override
  _BudgetReviewState createState() => _BudgetReviewState();
}

class _BudgetReviewState extends State<BudgetReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gov't Budget review"),
      ),
      body: SfPdfViewer.asset("assets/pdf/budget2.pdf"),
    );
  }
}

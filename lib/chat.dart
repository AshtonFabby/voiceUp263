import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chat_item.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference cities =
        FirebaseFirestore.instance.collection("cities");

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/houses.jpg',
                  width: 252,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Chat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        // textAlign: TextAlign.justify
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: cities.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Error");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          return ListView(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return ListTile(
                                leading: Image.asset(
                                    "assets/images/Harare.png" /*+ data['image']*/),
                                title: Text(
                                  data["name"] + " City Chat",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                subtitle: Text(
                                  data["name"] + " discussions ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatItem(
                                                title: data["name"],
                                              )));
                                  // print("thing tapped");
                                },
                              );
                            }).toList(),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

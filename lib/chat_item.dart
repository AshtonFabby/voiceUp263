import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';


final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;
final uId = user!.uid;





class ChatItem extends StatelessWidget {


  late String title;
  ChatItem({Key? key, required this.title}) : super(key: key);

  final messageController = TextEditingController();
  String userMessage = "";


  @override
  Widget build(BuildContext context) {

    CollectionReference messages = FirebaseFirestore.instance.collection(title);

    return Scaffold(

        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.indigo[800],
          bottomOpacity: 0,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          StreamBuilder<QuerySnapshot>(

                              stream: messages.snapshots(),
                              builder: (context , snapshot){
                                if (snapshot.hasError){
                                  return const Text("Error");
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                }
                                return ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                                    return  BubbleNormal(
                                      text: data['message'],

                                      isSender: getSenderStatus(),
                                      color: const Color(0xFF283593),
                                      tail: false,
                                      textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    );
                                  }).toList(),
                                );
                              })
                        ],
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextField(
                            controller: messageController,
                            decoration: InputDecoration(
                                labelText: "Type your message",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      sendMessage(title);
                                      messageController.clear();
                                      // print(myTitle);
                                    },
                                    icon: const Icon(Icons.send))),
                          ),
                        ])
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  Future<void> sendMessage(String title) {
    // String location = title;
    // print(location);

    CollectionReference messages = FirebaseFirestore.instance.collection(title);
    userMessage = messageController.text;

    return messages
        .add({
      'message': userMessage,
      'user': uId
      // 'image':userMessage+'.png',
      // 'name':userMessage
    })
        .then((value) => print("Message sent"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  getSenderStatus() {

    if (uId != "ZJ52JwdebpgIMlISZgmAPRKNlUF2444" ){
      return false;
    }
    else{
      return true;
    }

  }

}




// print(userMessage);

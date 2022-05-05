import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voice_up/view_documents.dart';
import 'upload.dart';

import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;
final uId = user!.uid;
final displayName = user!.displayName;

class ChatItem extends StatelessWidget {


  late String title;
  ChatItem({Key? key, required this.title}) : super(key: key);

  final messageController = TextEditingController();
  String userMessage = "";

  @override
  Widget build(BuildContext context) {
    // CollectionReference messages = FirebaseFirestore.instance.collection(title);
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
              TextButton(onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewDocuments()),
                );

              }, child: Text("View Documents")),
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

                                    return ChatBubble(
                                      clipper: ChatBubbleClipper4(type: bubbleType(data["user"])),
                                      alignment: getAlignment(data["user"]),
                                      margin: EdgeInsets.only(top: 20),
                                      backGroundColor: getColor(data["user"]),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                                        ),
                                        child: Text(data["displayName"] +"\n\n"+
                                          data['message'],
                                          style: TextStyle(color: Colors.white),
                                        ),
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
                                suffixIcon: Container(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const Upload()),
                                            );
                                            messageController.clear();
                                            // print(myTitle);
                                          },
                                          icon: const Icon(Icons.file_upload_outlined)),
                                      IconButton(
                                          onPressed: () {
                                            sendMessage(title);
                                            messageController.clear();
                                            // print(myTitle);
                                          },
                                          icon: const Icon(Icons.send))
                                    ],
                                  ),
                                )
                            ),
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
      'user': uId,
      'displayName': displayName

      // 'image':userMessage+'.png',
      // 'name':userMessage
    })
        .then((value) => print("Message sent"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  bubbleType(String userName) {
    String sender = uId;
    String user = userName;
    var side ;

    if (sender != user){
      side = BubbleType.receiverBubble;
    }else{
      side = BubbleType.sendBubble;
    }


    return side;

  }
  getAlignment( String userName) {
    // return Alignment.topLeft;

    String sender = uId;
    String user = userName;
    var alignment ;

    if (sender == user){
      alignment = Alignment.topRight;
    }else{
      alignment = Alignment.topLeft;
    }


    return alignment;

  }

  getColor(String userName){
    // return Colors.blue;
    String sender = uId;
    String user = userName;
    var color ;

    if (sender == user){
      color = Colors.indigo;
    }else{
      color = Colors.grey;
    }

    return color;
  }

}




// print(userMessage);

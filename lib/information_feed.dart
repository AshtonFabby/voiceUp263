import 'package:flutter/material.dart';

import 'chat_item.dart';
import 'info_documents.dart';

class InformationFeed extends StatelessWidget {
  const InformationFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Image.asset('assets/images/broadcasting.jpg'),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Ministry of Information Feed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        // textAlign: TextAlign.justify
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.my_library_books_outlined),
                      title: const Text("Information Brief"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoDocuments()),
                        );
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.chat_outlined),
                      title: const Text("Enter ministry chat"),
                      subtitle: const Text("Discuss city matters"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatItem(
                                  title: "Information",
                                )));
                        // print("thing tapped");
                      },
                    )

                  ],
                ))
          ],
        ),
      ),

    );
  }
}

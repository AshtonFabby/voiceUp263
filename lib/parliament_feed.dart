import 'package:flutter/material.dart';
import 'package:voice_up/parliament_docs.dart';

import 'chat_item.dart';

class ParliamentFeed extends StatelessWidget {
  const ParliamentFeed({Key? key}) : super(key: key);

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
            Image.asset('assets/images/parliament.jpg'),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Parliament of Zimbabwe",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        // textAlign: TextAlign.justify
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.my_library_books_outlined),
                      title: const Text("Parliamentary Briefs"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ParliamentDocuments()),
                        );
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.chat_outlined),
                      title: const Text("Enter parliamentary chat"),
                      subtitle: const Text("Discuss city matters"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatItem(
                                  title: "Parliament",
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

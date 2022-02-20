import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_item.dart';
import 'city_documents.dart';
import 'gauge.dart';

class CityFeed extends StatelessWidget {

  final String title;
  CityFeed({Key? key, required this.title}) : super(key: key);

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
            Image.asset('assets/images/' + title + '-feed.jpg'),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title + " Feed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        // textAlign: TextAlign.justify
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Gauge(
                                title: title,
                              )),
                            );
                          },
                          child: const Text("Service Delivery Gauge")),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_balance_rounded),
                      title: const Text("Information briefs"),
                      subtitle: Text("By staff /" + title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CityDocuments()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.chat_outlined),
                      title: const Text("Public chat"),
                      subtitle: const Text("Discuss city matters"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatItem(
                                      title: title,
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

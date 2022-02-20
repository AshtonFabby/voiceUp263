import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'gauge.dart';


class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/harare-feed.jpg'),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Harare Feed",
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
                              MaterialPageRoute(
                                  builder: (context) => Gauge( title: "Harare",)),
                            );
                          },
                          child: const Text("Service Delivery Gauge")),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_balance_rounded),
                      title: const Text("Gov’t Budget review"),
                      subtitle: const Text("By staff / Harare / Ward 34"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const BudgetReview()),
                        // );
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



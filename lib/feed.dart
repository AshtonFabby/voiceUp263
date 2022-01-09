import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'logged_in.dart';

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
                                  builder: (context) => const Gauge()),
                            );
                          },
                          child: const Text("Service Delivery Gauge")),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_balance_rounded),
                      title: const Text("Gov’t Budget review"),
                      subtitle: const Text("By staff / Harare / Ward 34"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BudgetReview()),
                        );
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



class Gauge extends StatefulWidget {
  const Gauge({Key? key}) : super(key: key);

  @override
  State<Gauge> createState() => _GaugeState();

}

class _GaugeState extends State<Gauge> {

  double _currentSliderValue = 50;
  String gaugePhoto = "yellow.png";
  // CollectionReference messages = FirebaseFirestore.instance.collection("rating");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            "Service Delivery Gauge",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              Image.asset('assets/images/' + gaugePhoto),
              SizedBox(height: 30,),
              Text("How do you rate the service delivery in your area", style: TextStyle(
                fontSize: 18,
              ),),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 10,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              TextButton(
                onPressed: (){
                  submitRating();
                },
                child: const Text("Submit Rating"),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.indigo[800],
                    // padding: const EdgeInsets.fromLTRB(100, 17, 100, 17),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ],
          ),
        ));
  }

  Future<void> submitRating() {

    CollectionReference messages = FirebaseFirestore.instance.collection("rating");
    return messages
        .add({
      'province': "Harare",
      'user': "fabby2",
      'value': _currentSliderValue

    })
        .then((value) => print("Message sent"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  Future<void> getAverage()async {
    CollectionReference users = FirebaseFirestore.instance.collection('ratting');

  }

}

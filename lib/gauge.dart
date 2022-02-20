import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Gauge extends StatefulWidget {

  final String title;
  Gauge({Key? myKey, required this.title}) : super(key: myKey);

  @override
  _GaugeState createState() => _GaugeState();

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
              Image.asset("assets/images/yellow.png"),
              SizedBox(height: 30,),
              Text("How do you rate the service delivery in your area?", style: TextStyle(
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
                  String sTitle = widget.title;

                  submitRating(sTitle);
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

  Future<void> submitRating(title) {

    CollectionReference messages = FirebaseFirestore.instance.collection(title+"Rating");
    return messages
        .add({
      // 'province': "Harare",
      'user': "fabby",
      'value': _currentSliderValue

    })
        .then((value) => print("Message sent"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  Future<void> getAverage()async {

  }

}

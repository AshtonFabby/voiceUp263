import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityDocuments extends StatelessWidget {
  const CityDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City documents"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      )
    );
  }
}

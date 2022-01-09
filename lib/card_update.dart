import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CardUpdate extends StatefulWidget {
  const CardUpdate({Key? key}) : super(key: key);

  @override
  _CardUpdateState createState() => _CardUpdateState();
}

class _CardUpdateState extends State<CardUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Budget review"),
          backgroundColor: Colors.indigo[800],
        ),
        body: SfPdfViewer.asset("assets/pdf/budget.pdf")
    );
  }
}

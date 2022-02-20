import 'package:flutter/material.dart';
import 'package:voice_up/pdf_viewer.dart';

class ParliamentDocuments extends StatelessWidget {
  const ParliamentDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Parliamentary Briefs"),
          backgroundColor: Colors.indigo[800],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_balance_rounded),
                  title: const Text("Budget Speech Final 2022"),

                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewer(txt: "Budget_Speech_Final_2022",),
                        ));

                  },
                )
              ],
            ),
          ),
        )
    );
  }
}

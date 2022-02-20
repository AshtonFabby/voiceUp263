import 'package:flutter/material.dart';
import 'package:voice_up/pdf_viewer.dart';
class InfoDocuments extends StatelessWidget {
  const InfoDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Information Brief"),
          backgroundColor: Colors.indigo[800],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_balance_rounded),
                  title: const Text("Freedom of Information"),

                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PdfViewer(txt: "Freedom_of_Information",),
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

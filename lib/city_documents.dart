import 'dart:io';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import 'package:dio/dio.dart';
import 'package:voice_up/pdf_viewer.dart';



class CityDocuments extends StatefulWidget {
  const CityDocuments({Key? key}) : super(key: key);

  @override
  State<CityDocuments> createState() => _CityDocumentsState();
}

class _CityDocumentsState extends State<CityDocuments> {

  late Future<ListResult> futureFiles;

  @override

  void initState(){
    super.initState();
    futureFiles = FirebaseStorage.instance.ref("/files").listAll();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City documents"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ListTile(
                title: Text("Budget review 2020"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfViewer( txt: "budget",)),
                  );
                },
              ),

              ListTile(
                title: Text("Pre-budget strategy 2021"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfViewer( txt: "budget2",)),
                  );
                },
              ),

              ListTile(
                title: Text("National Budget Speech 2022"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfViewer( txt: "Budget_Speech_Final_2022",)),
                  );
                },
              ),

              ListTile(
                title: Text("Freedom of Information"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfViewer( txt: "Freedom_of_Information",)),
                  );
                },
              ),

              SizedBox(
                height: 40,
              ),
              Text("Downloadable documents",
                style: TextStyle(fontSize: 18),
              ),
              FutureBuilder<ListResult>(
                future: futureFiles,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    final files = snapshot.data!.items;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          final file = files[index];
                      return ListTile(
                        title: Text(file.name),
                        trailing: IconButton(
                          icon: Icon(Icons.download,
                          ),
                          onPressed: (){
                            downloadFile(file);
                          },
                        ),
                      );
                    },
                    );

                  }else if (snapshot.hasError){
                    return const Center(child: Text("Error occurred "));
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }

                } ,),
            ],
          ),

      )
    );
  }

  Future downloadFile(Reference ref) async {
    // final dir = await getApplicationDocumentsDirectory();
    // final dir = await "/storage/emulated/0/Documents/";
    // print(dir);
    // final file = File("${dir}/${ref.name}");
    //
    // await ref.writeToFile(file);
    //
    final url = await ref.getDownloadURL();
    //
    final tempDir = await getTemporaryDirectory();
    final docDir = "/storage/emulated/0/Documents/";

    final path = "${docDir}/${ref.name}";
    await Dio().download(url, path);

    if (url.contains(".mp4")){
      await GallerySaver.saveVideo(path, toDcim: true);
    }else if (url.contains(".jpg")){
      await GallerySaver.saveImage(path, toDcim: true);
    }

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("downloaded ${ref.name}")),

    );
  }
}

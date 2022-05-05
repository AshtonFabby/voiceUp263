import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a file"),
          backgroundColor: Colors.indigo[800]
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(

          child: Column(
            children: [
              Text("Select files for upload"),
              SizedBox(
                height: 200,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () async {
                    final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpg', 'pdf','doc', 'docx','ppt', 'pptx','xls', 'xlsx', 'mp3','mp4','mkv' ]

                    );
                    if (results == null){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("No file was selected"))
                      );
                      return null;
                    }
                    final path = results.files.single.path!;
                    final fileName = results.files.single.name;

                    storage.uploadFile(path, fileName);
                    print("done");
                    
                    Navigator.pop(context);
                  },
                  child: const Text("Select "),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.indigo[800],
                      // padding: const EdgeInsets.fromLTRB(100, 17, 100, 17),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


class Storage {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName)
    async{
      File file = File(filePath);

      try {
        await storage.ref('files/$fileName').putFile(file);

      }on firebase_core.FirebaseException catch (e){
        print(e);
      }

    }

  }



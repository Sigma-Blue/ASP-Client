// import 'package:ap/Pages/Addposts/addpost.dart';
// import 'package:ap/Pages/Addposts/addpost.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class addImage extends StatefulWidget {
  const addImage({super.key});

  @override
  State<addImage> createState() => _addImageState();
}

class _addImageState extends State<addImage> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        print("File name $_fileName");
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13.0, top: 30),
                child: Icon(Icons.image),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 30),
                child: Container(
                  child: isLoading
                      ? CircularProgressIndicator()
                      : TextButton(
                          onPressed: () {
                            pickFile();
                          },
                          child: Text(
                            'Pick File',
                            style: TextStyle(fontSize: 24),
                          )),
                ),
              ),
              if (pickedfile != null)
                SizedBox(
                  height: 300,
                  width: 400,
                  child: Image.file(fileToDisplay!),
                )
            ],
          ),
        ],
      )),
    );
  }
}

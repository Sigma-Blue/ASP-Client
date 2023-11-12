// import 'package:ap/Pages/Addposts/addImage.dart';
import 'package:ap/Pages/Addposts/addlink.dart';
import 'package:ap/Pages/Addposts/domain.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class addPost extends StatefulWidget {
  const addPost({super.key});

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Post",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [Icon(Icons.cancel)],
              )
            ]),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                minLines: 1,
                maxLines: 30,
                decoration: const InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextFormField(
                minLines: 1,
                maxLines: 100,
                decoration: const InputDecoration(
                    labelText: 'Caption', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const DropdownMenuExample(),
              const SizedBox(
                height: 20,
              ),
              const AddLink(),
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 230, top: 15),
                child: Container(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : TextButton(
                          onPressed: () {
                            pickFile();
                          },
                          child: const Text(
                            'Add Image',
                            style: TextStyle(fontSize: 24),
                          )),
                ),
              ),
              if (pickedfile != null)
                SizedBox(
                  height: 300,
                  width: 400,
                  child: Image.file(fileToDisplay!),
                ),
              // GestureDetector(
              //   child: const Text(
              //     "Add Image",
              //     style: TextStyle(
              //         color: Colors.blue,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pushReplacement(MaterialPageRoute(
              //         builder: (BuildContext context) => addImage()));
              //   },
              // ),
              const SizedBox(height: 20),
            ],
          )),
    );
  }

  Widget addlink() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Link', border: OutlineInputBorder()),
    );
  }
}

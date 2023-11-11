// import 'package:ap/Pages/Addposts/addImage.dart';
import 'dart:convert';

import 'package:ap/Pages/Addposts/addImage.dart';
import 'package:ap/Pages/Addposts/addlink.dart';
import 'package:ap/Pages/Addposts/cloudinaryimage.dart';
import 'package:ap/Pages/Addposts/domain.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class addPost extends StatefulWidget {
  const addPost({super.key});

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  // FilePickerResult? result;
  // String? _fileName;
  // PlatformFile? pickedfile;
  // bool isLoading = false;
  // File? fileToDisplay;
  // void pickFile() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     result = await FilePicker.platform.pickFiles(
  //       type: FileType.any,
  //       allowMultiple: false,
  //     );
  //     if (result != null) {
  //       _fileName = result!.files.first.name;
  //       pickedfile = result!.files.first;
  //       fileToDisplay = File(pickedfile!.path.toString());
  //       print("File name $_fileName");
  //     }
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  File? _imageFile;
  String? _imageUrl;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
    });
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
              DropdownMenuExample(),
              const SizedBox(
                height: 20,
              ),
              AddLink(),
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                    child: Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => _pickImage(ImageSource.camera),
                          child: const Text('Take a picture'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        child: const Text('Select picture'),
                      ),
                    ]),
                    if (_imageFile != null) ...[
                      Image.file(_imageFile!),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('upload'))
                    ],
                    if (_imageUrl != null) ...[
                      Image.network(_imageUrl!),
                      Text("cloudinary URL :$_imageUrl")
                    ]
                  ],
                )
                    // child: isLoading
                    //     ? CircularProgressIndicator()
                    //     : TextButton(
                    //         onPressed: () {
                    //           pickFile();
                    //         },
                    //         child: const Text(
                    //           'Add Image',
                    //           style: TextStyle(fontSize: 24),
                    //         )),
                    ),
              ),
              // if (pickedfile != null)
              //   SizedBox(
              //     height: 300,
              //     width: 400,
              //     child: Image.file(fileToDisplay!),
              // ),
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

  // Widget addlink() {
  //   return TextFormField(
  //     decoration: const InputDecoration(
  //         labelText: 'Link', border: OutlineInputBorder()),
  //   );
  // }

  Widget cloudinary() {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: const Text('Take a picture'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: const Text('Select picture'),
            ),
            if (_imageFile != null) ...[
              Image.file(_imageFile!),
              ElevatedButton(onPressed: () {}, child: const Text('upload'))
            ],
            if (_imageUrl != null) ...[
              Image.network(_imageUrl!),
              Text("cloudinary URL :$_imageUrl")
            ]
          ],
        ),
      ),
    );
  }
}

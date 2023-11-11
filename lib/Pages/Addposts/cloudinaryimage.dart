import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class cloudinary extends StatefulWidget {
  const cloudinary({super.key});

  @override
  State<cloudinary> createState() => _cloudinaryState();
}

class _cloudinaryState extends State<cloudinary> {
  File? _imageFile;
  String? _imageUrl;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
    });
  }

  // Future<void> _uploadImage() async {
  //   final url = Uri.parse("https://api.cloudinary.com/v1_1/dddnzptni/upload");
  //   final request = http.MultipartRequest('POST', url)
  //     ..fields['upload_preset'] = 'herdsraj'
  //     ..files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));
  //   final response = await request.send();
  //   if (response.statusCode == 200) {
  //     final responseData = await response.stream.toBytes();
  //     final responseString = String.fromCharCodes(responseData);
  //     final jsonMap = jsonDecode(responseString);
  //     setState(() {
  //       final url = jsonMap('Url');
  //       _imageUrl = url;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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

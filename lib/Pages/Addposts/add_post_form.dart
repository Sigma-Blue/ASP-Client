import 'dart:convert';
import 'dart:io';
import 'package:ap/Pages/Addposts/drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddPostForm extends StatefulWidget {
  const AddPostForm({super.key});
  @override
  _AddPostFormState createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  List<String> links = [];
  File? _imageFile;
  String? _imageUrl;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
    });
  }

  Future<void> _uploadImage() async {
    final url =
        Uri.parse('https://api.cloudinary.com/v1_1/dgs7fbmta/image/upload');
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'alumni_student_platform'
      ..files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = utf8.decode(responseData);
      final jsonMap = jsonDecode(responseString);
      setState(() {
        final url = jsonMap['url'];
        _imageUrl = url;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter the description for your Post",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  labelText: 'Description', border: OutlineInputBorder()),
              minLines: 1,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            const DropdownMenuExample(),
            const SizedBox(height: 16),
            const Text(
              "Enter the detailed about for your Posts here",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: aboutController,
              decoration: const InputDecoration(
                  labelText: 'About', border: OutlineInputBorder()),
              minLines: 1,
              maxLines: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              "share the links of your Post",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < links.length; i++)
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Link ${i + 1}',
                              border: const OutlineInputBorder()),
                          onChanged: (value) {
                            links[i] = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            links.removeAt(i);
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 120, right: 120),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        links.add('');
                      });
                    },
                    child: const Text('Add Link'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Upload Picture here",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                            onPressed: _uploadImage,
                            child: const Text('upload'))
                      ],
                      if (_imageUrl != null) ...[
                        Image.network(_imageUrl!),
                        Text("cloudinary URL :$_imageUrl")
                      ]
                    ],
                  )),
                )
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 120, right: 120),
              child: ElevatedButton(
                onPressed: () {
                  // Add submit logic here
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

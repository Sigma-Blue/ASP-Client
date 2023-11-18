import 'dart:io';
import 'package:ap/Pages/Profile/myprofile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController gitHubController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter your First Name here",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                  labelText: 'FirstName', border: OutlineInputBorder()),
            ),
            const Text(
              "Enter your Last Name here",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                  labelText: 'LastName', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text(
              "Enter the detailed about for your Profile here",
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
              "share your GitHub Link here",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: gitHubController,
              decoration: const InputDecoration(
                  labelText: 'GitHub Link', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            const Text(
              "share your LinkedIn Link here",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: linkedInController,
              decoration: const InputDecoration(
                  labelText: 'LinkedIn Link', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            const Text(
              "share your Instagram Link here",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: instagramController,
              decoration: const InputDecoration(
                  labelText: 'Instagram Link', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            const Text(
              "share your Twitter Link here",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: twitterController,
              decoration: const InputDecoration(
                  labelText: 'Twitter Link', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            const Text(
              "share the other links if you wish to want to share in your profile",
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
                  "Upload Profile Picture here",
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
                            onPressed: () {}, child: const Text('upload'))
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const MyProfile(name: "'", usertype: " '")));
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

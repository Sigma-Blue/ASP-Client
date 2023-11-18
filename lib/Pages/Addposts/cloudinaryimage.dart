// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:cloudinary_flutter/cloudinary_context.dart';
// import 'package:cloudinary_flutter/image/cld_image.dart';
// import 'package:cloudinary_url_gen/cloudinary.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

// class cloudinary extends StatefulWidget {
//   const cloudinary({super.key});

//   @override
//   State<cloudinary> createState() => _cloudinaryState();
// }

// class _cloudinaryState extends State<cloudinary> {
//   File? _imageFile;
//   String? _imageUrl;

//   Future<void> _pickImage(ImageSource source) async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? pickedFile = await picker.pickImage(source: source);
//     setState(() {
//       if (pickedFile != null) _imageFile = File(pickedFile.path);
//     });
//   }

//   // Future<void> _uploadImage() async {
//   //   final url = Uri.parse("https://api.cloudinary.com/v1_1/dddnzptni/upload");
//   //   final request = http.MultipartRequest('POST', url)
//   //     ..fields['upload_preset'] = 'herdsraj'
//   //     ..files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));
//   //   final response = await request.send();
//   //   if (response.statusCode == 200) {
//   //     final responseData = await response.stream.toBytes();
//   //     final responseString = String.fromCharCodes(responseData);
//   //     final jsonMap = jsonDecode(responseString);
//   //     setState(() {
//   //       final url = jsonMap('Url');
//   //       _imageUrl = url;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.camera),
//               child: const Text('Take a picture'),
//             ),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.gallery),
//               child: const Text('Select picture'),
//             ),
//             if (_imageFile != null) ...[
//               Image.file(_imageFile!),
//               ElevatedButton(onPressed: () {}, child: const Text('upload'))
//             ],
//             if (_imageUrl != null) ...[
//               Image.network(_imageUrl!),
//               Text("cloudinary URL :$_imageUrl")
//             ]
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AddInput extends StatefulWidget {
  final Function(String) onAdd;

  const AddInput({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddInputState createState() => _AddInputState();
}

class _AddInputState extends State<AddInput> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: 'Enter item',
              ),
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: () {
              _addItemToList();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _addItemToList() {
    String newItem = _textFieldController.text.trim();
    if (newItem.isNotEmpty) {
      widget.onAdd(newItem);
      _textFieldController.clear();
    }
  }
}

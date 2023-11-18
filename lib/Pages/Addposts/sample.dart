// import 'package:ap/Pages/Addposts/domain.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

// class AddPost extends StatefulWidget {
//   const AddPost({super.key});

//   @override
//   State<AddPost> createState() => _AddPostState();
// }

// class _AddPostState extends State<AddPost> {
//   File? _imageFile;
//   String? _imageUrl;
//   TextEditingController _textFieldController = TextEditingController();
//   List<String> itemList = [];

//   Future<void> _pickImage(ImageSource source) async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? pickedFile = await picker.pickImage(source: source);
//     setState(() {
//       if (pickedFile != null) _imageFile = File(pickedFile.path);
//     });
//   }

//   void _addItemToList() {
//     String newItem = _textFieldController.text.trim();
//     if (newItem.isNotEmpty) {
//       setState(() {
//         itemList.add(newItem);
//         _textFieldController.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Add Post",
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//               Row(
//                 children: [Icon(Icons.cancel)],
//               )
//             ]),
//       ),
//       body: Container(
//           padding: const EdgeInsets.all(20.0),
//           child: ListView(
//             children: [
//               const SizedBox(height: 20),
//               const Text(
//                 "Add suitable Description for your post ",
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 minLines: 1,
//                 maxLines: 30,
//                 decoration: const InputDecoration(
//                     labelText: 'Description', border: OutlineInputBorder()),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Write an about for your post ",
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 minLines: 1,
//                 maxLines: 100,
//                 decoration: const InputDecoration(
//                     labelText: 'About', border: OutlineInputBorder()),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Select domain of the post is related to",
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const DropdownMenuExample(),
//               const SizedBox(
//                 height: 20,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Upload Picture here",
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(0),
//                 child: Container(
//                     child: Column(
//                   children: [
//                     Row(children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ElevatedButton(
//                           onPressed: () => _pickImage(ImageSource.camera),
//                           child: const Text('Take a picture'),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () => _pickImage(ImageSource.gallery),
//                         child: const Text('Select picture'),
//                       ),
//                     ]),
//                     if (_imageFile != null) ...[
//                       Image.file(_imageFile!),
//                       ElevatedButton(
//                           onPressed: () {}, child: const Text('upload'))
//                     ],
//                     if (_imageUrl != null) ...[
//                       Image.network(_imageUrl!),
//                       Text("cloudinary URL :$_imageUrl")
//                     ]
//                   ],
//                 )),
//               ),
//               const SizedBox(height: 20),
//               AddLink(),
//               ElevatedButton(onPressed: () {}, child: const Text('Upload Post'))
//             ],
//           )),
//     );
//   }

//   Widget cloudinary() {
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

//   Widget AddLink() {
//     return Scaffold(
//       body: Container(
//           child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 9),
//                       child: TextField(
//                         controller: _textFieldController,
//                         decoration: const InputDecoration(
//                           hintText: 'Enter Links',
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       _addItemToList();
//                     },
//                     child: Text('Add'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: itemList.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(itemList[index]),
//                     );
//                   },
//                 ),
//               ),
//               // ElevatedButton(
//               //   onPressed: () {
//               //     Navigator.of(context).pushReplacement(
//               //       MaterialPageRoute(
//               //           builder: (BuildContext context) => const AddPost()),
//               //     );
//               //   },
//               //   child: const Text("Add Link"),
//               // ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }

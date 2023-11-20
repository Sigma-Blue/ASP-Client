// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

// class imagepicker extends StatelessWidget {
//   const imagepicker({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ChangeNotifierProvider<MyProvider>(
//             create: (context) => MyProvider(),
//             child: Consumer<MyProvider>(
//               builder: (context, provider, child) {
//                 return Column(
//                   children: [
//                     if (provider.image != null)
//                       Image.network(provider.image.path),
//                     MaterialButton(
//                         onPressed: () async {
//                           var image = await ImagePicker()
//                               .getImage(source: ImageSource.gallery);
//                           provider.setImage(image);
//                         },
//                         child: Text("Add Image")),
//                     MaterialButton(onPressed: () {
//                       if (provider.image == null) return;
//                       provider.makepostRequest();
//                       child:
//                       Text("submit");
//                     })
//                   ],
//                 );
//               },
//             )));
//   }
// }

// class MyProvider extends ChangeNotifier {
//   var image;

//   Future setImage(img) async {
//     this.image = img;
//     this.notifyListeners();
//   }

//   Future makePostRequest() async {
//     String url = 'Your end point';
//     var headers = {

//     };
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.headers.addAll(headers);
//     Uint8List data = await this.image.readAsBytes();
//     List<int> list = data.cast();
//     request.files.add(http.MultipartFile.fromBytes('Your_field_name', list,
//         filename: 'myFile.png'));

//     var response = await request.send();
//     response.stream.bytesToString().asStream().listen((event) {
//       var parsedJson = json.decode(event);
//       print(response.statusCode);


//     })
//   }
// }

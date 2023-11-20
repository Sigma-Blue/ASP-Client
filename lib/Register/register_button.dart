// import 'package:ap/login/loginscreen.dart';
// import 'package:flutter/material.dart';

// class Mybutton extends StatelessWidget {
//   final String buttonname;
//   final String pagename;
//   const Mybutton({Key? key, required this.buttonname, required this.pagename})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         child: Container(
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.symmetric(horizontal: 50),
//             decoration: const BoxDecoration(color: Colors.blue),
//             child: Center(
//               child: Text(
//                 buttonname,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25),
//               ),
//             )),
//         onTap: () {
//           Navigator.of(context).pushReplacement(MaterialPageRoute(
//               builder: (BuildContext context) => LoginScreen()));
//         });
//   }
// }

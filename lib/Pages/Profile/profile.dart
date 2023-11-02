// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   final String uname;
//   final String nfollowers;
//   final String nfollowing;
//   final String nposts;

//   ProfilePage({
//     Key? key,
//     required this.uname,
//     required this.nfollowers,
//     required this.nfollowing,
//     required this.nposts,
//   });
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView(
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         buildTop(),
//         buildButton(),
//         buildContent(),
//         buildbuttons('23', 'followers'),
//         buildbuttons('23', 'followers'),
//         buildbuttons('23', 'followers')
//       ],
//     ));
//   }
// }

// Widget buildTop() {
//   return Stack(
//     clipBehavior: Clip.none,
//     alignment: Alignment.topLeft,
//     children: [
//       Container(
//         margin: const EdgeInsets.only(bottom: 35),
//         child: buildCoverImage(),
//       ),
//       Positioned(
//         top: 203,
//         child: buildProfileImage(),
//       ),
//     ],
//   );
// }

// Widget buildButton() {
//   return GestureDetector(
//     child: Container(
//         alignment: Alignment.topRight,
//         padding: const EdgeInsets.all(5),
//         margin: const EdgeInsets.fromLTRB(165, 0, 30, 0),
//         decoration: const BoxDecoration(color: Colors.blue),
//         child: const Center(
//           child: Text(
//             "Edit Profile",
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//         )),
//   );
// }

// Widget buildContent() {
//   return const Scaffold(
//     body: SafeArea(child: Column()),
//   );
// }

// Widget buildbuttons(nfollowers, name) {
//   return MaterialButton(
//     padding: EdgeInsets.symmetric(vertical: 4),
//     onPressed: () {},
//     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           nfollowers,
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 2),
//         Text(
//           name,
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//   );
// }

// Widget buildCoverImage() => Container(
//       color: Colors.grey,
//       width: double.infinity,
//       height: 280,
//       child: Image.asset('Images/coverpicture.jpg'),
//     );
// Widget buildProfileImage() => CircleAvatar(
//       radius: 77,
//       backgroundColor: Colors.grey.shade800,
//       backgroundImage: const AssetImage('Images/profilepicture.jpg'),
//     );

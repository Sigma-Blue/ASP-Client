// // import 'package:ap/Pages/Profile/About.dart';
// // import 'package:ap/Pages/Profile/Education.dart';
// // import 'package:ap/Pages/Profile/Experince.dart';
// // import 'package:ap/Pages/Profile/skills.dart';
// // import 'package:flutter/material.dart';

// // class ProfileBody extends StatefulWidget {
// //   const ProfileBody({super.key});

// //   @override
// //   State<ProfileBody> createState() => _ProfileBodyState();
// // }

// // class _ProfileBodyState extends State<ProfileBody> {
// //   // int SelectionIndex = 0;
// //   // void navigateTabBar(int index) {
// //   //   setState(() {
// //   //     SelectionIndex = index;
// //   //   });
// //   // }

// //   // final List<Widget> _Children = [
// //   //   About(),
// //   //   Skills(),
// //   //   Experience(),
// //   //   Education(),
// //   // ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: DefaultTabController(
// //         child: Column(children: [
// //       TabBar(
// //         indicatorColor: Colors.blue,
// //         labelColor: Colors.black,
// //         unselectedLabelColor: Colors.grey,
// //         tabs: [
// //           Tab(
// //             text: "ABOUT",
// //           ),
// //           Tab(
// //             text: "SKILLS",
// //           ),
// //           Tab(
// //             text: "EXPERIENCE",
// //           ),
// //           Tab(
// //             text: "EDUCATION",
// //           ),
// //         ],
// //       ),
// //       TabBarView(children: [
// //         Container(
// //           child: About(),
// //         ),
// //         Container(
// //           child: Skills(),
// //         ),
// //         Container(
// //           child: Experience(),
// //         ),
// //         Container(
// //           child: Education(),
// //         )
// //       ]),
// //     ]));
// //   }
// // }
// import 'package:ap/Pages/Profile/numbers_widget.dart';
// import 'package:flutter/material.dart';

// class ProfileBody extends StatefulWidget {
 
//    final String name;
//   final String Usertype;
//    const ProfileBody({super.key,required this.Usertype,required this.name});

//   @override
//   State<ProfileBody> createState() => _ProfileBodyState();
// }

// class _ProfileBodyState extends State<ProfileBody> {
//     final double coverHeight = 210;
//   final double profileHeight = 124;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
          
//              appBar: AppBar(
//         elevation: 0,
//         title:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Text(
//             "ASP",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ]),
        
//            TabBarView(
//             children: [
//               // About Tab
//               Center(
//                 child: Text('About Me'),
//               ),

//               // Skills Tab
//               Center(
//                 child: Text('My Skills'),
//               ),

//               // Experience Tab
//               Center(
//                 child: Text('Work Experience'),
//               ),

//               // Education Tab
//               Center(
//                 child: Text('Education Background'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
//   Widget buildAbout() => Container(
//         child: const Column(
//           children: [
//             SizedBox(height: 40),
//             Text("This is the details about the user")
//           ],
//         ),
//       );

//   Widget buildContent() => Container(
//         child: const Column(children: [
//           SizedBox(height: 5),
//           NumbersWidget(),
//           // Flexible(
//           //child:
//         ]),
//       );
//   //) //Row

//   Widget buildTop() {
//     final bottom = profileHeight / 2;
//     final top = coverHeight - profileHeight / 2;

//     return Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.center,
//       children: [
//         Container(
//             margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
//         Positioned(
//           top: top,
//           child: buildProfileImage(),
//         )
//       ],
//     );
//   }

//   Widget buildCoverImage() => Column(children: [
//         Container(
//           child: Image.asset(
//             'assets/images/coverpicture.png',
//             width: double.infinity,
//             height: coverHeight,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ]);
//   Widget buildProfileImage() => CircleAvatar(
//         radius: profileHeight / 2,
//         backgroundImage: const AssetImage(
//           'assets/images/profilepicture.jpg',
//         ),
//       );
//   Widget buildSocialIcon(IconData icon) => CircleAvatar(
//         radius: 25,
//         backgroundColor: Colors.black,
//         child: Material(
//             shape: const CircleBorder(),
//             clipBehavior: Clip.hardEdge,
//             color: Colors.transparent,
//             child: InkWell(
//                 onTap: () {},
//                 child: Center(
//                   child: Icon(
//                     icon,
//                     size: 30,
//                     color: Colors.white,
//                   ),
//                 ))),
//       );
// }

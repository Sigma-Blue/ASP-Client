import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text("Hii everyone"),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class ProfileWidget extends StatelessWidget {
//   final String imagePath;
//   final VoidCallback onClicked;

//   const ProfileWidget({
//     Key? key,
//     required this.imagePath,
//     required this.onClicked,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final color = Theme.of(context).colorScheme.primary;

//     return Container(
//       child: Stack(
//         children: [
//           buildImage(),
//           Positioned(
//             bottom: 0,
//             right: 4,
//             child: buildEditIcon(color),
//           ), //Positioned
//         ],
//       ), //Stack
//     ); //Centre
//   }

//   Widget buildImage() {
//     final image = AssetImage(imagePath);

//     return ClipOval(
//       child: Material(
//         color: Colors.transparent,
//         child: Ink.image(
//           image: image,
//           fit: BoxFit.cover,
//           width: 128,
//           height: 128,
//           child: InkWell(onTap: onClicked),
//         ), //Ink.image
//       ), //Material
//     ); //ClipOval
//   }

//   Widget buildEditIcon(Color color) => buildCircle(
//         color: color,
//         all: 8,
//         child: const Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 20,
//         ),
//       );

//   Widget buildCircle({
//     required Widget child,
//     required double all,
//     required Color color,
//   }) =>
//       Container(
//         child: child,
//       );
// }
// Widget buildOptions() => Container(
//         child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         About();
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(4.0),
//                         child: Text(
//                           "ABOUT",
//                           style: TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       child: const Padding(
//                         padding: EdgeInsets.all(4.0),
//                         child: Text(
//                           "SKILLS",
//                           style: TextStyle(
//                               fontSize: 17, fontWeight: FontWeight.bold),
//                         ),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       child: const Padding(
//                         padding: EdgeInsets.all(4.0),
//                         child: Text(
//                           "EXPERIENCE",
//                           style: TextStyle(
//                               fontSize: 17, fontWeight: FontWeight.bold),
//                         ),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       child: const Padding(
//                         padding: EdgeInsets.all(4.0),
//                         child: Text(
//                           "EDUCATION",
//                           style: TextStyle(
//                               fontSize: 17, fontWeight: FontWeight.bold),
//                         ),
//                       )),
//                 ),
//               ],
//             )),
//       );


//  appBar: AppBar(
//         elevation: 0,
//         title:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           const Text(
//             "ASP",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           Row(
//             children: [
//               IconButton(
//                 iconSize: 20,
//                 onPressed: () {},
//                 icon: const Icon(Icons.more_vert),
//               ),
//             ],
//           ),
//         ]),
//       ),
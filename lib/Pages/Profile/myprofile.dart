import 'package:ap/Pages/Profile/numbers_widget.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  final String name;
  final String usertype;
  const MyProfile({super.key, required this.name, required this.usertype});
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isExperience = false;
  final double coverHeight = 210;
  final double profileHeight = 124;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 4,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            buildTop(),
            buildContent(),
            // ProfileBody(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.name),
            ),
            Text(widget.usertype),
            const TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "ABOUT",
                ),
                Tab(
                  text: "SKILLS",
                ),
                Tab(
                  text: "EXPERIENCE",
                ),
                Tab(
                  text: "EDUCATION",
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildContent() => Container(
        child: const Column(children: [
          SizedBox(height: 5),
          NumbersWidget(),
          // Flexible(
          //child:
        ]),
      );


  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(
          top: top,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() => Column(children: [
        Container(
          child: Image.asset(
            'assets/images/coverpicture.png',
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover,
          ),
        ),
      ]);
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundImage: const AssetImage(
          'assets/images/profilepicture.jpg',
        ),
      );
  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
        child: Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: InkWell(
                onTap: () {},
                child: Center(
                  child: Icon(
                    icon,
                    size: 30,
                    color: Colors.white,
                  ),
                ))),
      );
}

//import 'package:alumni_studentpage/utils/userpreferance.dart';

import 'package:ap/Pages/Profile/numbers_widget.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String Usertype;
  ProfilePage({required this.name, required this.Usertype});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 210;
  final double profileHeight = 124;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ASP",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [Icon(Icons.settings)],
              )
            ]),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() => Column(children: [
        const SizedBox(height: 8),
        Text(
          widget.name,
          style: TextStyle(fontSize: 40, color: Colors.black),
        ),
        Text(
          widget.Usertype,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildSocialIcon(FontAwesomeIcons.github),
              const SizedBox(width: 10),
              buildSocialIcon(FontAwesomeIcons.instagram),
              const SizedBox(width: 10),
              buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(width: 10),
              buildSocialIcon(FontAwesomeIcons.linkedin),
              const SizedBox(width: 10),
              Row(
                children: [
                  IconButton(
                    iconSize: 16,
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Divider(),
        const SizedBox(height: 12),
        NumbersWidget(),
        const SizedBox(height: 12),
        Divider(),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "ABOUT",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        )
      ]);

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

  Widget buildCoverImage() => Container(
        child: Image.asset(
          'assets/images/coverpicture.png',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundImage: AssetImage(
          'assets/images/profilepicture.jpg',
        ),
      );
  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
        child: Material(
            shape: CircleBorder(),
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

import 'package:ap/Pages/Profile/numbers_widget.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String usertype;
  const ProfilePage({super.key, required this.name, required this.usertype});
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
        title:
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "ASP",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
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
          style: const TextStyle(fontSize: 40, color: Colors.black),
        ),
        Text(
          widget.usertype,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
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
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
        const NumbersWidget(),
        const SizedBox(height: 12),
        const Divider(),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "ABOUT",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "SKILLS",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "EXPERIENCE",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
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
          'assets/images/profilepicture.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundImage: const AssetImage(
          'assets/images/coverpicture.png',
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

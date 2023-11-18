import 'package:ap/Pages/Home/home.dart';
import 'package:ap/Pages/Addposts/AddPost.dart';
import 'package:ap/Pages/Profile/EditProfile/Edit_Profile.dart';
import 'package:ap/Pages/Profile/myprofile.dart';
import 'package:ap/Pages/Profile/profilepage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectionIndex = 0;
  void navigateBottomNavbar(int index) {
    setState(() {
      selectionIndex = index;
    });
  }

  final List<Widget> _children = [
    const Home(),
    // const Search(Username: "Gokulramana", Usertype: "Alumni"),
    const EditProfile(),
    const ProfilePage(name: "Swetha", usertype: "Student"),
    const AddPost(),
    const MyProfile(name: "Monikashri", usertype: "Alumni")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[selectionIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectionIndex,
        onTap: navigateBottomNavbar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'files'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'addpost'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'account'),
        ],
      ),
    );
  }
}

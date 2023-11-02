import 'package:ap/Pages/Addposts/addImage.dart';
import 'package:ap/Pages/Addposts/addpost.dart';
// import 'package:ap/Pages/Addposts/addpostform.dart';
// import 'package:ap/Pages/Addposts/domain.dart';
// import 'package:ap/Pages/Files/files.dart';
import 'package:ap/Pages/Home/home.dart';
// import 'package:ap/Pages/Profile/account.dart';
import 'package:ap/Pages/Profile/profilepage.dart';
// import 'package:ap/Pages/Profile/profile.dart';
import 'package:ap/Pages/Search/search.dart';
// import 'package:ap/Pages/Home/comments.dart';
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
    Home(),
    Search(Username: "Gokulramana", Usertype: "Alumni"),
    addImage(),
    addPost(),
    ProfilePage(
      name: 'Monikashri',
      Usertype: 'Student',
    ),
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

// import 'package:ap/Pages/Addposts/addImage.dart';
import 'package:ap/Pages/Addposts/addpost.dart';
// import 'package:ap/Pages/Addposts/domain.dart';
import 'package:flutter/material.dart';

class addpostForm extends StatefulWidget {
  const addpostForm({super.key});

  @override
  State<addpostForm> createState() => _addpostFormState();
}

class _addpostFormState extends State<addpostForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          addPost(),
        ],
      ),
    );
  }
}

import 'package:ap/Pages/Home/homepost.dart';
import 'package:ap/Pages/Addposts/AddPost.dart';
import 'package:flutter/material.dart';

class SavedFiles extends StatefulWidget {
  const SavedFiles({super.key});

  @override
  State<SavedFiles> createState() => _SavedFilesState();
}

class _SavedFilesState extends State<SavedFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Saved Posts",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ]),
      ),
      body: Userpost(name: 'Charu', caption: "Saved First Post", likes: 43),
    );
  }
}

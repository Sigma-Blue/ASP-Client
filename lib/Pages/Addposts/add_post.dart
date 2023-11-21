import 'package:ap/Pages/Addposts/add_post_form.dart';
import 'package:ap/Pages/Home/home_screen.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage()));
            },
          ),
        ],
      ),
      body: const AddPostForm(),
    );
  }
}

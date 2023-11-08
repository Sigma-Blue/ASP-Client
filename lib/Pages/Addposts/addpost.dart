// import 'package:ap/Pages/Addposts/addImage.dart';
import 'package:ap/Pages/Addposts/addImage.dart';
import 'package:ap/Pages/Addposts/domain.dart';
import 'package:flutter/material.dart';

class addPost extends StatefulWidget {
  const addPost({super.key});

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Post",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [Icon(Icons.cancel)],
              )
            ]),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextFormField(
                minLines: 1,
                maxLines: 30,
                decoration: const InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
              ),
              TextFormField(
                minLines: 1,
                maxLines: 100,
                decoration: const InputDecoration(
                    labelText: 'Caption', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                child: const Text(
                  "Add Image",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const addImage()));
                },
              ),
              const SizedBox(height: 20),
              const domain(),
            ],
          )),
    );
  }
}

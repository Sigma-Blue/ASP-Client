import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String username;
  final String usertype;
  const Search({super.key, required this.username, required this.usertype});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 105, 101, 101),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey)),
            )),
      ),
      body: ListView.builder(
        itemCount: 13,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(""),
            ),
            title: Text(username),
            subtitle: Text(usertype),
          );
        },
      ),
    );
  }
}

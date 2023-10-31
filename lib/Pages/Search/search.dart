import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String Username;
  final String Usertype;
  const Search({super.key, required this.Username, required this.Usertype});

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
                  fillColor: Color.fromARGB(255, 105, 101, 101),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey)),
            )),
      ),
      body: ListView.builder(
        itemCount: 13,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(""),
            ),
            title: Text(Username),
            subtitle: Text(Usertype),
          );
        },
      ),
    );
  }
}

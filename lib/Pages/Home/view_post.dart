import 'package:flutter/material.dart';

class ViewPostsPage extends StatelessWidget {
  String username;
  String description;
  String about;
  ViewPostsPage(
      {super.key,
      required this.username,
      required this.description,
      required this.about});

  List linksList = [
    'https://github.com/ramana1718',
    'https://trello.com/b/aiZ6Cfza/sigma-blue',
    'https://www.linkedin.com/in/gokul-ramana-a89287247/',
    'https://github.com/ramana1718',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/coverpicture.png'),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Image.asset(
                'assets/images/coverpicture.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'About ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              about,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Links:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: linksList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    child: Text(
                  linksList[index],
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.dashed),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

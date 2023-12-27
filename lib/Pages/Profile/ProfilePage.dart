import 'package:ap/Pages/Profile/EditProfile/Edit_Profile.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  final double coverHeight = 210;
  final double profileHeight = 124;
  List linksList = [
    'https://github.com/ramana1718',
    'https://trello.com/b/aiZ6Cfza/sigma-blue'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ASP'),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'verifyUser',
                child: Text('Verify User'),
              ),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: 'logOut',
                child: Text('Log Out'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTop(),
            const SizedBox(height: 8.0),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'User Type',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Followers',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              '100',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      const Column(
                        children: [
                          Text(
                            'Following',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            '50',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16.0),
                      const Column(
                        children: [
                          Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            '200',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditProfile()));
                              },
                              icon: Icon(Icons.edit))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // ElevatedButton.icon(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.edit),
                  //   label: const Text('Edit Profile'),
                  // ),
                ],
              ),
            ),
            const DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'About'),
                      Tab(text: 'Skills'),
                      Tab(text: 'Experience'),
                      Tab(text: 'Education'),
                    ],
                  ),
                  SizedBox(
                    height: 300.0,
                    child: TabBarView(
                      children: [
                        // About Tab
                        Center(
                          child: Text('Detailed about of the user goes here'),
                        ),

                        // Skills Tab
                        Center(
                          child: Text('Skills: Flutter, Dart, UI/UX Design'),
                        ),

                        // Experience Tab
                        Center(
                          child: Text(
                              'Job: Software Developer\nDescription: Developing awesome Flutter apps'),
                        ),

                        // Education Tab
                        Center(
                          child: Text(
                              'School/College: XYZ School\nQualification: Bachelor\'s Degree in Computer Science'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Links Section
            const Center(
              child: Text(
                'Links:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: linksList.length,
              itemBuilder: (context, index) {
                return Text(linksList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

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

  Widget buildCoverImage() => Column(children: [
        SizedBox(
          child: Image.asset(
            'assets/images/coverpicture.png',
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover,
          ),
        ),
      ]);
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundImage: const AssetImage(
          'assets/images/profilepicture.jpg',
        ),
      );
}

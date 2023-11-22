import 'package:ap/Pages/Home/home_post.dart';
import 'package:ap/Pages/Home/view_post.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final nameList = [
    'John',
    'Leonal',
    'Jason',
    'Ravi',
    'Arjun',
    'Julie',
    'John',
    'Leonal',
    'Jason',
    'Ravi',
    'Arjun',
    'Julie',
    'John',
    'Leonal',
    'Jason',
    'Ravi',
    'Arjun',
  ];
  final List likesList = [
    154,
    65,
    76,
    853,
    543,
    86,
    75,
    90,
    8,
    87,
    12,
    34,
    52,
    65,
    43,
    76,
    21
  ];
  final List captionList = [
    'Hello Everyone',
    'I just got an intern',
    'Thank you for your support',
    'Hey welcome',
    'My third post',
    'I am sharing my experience',
    'heyy how are you',
    'Nice to meet u all',
    'Hii Everyone',
    'Nice to meet u all',
    'Hey welcome',
    'This is my First Post',
    'My third post',
    'Nice to meet u all',
    'This is my First Post',
    'Nice to meet u all',
    'Nice to meet u all',
  ];

  // ['John', 164, 'Hii Everyone'],
  //   ['John', 14, 'This is my First Post'],
  //   ['John', 164, 'Hello Everyone'],
  //   ['John', 172, 'I just got an intern'],
  //   ['John', 64, 'Thank you for your support'],
  //   ['John', 164, 'Hey welcome'],
  //   ['John', 283, 'My third post'],
  //   ['John', 398, 'I am sharing my experience'],
  //   ['John', 44, 'heyy how are you'],
  //   ['John', 894, 'Nice to meet u all'],
  //   ['John', 84, ''],
  //   ['John', 54, 'Hii Everyone'],
  //   ['John', 4, 'Hii Everyone'],
  //   ['John', 98, 'Hii Everyone'],
  //   ['John', 104, 'Hii Everyone'],
  //   ['John', 264, 'Hii Everyone'],
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ASP",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [Icon(Icons.notifications_active)],
                )
              ]),
        ),
        // ListView.builder(
        //       shrinkWrap: true,
        //       itemCount: linksList.length,
        //       itemBuilder: (context, index) {
        //         return Text(linksList[index]);
        //       },
        //     ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: nameList.length,
                  itemBuilder: (context, index) {
                    return Userpost(
                        name: nameList[index],
                        likes: likesList[index],
                        caption: captionList[index]);
                  }))
        ]));
  }
}

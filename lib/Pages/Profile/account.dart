// import 'package:ap/Pages/Profile/profile.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [Icon(Icons.settings)],
              )
            ]),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            '237',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('Followers',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '237',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('Following',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '237',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('Posts',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Gokul',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    'Student at Anna University',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ])),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: const Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

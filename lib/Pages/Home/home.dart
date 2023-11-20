import 'package:ap/Pages/Home/home_post.dart';
import 'package:ap/Pages/Home/view_post.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                children: [Icon(Icons.notifications_active)],
              )
            ]),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Userpost(
                          name: 'Gokul', likes: 199, caption: "Heyy Hii"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewPostsPage(
                                  username: "gokul",
                                  description: "kgbd",
                                  about:
                                      "lglighdagdklgbadkgbd g.kdsbgkidsbg.dksgbsd.kgbsdg")),
                        );
                      },
                    );
                  }))
        ],
      ),
    );
  }
}

import 'package:ap/Pages/Home/popup.dart';
import 'package:flutter/material.dart';

class UserPosts extends StatelessWidget {
  final String name;
  final String caption;
  final String likes;

  UserPosts({required this.name, required this.caption, required this.likes});
  bool like = false;
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
                  Icon(Icons.more_vert)
                ])
            // Profile Photo

            ),
        Padding(
          padding: EdgeInsets.all(0),
          child: Image.asset("assets/images/coverpicture.png"),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up_alt_outlined)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0)),
                  commentpopup(),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.bookmark_add_outlined)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Row(children: [
            Text(
              likes,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Row(children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              caption,
            )
          ]),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 16.0, top: 6.0),
        //   child: RichText(
        //       text: TextSpan(children: [
        //     TextSpan(
        //         text: name,
        //         style: TextStyle(
        //             color: Colors.black, fontWeight: FontWeight.bold)),
        //     TextSpan(text: caption, style: TextStyle(color: Colors.black)),
        //   ])),
        // )
      ],
    );
  }
}

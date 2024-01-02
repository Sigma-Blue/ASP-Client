import 'package:ap/Pages/Home/popup.dart';
import 'package:ap/Pages/Home/view_post.dart';
import 'package:ap/Pages/Profile/ProfilePage.dart';
import 'package:flutter/material.dart';

class Userpost extends StatefulWidget {
  final String name;
  final String caption;
  int likes;
  Userpost({
    Key? key,
    required this.name,
    required this.likes,
    required this.caption,
  }) : super(key: key);

  @override
  _postState createState() => _postState();
}

class _postState extends State<Userpost> {
  bool click = false;
  bool save = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/images/coverpicture.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                  ]),
                  const Icon(Icons.more_vert)
                ]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfilePage()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child:GestureDetector(
          child: Container(
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
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewPostsPage(username:'Gokul', description: "This is the view post page of the alumni student platform this is a small description of the post", about: '"This is the view post page of the alumni student platform this is a small description of the post. "This is the view post page of the alumni student platform this is a small description of the post. "This is the view post page of the alumni student platform this is a small description of the post"This is the view post page of the alumni student platform this is a small description of the post"This is the view post page of the alumni student platform this is a small description of the post"This is the view post page of the alumni student platform this is a small description of the post"This is the view post page of the alumni student platform this is a small description of the post')));
            }
        ),),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            click = !click;
                            if (click == true) {
                              widget.likes = widget.likes + 1;
                            } else {
                              widget.likes = widget.likes - 1;
                            }
                            print(click);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, right: .0),
                          child: Icon(
                            (click == false)
                                ? Icons.thumb_up_alt_outlined
                                : Icons.thumb_up,
                            size: 25,
                          ),
                        )),
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.0)),
                  const commentpopup(),
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      setState(() {
                        save = !save;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Icon(
                        (save == false)
                            ? Icons.bookmark_border
                            : Icons.bookmark,
                        size: 25,
                      ),
                    )),
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 0.0),
          child: Row(children: [
            Text(
              "${widget.likes} Likes",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 8),
          child: Row(children: [
            Text(
              "${widget.name} ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
              widget.caption,
              style: const TextStyle(fontSize: 17),
            ),
          ]),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    ));
  }
}

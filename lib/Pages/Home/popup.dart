import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';

class commentpopup extends StatefulWidget {
  const commentpopup({super.key});
  @override
  State<commentpopup> createState() => _commentpopupState();
}

class _commentpopupState extends State<commentpopup> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing:
                  Text(data[i]['date'], style: const TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(.0),
                  child: Icon(Icons.chat_bubble_outline),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("Comment Page"),
                            backgroundColor: Colors.blue,
                          ),
                          body: Container(
                            child: CommentBox(
                              labelText: 'Write a comment...',
                              errorText: 'Comment cannot be blank',
                              withBorder: false,
                              sendButtonMethod: () {
                                if (formKey.currentState!.validate()) {
                                  print(commentController.text);
                                  setState(() {
                                    var value = {
                                      'name': 'New User',
                                      'pic': 'https://picsum.photos/300/30',
                                      'message': commentController.text,
                                      'date': '2021-01-01 12:00:00'
                                    };
                                    filedata.insert(0, value);
                                  });
                                  commentController.clear();
                                  FocusScope.of(context).unfocus();
                                } else {
                                  print("Not validated");
                                }
                              },
                              formKey: formKey,
                              commentController: commentController,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              sendWidget: const Icon(Icons.send_sharp,
                                  size: 30, color: Colors.white),
                              child: commentChild(filedata),
                            ),
                          ),
                        );
                      });
                })));
  }
}

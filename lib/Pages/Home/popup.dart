import 'package:ap/Pages/Home/comments.dart';
import 'package:flutter/material.dart';

class commentpopup extends StatefulWidget {
  const commentpopup({super.key});

  @override
  State<commentpopup> createState() => _commentpopupState();
}

class _commentpopupState extends State<commentpopup> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 800,
                      child: Center(
                          child: Column(
                        children: [comments()],
                      )),
                    );
                  });
            }));
  }
}
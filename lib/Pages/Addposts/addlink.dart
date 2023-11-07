import 'package:flutter/material.dart';

class AddLink extends StatefulWidget {
  const AddLink({super.key});

  @override
  State<AddLink> createState() => _AddLinkState();
}

List links = [];

class _AddLinkState extends State<AddLink> {
  TextEditingController postlinkcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TextFormField(
          controller: postlinkcontroller,
          decoration: const InputDecoration(
              labelText: 'Link', border: OutlineInputBorder()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 260),
          child: ElevatedButton(
              onPressed: () {
                print(postlinkcontroller.text);
                links.add(postlinkcontroller.text);
                print(links);
              },
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Add Link"),
              )),
        ),
        for (var i = 0; i < links.length; i++)
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(links[i]),
            ),
          ),
      ],
    ));
  }
}

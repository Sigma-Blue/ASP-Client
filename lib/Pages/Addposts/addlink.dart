import 'package:ap/Pages/Addposts/sample.dart';
import 'package:flutter/material.dart';

class AddLink extends StatefulWidget {
  const AddLink({super.key});

  @override
  State<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends State<AddLink> {
  TextEditingController _textFieldController = TextEditingController();
  List<String> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add the links here'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Links',
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _addItemToList();
                  },
                  child: Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(itemList[index]),
                  );
                },
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(
            //           builder: (BuildContext context) => const AddPost()),
            //     );
            //   },
            //   child: const Text("Add Link"),
            // ),
          ],
        ),
      ),
    );
  }

  void _addItemToList() {
    String newItem = _textFieldController.text.trim();
    if (newItem.isNotEmpty) {
      setState(() {
        itemList.add(newItem);
        _textFieldController.clear();
      });
    }
  }
}

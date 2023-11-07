import 'package:ap/login/loginscreen.dart';
import 'package:flutter/material.dart';

class cancelbutton extends StatelessWidget {
  const cancelbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(left: 80, right: 20),
            decoration: const BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "CANCEL",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )),
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen()));
        });
  }
}

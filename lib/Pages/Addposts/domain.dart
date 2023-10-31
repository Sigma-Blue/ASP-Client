import 'package:flutter/material.dart';

class domain extends StatefulWidget {
  const domain({super.key});

  @override
  State<domain> createState() => _domainState();
}

class _domainState extends State<domain> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = 1;
                        });
                      }),
                  SizedBox(height: 10),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = 2;
                        });
                      }),
                  SizedBox(height: 10),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 3,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = 3;
                        });
                      }),
                  SizedBox(height: 10),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 4,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = 4;
                        });
                      }),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

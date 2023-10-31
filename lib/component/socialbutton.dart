import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon icons;

  const SocialButton({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icons,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: icons,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
          ),
        ));
  }
}
// decoration: InputDecoration(
//                     labelText: 'Title',
//                      border: OutlineInputBorder())
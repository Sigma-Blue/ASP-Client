import 'package:ap/login/loginscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login page',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

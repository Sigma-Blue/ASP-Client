import 'package:ap/Register/register_page.dart';
import 'package:ap/login/login_page.dart';
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
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen()
      },
    );
  }
}

// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:ap/Pages/Home/HomeScreen.dart';
import 'package:ap/Register/register_page.dart';
import 'package:ap/login/forget_password_email.dart';
// import 'package:ap/component/social_button.dart';
// import 'package:ap/login/login_button.dart';
// import 'package:ap/Home/pages/profile.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordObscured = true;
  String passwordErrorValue = "";
  String unameErrorValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Alumni Student platform",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [Icon(Icons.info_outline)],
              )
            ]),
      ),
      body: Form(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("Welcome back",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ])),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("SignIn to continue exploring",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 20,
                      )),
                ])),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      if (value.contains(' ')) {
                        unameErrorValue = "Don't use blank spaces";
                      } else {
                        unameErrorValue = "";
                      }
                    });
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                    errorText: unameErrorValue.isEmpty ? null : unameErrorValue,
                    prefixIcon: const Icon(Icons.account_circle_outlined),
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
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Username',
                  )),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    if (value.contains(' ')) {
                      passwordErrorValue = "Don't use blank spaces";
                    } else {
                      passwordErrorValue = "";
                    }
                  });
                },
                controller: passwordController,
                decoration: InputDecoration(
                  errorText:
                      passwordErrorValue.isEmpty ? null : passwordErrorValue,
                  prefixIcon: const Icon(Icons.lock),
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
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordObscured = !isPasswordObscured;
                      });
                    },
                    icon: Icon(isPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                obscureText: isPasswordObscured,
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              child: const Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 200.0),
                  child: Text('ForgotPassword?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 15)),
                ),
              ]),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text("Email"),
                        ),
                        body: const ForgotPassEmail(),
                      );
                    });
              },
            ),
            const SizedBox(height: 40),
            myButton(),
            const SizedBox(height: 25),
            const Text(
              "Don't have an account ?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            GestureDetector(
              child: const Text(
                "Click here to Sign Up !!!",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => const RegisterScreen()));
              },
            )
          ],
        ),
      )),
    );
  }

  Widget myButton() {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            10), // Adjust the radius for desired curvature
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 120),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(
                10), // Apply the same radius for consistency
          ),
          child: const Center(
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        var userName = usernameController.text;
        var password = passwordController.text;
        print("username is $userName");
        print("password is $password");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()),
        );
      },
    );
  }
}

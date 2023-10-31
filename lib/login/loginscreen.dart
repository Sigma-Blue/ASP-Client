import 'package:ap/Pages/Home/HomeScreen.dart';
import 'package:ap/Register/registerscreen.dart';
import 'package:ap/component/socialbutton.dart';
// import 'package:ap/login/login_button.dart';
// import 'package:ap/Home/pages/profile.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 140),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Welcome back",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ])),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("SignIn to continue exploring",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              fontSize: 20,
                            )),
                      ])),
              const SizedBox(height: 50),
              SocialButton(
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
                icons: Icon(Icons.account_circle_outlined),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
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
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordObscured
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordObscured = !isPasswordObscured;
                          });
                        },
                      ),
                    )),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text('ForgotPassword?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 15)),
                ]),
              ),
              const SizedBox(height: 25),
              myButton(),
              const SizedBox(height: 35),
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
                      builder: (BuildContext context) => RegisterScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myButton() {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 90),
          decoration: const BoxDecoration(color: Colors.blue),
          child: const Center(
            child: Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          )),
      onTap: () {
        var userName = usernameController.text;
        var password = passwordController.text;
        print("username is " + userName);
        print("password is " + password);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      },
    );
  }
}

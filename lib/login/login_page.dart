// ignore_for_file: avoid_print

import 'package:ap/config.dart';
import 'package:ap/login/forget_password_email.dart';
import 'package:ap/models/login_request_model.dart';
import 'package:ap/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;

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
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "Alumni Student platform",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              child: const Icon(Icons.info_outline),
            ),
          ]),
        ),
        body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          key: UniqueKey(),
          child: Form(
              key: globalFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Welcome back",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
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
                            errorText: unameErrorValue.isEmpty
                                ? null
                                : unameErrorValue,
                            prefixIcon:
                                const Icon(Icons.account_circle_outlined),
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
                          errorText: passwordErrorValue.isEmpty
                              ? null
                              : passwordErrorValue,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/register', (route) => false);
                      },
                    )
                  ],
                ),
              )),
        ));
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
        if (validateAndSave()) {
          setState(() {
            isApiCallProcess = true;
          });

          var userName = usernameController.text;
          var password = passwordController.text;

          if (userName.isEmpty || password.isEmpty) {
            FormHelper.showSimpleAlertDialog(
              context,
              Config.appName,
              "Enter values in all the inputs",
              "OK",
              () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false)
              },
            );
          } else {
            LoginRequestModel model =
                LoginRequestModel(userName: userName, password: password);

            print("Before login API call");
            ApiService.login(model).then((res) {
              print("After login API call");
              print("response $res");
              setState(() {
                isApiCallProcess = false;
              });

              if (res != null && res.status.contains('Success')) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              } else {
                FormHelper.showSimpleAlertDialog(
                  context,
                  Config.appName,
                  "UserName or Password Incorrect",
                  "OK",
                  () => {Navigator.pop(context)},
                );
              }
            });
          }
        }
      },
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

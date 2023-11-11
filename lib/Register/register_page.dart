// ignore_for_file: library_private_types_in_public_api

import 'package:ap/Register/otp_slide.dart';
// import 'package:ap/Register/register_button.dart';
import 'package:ap/login/login_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String regexPasswordErrorValue = '';
  String regexUserNameErrorValue = '';
  String regexEmailValue = '';
  String regexRollNoValue = '';
  String regexConfirmPasswordErrorValue = '';
  TextEditingController registerNoController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordObscured = false;
  bool isConfirmPasswordObscured = false;
  bool isSuccess = true;
  bool isEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Alumni Student Platform",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [Icon(Icons.info_rounded)],
              )
            ]),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 0),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("Welcome to ........",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ])),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("SignUp to explore our app",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 20,
                      )),
                ])),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      if (value.contains(' ')) {
                        regexUserNameErrorValue = "Don't use blank spaces";
                      } else {
                        regexUserNameErrorValue = "";
                      }
                    });
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                    errorText: regexUserNameErrorValue.isEmpty
                        ? null
                        : regexUserNameErrorValue,
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1,
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      isEmail =
                          EmailValidator.validate(emailController.text.trim());
                      if (isEmail) {
                        regexEmailValue = "";
                      } else {
                        isEmail = false;
                        regexEmailValue = "enter a valid emailId";
                      }
                    });
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    errorText: isEmail ? null : regexEmailValue,
                    prefixIcon: const Icon(Icons.email),
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
                    labelText: 'emailId',
                  )),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    if (isSuccess == false) {
                      regexPasswordErrorValue =
                          "Enter password with at least a Upper \ncase,lower case,numeric and special character";
                    } else {
                      regexPasswordErrorValue = "";
                    }
                  });
                },
                controller: passwordController,
                decoration: InputDecoration(
                  errorText: isSuccess ? null : regexPasswordErrorValue,
                  prefixIcon: isSuccess
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.lock_open),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1,
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
                      setState(
                        () {
                          isPasswordObscured = !isPasswordObscured;
                        },
                      );
                    },
                    icon: Icon(isPasswordObscured
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                obscureText: isPasswordObscured,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        regexConfirmPasswordErrorValue = "";
                      } else {
                        regexConfirmPasswordErrorValue =
                            "Password does not match";
                      }
                    });
                  },
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    errorText: regexConfirmPasswordErrorValue.isEmpty
                        ? null
                        : regexConfirmPasswordErrorValue,
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1,
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
                    labelText: 'ConfirmPassword',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            isConfirmPasswordObscured =
                                !isConfirmPasswordObscured;
                          },
                        );
                      },
                      icon: Icon(isConfirmPasswordObscured
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  obscureText: isConfirmPasswordObscured),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, top: 8.0, right: 80),
              child: FlutterPwValidator(
                  uppercaseCharCount: 1,
                  lowercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  width: 0,
                  height: 0,
                  minLength: 8,
                  onSuccess: () {
                    setState(() {
                      isSuccess = true;
                    });
                  },
                  onFail: () {
                    setState(() {
                      isSuccess = false;
                    });
                  },
                  controller: passwordController),
            ),
            const SizedBox(height: 30),
            myButton(),
            const SizedBox(height: 25),
            const Text(
              "Already have an account ?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                child: const Text(
                  "Click here to Sign In !!!",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()));
                },
              ),
            )
          ],
        )),
      ),
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
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        var registerNo = registerNoController.text;
        var username = usernameController.text;
        var emailId = emailController.text;
        var password = passwordController.text;
        var confirmPassword = confirmPasswordController.text;
        // ignore: avoid_print
        print(registerNo + username + emailId + password + confirmPassword);
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [Icon(Icons.cancel)],
                    )
                  ],
                ),
              ),
              body: const OtpPopup(),
            );
          },
        );
      },
    );
  }
}

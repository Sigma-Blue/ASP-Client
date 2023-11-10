import 'package:ap/Register/otpscreen.dart';
import 'package:ap/component/cancelbutton.dart';
import 'package:ap/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String regpasserrorTextval = '';
  String regcpasserrorTextval = '';
  bool isPasswordObscured = false;
  bool isConfirmPasswordObscured = false;
  bool isSuccess = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  if (isSuccess == false) {
                    regpasserrorTextval =
                        "Enter password with atleast a Upper \ncase,lower case,numeric and special character";
                  } else {
                    regpasserrorTextval = "";
                  }
                });
              },
              controller: passwordController,
              decoration: InputDecoration(
                errorText: isSuccess ? null : regpasserrorTextval,
                prefixIcon:
                    isSuccess ? Icon(Icons.lock) : Icon(Icons.lock_open),
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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    if (passwordController.text == confirmpassController.text) {
                      regcpasserrorTextval = "";
                    } else {
                      regcpasserrorTextval = "Password does not match";
                    }
                  });
                },
                controller: confirmpassController,
                decoration: InputDecoration(
                  errorText: regcpasserrorTextval.isEmpty
                      ? null
                      : regcpasserrorTextval,
                  prefixIcon: Icon(Icons.lock),
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
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 0),
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
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Adjust the radius for desired curvature
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 65, right: 50),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10), // Apply the same radius for consistency
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
              ),
              GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Adjust the radius for desired curvature
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 50, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10), // Apply the same radius for consistency
                    ),
                    child: Center(
                      child: Text(
                        "RESET",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          )


        ]),
      ),
    ));
  }
}

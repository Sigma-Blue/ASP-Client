import 'package:ap/Register/otpscreen.dart';
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
  String regemailTextval = '';
  String regcpasserrorTextval = '';
  bool isPasswordObscured = false;
  bool isConfirmPasswordObscured = false;
  bool isSuccess = true;
  bool isEmail = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ASP",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [Icon(Icons.cancel)],
                )
              ]),
        ),
        body: Container(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        isEmail = EmailValidator.validate(
                            emailController.text.trim());
                        if (isEmail) {
                          regemailTextval = "";
                        } else {
                          isEmail = false;
                          regemailTextval = "enter a valid emailId";
                        }
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      errorText: isEmail ? null : regemailTextval,
                      prefixIcon: Icon(Icons.email),
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
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
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (passwordController.text ==
                            confirmpassController.text) {
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
              GestureDetector(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 140, right: 140),
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: Center(
                        child: Text(
                          "RESET",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      )),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => OtpScreen()));
                  })
            ]),
          ),
        ));
  }
}

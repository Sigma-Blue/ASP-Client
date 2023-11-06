import 'package:ap/Register/otpscreen.dart';
import 'package:ap/component/socialbutton.dart';
// import 'package:ap/Register/register_button.dart';
import 'package:ap/login/loginscreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:email_validator_flutter/email_validator_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String regpasserrorTextval = '';
  String regunameerrorTextval = '';
  String regemailTextval = '';
  String regrollnoval = '';
  String regcpasserrorTextval = '';
  TextEditingController registernoController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  bool isPasswordObscured = false;
  bool isConfirmPasswordObscured = false;
  bool isSuccess = true;
  bool isEmail = true;
  // bool validateEmail() {
  //   isEmail = EmailValidator.validate(emailController.text.trim());
  //   if (isEmail) {
  //     return true;
  //   } else {
  //     ;
  //     return false;
  //   }
  // }

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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [Icon(Icons.info_rounded)],
              )
            ]),
      ),
      body: Container(
        child: Center(
          child: Container(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              const SizedBox(height: 0),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Welcome to ........",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ])),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("SignUp to explore our app",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              fontSize: 20,
                            )),
                      ])),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.contains(' ')) {
                          regunameerrorTextval = "Dont use blank spaces";
                        } else {
                          regunameerrorTextval = "";
                        }
                      });
                    },
                    controller: usernameController,
                    decoration: InputDecoration(
                      errorText: regunameerrorTextval.isEmpty
                          ? null
                          : regunameerrorTextval,
                      prefixIcon: Icon(Icons.account_circle_outlined),
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
              // SocialButton(
              //   controller: registernoController,
              //   hintText: "Register Number",
              //   obscureText: false,
              //   icons: Icon(Icons.numbers),
              // ),
              const SizedBox(height: 20),
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
              // SocialButton(
              //   controller: usernameController,
              //   hintText: "Username",
              //   obscureText: false,
              //   icons: Icon(Icons.account_circle_outlined),
              // ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.contains(' ')) {
                          regrollnoval = "Dont use blank spaces";
                        } else {
                          regrollnoval = "";
                        }
                      });
                    },
                    controller: registernoController,
                    decoration: InputDecoration(
                      errorText: regrollnoval.isEmpty ? null : regrollnoval,
                      prefixIcon: Icon(Icons.numbers),
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
                      labelText: 'RegisterNumber',
                    )),
              ),
              // SocialButton(
              //   controller: emailController,
              //   hintText: "name@domainname",
              //   obscureText: false,
              //   icons: Icon(Icons.email_outlined),
              // ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),
              mybutton(),
              const SizedBox(height: 15),
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
                        builder: (BuildContext context) => LoginScreen()));
                  },
                ),
              )
            ],
          ))),
        ),
      ),
    );
  }

  Widget mybutton() {
    return GestureDetector(
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            )),
        onTap: () {
          var registerno = registernoController.text;
          var username = usernameController.text;
          var emailId = emailController.text;
          var password = passwordController.text;
          var cpass = confirmpassController.text;
          print(registerno + username + emailId + password + cpass);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => OtpScreen()));
        });
  }
}

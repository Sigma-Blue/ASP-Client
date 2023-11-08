// import 'package:ap/component/socialbutton.dart';
// import 'package:ap/Register/register_button.dart';
import 'package:ap/login/loginscreen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

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
  bool isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
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
                          regrollnoval = "Dont use blank spaces";
                        } else {
                          regrollnoval = "";
                        }
                      });
                    },
                    controller: usernameController,
                    decoration: InputDecoration(
                      errorText: regrollnoval.isEmpty ? null : regrollnoval,
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
                          width: 4,
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
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Username',
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
                          regemailTextval = "Dont use blank spaces";
                        } else {
                          regemailTextval = "";
                        }
                      });
                    },
                    controller: usernameController,
                    decoration: InputDecoration(
                      errorText:
                          regemailTextval.isEmpty ? null : regemailTextval,
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
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Username',
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
                        if (value.contains(' ')) {
                          regpasserrorTextval = "Dont use blank spaces";
                        } else {
                          regpasserrorTextval = "";
                        }
                      });
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      errorText: regpasserrorTextval.isEmpty
                          ? null
                          : regpasserrorTextval,
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
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
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'ConfirmPassword',
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
              const SizedBox(height: 25),
              mybutton(),
              const SizedBox(height: 35),
              const Text(
                "Already have an account ?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              GestureDetector(
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
              )
            ],
          ),
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
              builder: (BuildContext context) => const LoginScreen()));
        });
  }
}

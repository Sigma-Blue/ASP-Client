// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:ap/Register/otp_slide.dart';
import 'package:ap/config.dart';
// import 'package:ap/Register/register_button.dart';
import 'package:ap/models/register_request_model.dart';
import 'package:ap/models/send_mail_model.dart';
import 'package:ap/services/api_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isNoUserNameError = true;
  bool isNoEmailError = true;
  bool isNoPasswordError = true;
  bool isNoConfirmPasswordError = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String regexPasswordErrorValue = '';
  String regexUserNameErrorValue = '';
  String regexEmailValue = '';
  String regexConfirmPasswordErrorValue = '';
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;
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
      body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
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
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          if (value.contains(' ')) {
                            isNoUserNameError = false;
                            regexUserNameErrorValue = "Don't use blank spaces";
                          } else {
                            isNoUserNameError = true;
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
                          isEmail = EmailValidator.validate(
                              emailController.text.trim());
                          if (isEmail) {
                            isNoEmailError = true;
                            regexEmailValue = "";
                          } else {
                            isEmail = false;
                            isNoEmailError = false;
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
                          isNoPasswordError = false;
                          regexPasswordErrorValue =
                              "Enter password with at least a Upper \ncase,lower case,numeric and special character";
                        } else {
                          isNoPasswordError = true;
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
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                            isNoConfirmPasswordError = true;
                            regexConfirmPasswordErrorValue = "";
                          } else {
                            isNoConfirmPasswordError = false;
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
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      obscureText: isConfirmPasswordObscured),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 0),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 80.0, top: 8.0, right: 80),
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
                          isNoPasswordError = true;
                          isSuccess = true;
                        });
                      },
                      onFail: () {
                        setState(() {
                          isNoPasswordError = false;
                          isSuccess = false;
                        });
                      },
                      controller: passwordController),
                ),
                const SizedBox(height: 30),
                myButton(),
                const SizedBox(height: 25),
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    },
                  ),
                )
              ],
            )),
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
        if (validateAndSave()) {
          setState(() {
            isApiCallProcess = true;
          });

          var userName = usernameController.text;
          var password = passwordController.text;
          var emailId = emailController.text;

          if (userName.isEmpty || password.isEmpty || emailId.isEmpty) {
            FormHelper.showSimpleAlertDialog(
              context,
              Config.appName,
              "Enter values in all the inputs",
              "OK",
              () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/register', (route) => false)
              },
            );
          } else if (!isNoUserNameError ||
              !isNoEmailError ||
              !isNoPasswordError ||
              !isNoConfirmPasswordError) {
            FormHelper.showSimpleAlertDialog(
              context,
              Config.appName,
              "Please Enter Valid Value",
              "OK",
              () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/register', (route) => false)
              },
            );
          } else {
            RegisterRequestModel model = RegisterRequestModel(
                userName: userName, email: emailId, password: password);

            print("Before register API call");

            ApiService.register(model).then((res) {
              print("After register API call");
              print("response $res");

              setState(() {
                isApiCallProcess = false;
              });

              if (res.status.contains('Success')) {
                SendMailModel model = SendMailModel(email: emailId);

                print("Before send email API call");

                ApiService.sendMail(model).then((res) {
                  print("After send email API call");
                  print("response $res");

                  setState(() {
                    isApiCallProcess = false;
                  });

                  if (res.status.contains('Success')) {
                    FormHelper.showSimpleAlertDialog(
                      context,
                      Config.appName,
                      "OTP send To your email",
                      "OK",
                      () => {
                        Navigator.pop(context),
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                elevation: 0,
                                title: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              body: OtpPopup(email: emailId),
                            );
                          },
                        )
                      },
                    );
                  } else {
                    FormHelper.showSimpleAlertDialog(
                      context,
                      Config.appName,
                      res.message,
                      "OK",
                      () => {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/register', (route) => false)
                      },
                    );
                  }
                });
              } else {
                if (res.message.contains('already Exists')) {
                  const Text(
                    "Already have an account ?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  );
                }
                FormHelper.showSimpleAlertDialog(
                  context,
                  Config.appName,
                  res.message,
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

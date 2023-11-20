// ignore_for_file: avoid_print

import 'package:ap/config.dart';
import 'package:ap/login/forgot_password_otp.dart';
import 'package:ap/models/send_mail_model.dart';
import 'package:ap/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class ForgotPassEmail extends StatefulWidget {
  const ForgotPassEmail({Key? key}) : super(key: key);

  @override
  State<ForgotPassEmail> createState() => _ForgotPassEmailState();
}

class _ForgotPassEmailState extends State<ForgotPassEmail> {
  String regexEmailValue = '';
  bool isEmail = true;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center the entire column
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                  ),
                ),
              ),
              const SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  var emailId = emailController.text;
                  if (emailId.isEmpty) {
                    FormHelper.showSimpleAlertDialog(
                      context,
                      'Invalid Input',
                      "Enter the email ",
                      "OK",
                      () => {
                        Navigator.pop(context),
                      },
                    );
                  } else {
                    SendMailModel model = SendMailModel(email: emailId);

                    print("Before send email API call");

                    ApiService.sendMail(model).then((res) {
                      print("After send email API call");
                      print("response $res");

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
                                            title: const Text("OTP"),
                                          ),
                                          body: ForgetOtpPopup(
                                            email: emailId,
                                          ));
                                    },
                                  ),
                                });
                      }
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

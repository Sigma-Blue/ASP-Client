import 'package:ap/Register/otpslide.dart';
import 'package:ap/login/forgotOtp.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPassEmail extends StatefulWidget {
  const ForgotPassEmail({super.key});

  @override
  State<ForgotPassEmail> createState() => _ForgotPassEmailState();
}

class _ForgotPassEmailState extends State<ForgotPassEmail> {
  String regemailTextval = '';
  bool isEmail = true;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: TextFormField(
            onChanged: (value) {
              setState(() {
                isEmail = EmailValidator.validate(emailController.text.trim());
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
      GestureDetector(
          child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 50, left: 120, right: 120),
              decoration: const BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              )),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("OTP"),
                    ),
                    body: forgotOtpPopup(),
                  );
                });
          })
    ]))));
  }
}

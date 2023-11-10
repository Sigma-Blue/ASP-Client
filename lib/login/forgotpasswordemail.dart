import 'package:ap/Register/otpslide.dart';
import 'package:ap/login/forgotOtp.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPassEmail extends StatefulWidget {
  const ForgotPassEmail({Key? key}) : super(key: key);

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
      body: Center( // Center the entire column
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
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
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'emailId',
                  ),
                ),
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("OTP"),
                        ),
                        body: forgotOtpPopup(),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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



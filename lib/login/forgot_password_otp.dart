// ignore_for_file: camel_case_types, avoid_print

import 'package:ap/config.dart';
import 'package:ap/login/forgot_password.dart';
import 'package:ap/models/verify_otp_model.dart';
import 'package:ap/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class ForgetOtpPopup extends StatefulWidget {
  // const ForgetOtpPopup({super.key});

  final String email;
  const ForgetOtpPopup({super.key, required this.email});

  @override
  State<ForgetOtpPopup> createState() => _ForgetOtpPopupState();
}

class _ForgetOtpPopupState extends State<ForgetOtpPopup> {
  bool isOtpMatch = true;
  String otpErrorValue = '';
  TextEditingController otpNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 120, left: 50, right: 50),
          child: TextFormField(
              onChanged: (value) {
                setState(() {
                  if (!isOtpMatch) {
                    otpErrorValue = "OTP does not match";
                  } else {
                    isOtpMatch;
                    otpErrorValue = "";
                  }
                });
              },
              controller: otpNoController,
              decoration: InputDecoration(
                errorText: otpErrorValue.isEmpty ? null : otpErrorValue,
                prefixIcon: const Icon(Icons.numbers),
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
                labelText: 'Enter OTP',
              )),
        ),
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                20), // Adjust the radius for desired curvature
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 50, left: 120, right: 120),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                    10), // Apply the same radius for consistency
              ),
              child: const Center(
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
          ),
          onTap: () {
            var otp = otpNoController.text;
            var emailId = widget.email;
            print("email in otp : $emailId");
            print("otp : $otp");

            if (otp.isEmpty) {
              FormHelper.showSimpleAlertDialog(
                context,
                'Invalid Input',
                "Enter the otp ",
                "OK",
                () => {
                  Navigator.pop(context),
                },
              );
            } else {
              VerifyOtpModel model =
                  VerifyOtpModel(otpToken: otp, email: widget.email);

              print("Before verify otp API call");
              ApiService.verifyOtp(model).then((res) {
                print("After verify otp API call");
                print("response $res");

                if (res.status.contains('Success')) {
                  {
                    setState(() {
                      isOtpMatch = true;
                    });
                  }

                  Navigator.pop(context);

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text("Reset Password"),
                        ),
                        body: ForgotPassword(
                          email: emailId,
                        ),
                      );
                    },
                  );
                } else {
                  FormHelper.showSimpleAlertDialog(
                    context,
                    Config.appName,
                    "OTP is not valid",
                    "OK",
                    () => {Navigator.pop(context), Navigator.of(context)},
                  );
                }
              });
            }
          },
        ),
      ]),
    ));
  }
}

//  FormHelper.showSimpleAlertDialog(
//                     context,
//                     Config.appName,
//                     "Password Reset Successful. Please login in to the account :)",
//                     "OK",
//                     () => {
//                       Navigator.pushNamedAndRemoveUntil(
//                           context, '/login', (route) => false)
//                     },
//                   );
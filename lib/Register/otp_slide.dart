// ignore_for_file: avoid_print

import 'package:ap/config.dart';
import 'package:ap/models/verify_otp_model.dart';
import 'package:ap/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class OtpPopup extends StatefulWidget {
  // const OtpPopup({super.key});
  final String email;

  const OtpPopup({super.key, required this.email});
  @override
  State<OtpPopup> createState() => _OtpPopupState();
}

class _OtpPopupState extends State<OtpPopup> {
  bool isOtpMatch = true;

  String otpErrorValue = '';
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
          child: TextFormField(
              controller: otpController,
              decoration: InputDecoration(
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
                10), // Adjust the radius for desired curvature
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
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            var otp = otpController.text;
            print("email : $widget.email");
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

              print("Before login API call");
              ApiService.verifyOtp(model).then((res) {
                print("After login API call");
                print("response $res");

                if (res.status.contains('Success')) {
                  {
                    setState(() {
                      isOtpMatch = true;
                    });
                  }
                  FormHelper.showSimpleAlertDialog(
                    context,
                    Config.appName,
                    "Registration Successful. Please login in to the account :)",
                    "OK",
                    () => {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false)
                    },
                  );
                } else {
                  FormHelper.showSimpleAlertDialog(
                    context,
                    Config.appName,
                    "OTP is not valid",
                    "OK",
                    () => {Navigator.pop(context)},
                  );
                }
              });
            }
          },
        )
      ]),
    ));
  }
}

import 'package:ap/login/forgot_password.dart';
import 'package:flutter/material.dart';

class forgotOtpPopup extends StatefulWidget {
  const forgotOtpPopup({super.key});

  @override
  State<forgotOtpPopup> createState() => _forgotOtpPopupState();
}

class _forgotOtpPopupState extends State<forgotOtpPopup> {
  String otpErrorTextval = '';
  TextEditingController OtpNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 50, right: 50),
            child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    if (OtpNoController.text != "00987") {
                      otpErrorTextval = "OTP does not match";
                    } else {
                      otpErrorTextval = "";
                    }
                  });
                },
                controller: OtpNoController,
                decoration: InputDecoration(
                  errorText: otpErrorTextval.isEmpty ? null : otpErrorTextval,
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
                child: Center(
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
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("Reset Password"),
                    ),
                    body: ForgotPassword(),
                  );
                },
              );
            },
          ),
        ]),
      ),
    ));
  }
}

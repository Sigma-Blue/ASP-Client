import 'package:ap/login/login_page.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpErrorValue = '';
  TextEditingController otpNoController = TextEditingController();
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
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 70, right: 70),
            child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    if (otpNoController.text != "00987") {
                      otpErrorValue = "OTP does not match";
                    } else {
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
                  30), // Adjust the radius for desired curvature
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 50, left: 120, right: 120),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                      30), // Apply the same radius for consistency
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
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const LoginScreen()));
            },
          )
        ]));
  }
}

import 'package:ap/component/appBar.dart';
import 'package:ap/login/loginscreen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpErrorTextval = '';
  TextEditingController OtpNoController = TextEditingController();
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
        body: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 70, right: 70),
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
                child: Container(
                    padding: const EdgeInsets.all(8),
                    margin:
                        const EdgeInsets.only(top: 50, left: 120, right: 120),
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                }),
          ]),
        ));
  }
}

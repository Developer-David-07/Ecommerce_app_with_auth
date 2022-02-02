import 'dart:math';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                              height: 70,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Image.asset(
                              'assets/images/banner_1.jpg',
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width,
                              height: 170,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,

                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  labelText: 'Email',
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  // filled: true,
                                  border: OutlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // errorText: 'Error message',
                                  // border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 26.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    primary: Theme.of(context).primaryColor,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15),
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                onPressed: () {

                                },
                                child: Text('Submit'),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 26.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Back to",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    child: Text('Sign In',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white.withOpacity(0.4)),
                      height: 50,
                      width: 50,
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          // setState(() {
                          //   _volume += 10;
                          // });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

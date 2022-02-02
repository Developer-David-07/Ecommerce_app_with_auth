import 'package:base_app/ui/screens/home.dart';
import 'package:flutter/material.dart';

import 'signin_page.dart';
import 'signup_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  height: 80,
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/banner_1.jpg',
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "ஒன்றிணைவோம்",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'பெண்களின் மனதை அறியும் நூல் எந்த நூலகத்திலும் இல்லை',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        primary: Theme.of(context).primaryColor,
                        padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInPage()),
                      );
                    },
                    child: Text('Sign In'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        primary: Colors.white,
                        onPrimary: Theme.of(context).primaryColor,
                        padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    onPressed: () {

                      // Respond to button press
                    },
                    child: Text('Sign Up'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 26.0),
                //   child: Align(
                //     alignment: Alignment.bottomRight,
                //     child: TextButton(
                //       style: TextButton.styleFrom(
                //           textStyle: TextStyle(fontSize: 20)),
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => IndexPage(title: 'BNET'),
                //           ),
                //         );
                //         // Respond to button press
                //       },
                //       child: Text("Skip",
                //           style:
                //               TextStyle(color: Theme.of(context).primaryColor)),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

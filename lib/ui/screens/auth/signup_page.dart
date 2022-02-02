import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  height: 80,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      label: Text('Full Name'),
                      fillColor: Colors.grey.withOpacity(0.3),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      label: Text('Email'),
                      fillColor: Colors.grey.withOpacity(0.3),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your number',
                      label: Text('Phone Number'),
                      fillColor: Colors.grey.withOpacity(0.3),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // fillColor: Colors.grey.withOpacity(0.3),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      // filled: true,
                      hintText: 'Enter your password',
                      label: Text('Password'),
                      // Here is key idea
                      border: OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            FontAwesomeIcons.eye,
                              color: Theme.of(context).primaryColor
                            // Color.fromRGBO(10, 96, 195, 1),
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable

                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.text, //This will obscure text dynamically
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.3),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      // filled: true,
                      hintText: 'Enter your confirm password',
                      label: Text('Confirm Password'),
                      // Here is key idea
                      border: OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.eye,
                              color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // CheckboxListTile(
                //   title: Text("I agree to the Terms & Conditions"),
                //   value: isChecked,
                //   // checkColor: Theme.of(context).primaryColor,
                //   activeColor: Theme.of(context).primaryColor,
                //
                //   controlAffinity:
                //   ListTileControlAffinity.leading, //  <-- leading Checkbox
                // ),
                SizedBox(
                  height: 35,
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
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                    onPressed: () {

                    },
                    child: Text('Sign Up'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Back to",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        child: Text('Sign In',
                            style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

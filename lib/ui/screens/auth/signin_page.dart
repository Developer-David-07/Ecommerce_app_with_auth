import 'dart:async';
import 'dart:convert';

import 'package:base_app/ui/screens/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config.dart';
import '../index.dart';
import 'forget_password.dart';
import 'signup_page.dart';

var userLoggedIn = false;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();

  var _passwordVisible;




  //google login process
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> _handleSignIn() async {
    print('google sign start');
    print(_googleSignIn.signInOption);
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  String email = '';
  String pass = '';
  bool seen = false;
  late BuildContext loaderContext;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    checkFirstSeen();
  }

  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    seen = _seen;
    if (_seen) {
      //   userLogged ? IndexPage(title: 'BNET') : SignInPage();
    } else {
      await prefs.setBool('seen', true);
      //   FirstPage();
    }
    return seen;
  }

  //Login api integration
  login(String email, String pass) async {
    var baseUrl = Env.value!.baseUrl;
    final bool isValid = EmailValidator.validate(email);
    print(isValid);
    if (email.isNotEmpty && pass.isNotEmpty) {
      loaderWidget();
      if (isValid) {
        var loginUrl = Uri.parse(baseUrl! + '/login');
        http.post(loginUrl, headers: {
          'Accept': 'application/json',
          // 'authorization': 'pass your key(optional)'
        }, body: {
          "email": email.toString(),
          "password": pass.toString()
        }).then((response) async {
          print('after login');
          print(response.statusCode);
          print(response.body);
          var res = json.decode(response.body);
          print(res['message']);
          if (response.statusCode == 200 || response.statusCode == 201) {
            userLoggedIn = true;
            SharedPreferences loginData = await SharedPreferences.getInstance();
            SharedPreferences userData = await SharedPreferences.getInstance();
            loginData.setBool('userLoggedIn', true);
            var userInfo = [
              res["userDetails"]['user_name'].toString(),
              res["userDetails"]['id'].toString(),
              res["userDetails"]['profile_image'].toString(),
              res["userDetails"]['token'].toString(),
            ];
            userData.setStringList('userDetails', userInfo);
            showInSnackBar(res["message"]);
            Timer(Duration(milliseconds: 2100), () {
              print("Yeah, this line is printed after 3 seconds");
              Phoenix.rebirth(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndexPage(title: 'BNET'),
                ),
              );
              showInSnackBar('Welcome ' + res['userDetails']['user_name']);
            });
            Navigator.pop(loaderContext);
          } else {
            showInSnackBar(res['message']);
            Navigator.pop(loaderContext);
          }
        });
      } else {
        showInSnackBar('Please enter valid email');
        Navigator.pop(loaderContext);
      }
      Navigator.pop(loaderContext);
    } else {
      showInSnackBar('Please enter email / Password');
    }
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
      duration: Duration(seconds: 2),
      backgroundColor: Theme.of(context).primaryColor,
      // action: SnackBarAction(
      //   label: 'x',
      //   textColor: Colors.white,
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    ));
  }

  loaderWidget() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.5),
      builder: (BuildContext context) {
        loaderContext = context;
        return Center(
          // decoration: BoxDecoration(
          //     color: Colors.transparent,
          //     borderRadius: BorderRadius.circular(10)),
          child: GFLoader(
              loaderColorOne: Theme.of(context).primaryColor.withOpacity(0.5),
              loaderColorTwo: Theme.of(context).primaryColor,
              loaderColorThree: Theme.of(context).primaryColor.withOpacity(0.5),
              type: GFLoaderType.circle),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  height: 60,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    // onChanged: () {
                    //   email =
                    // },
                    keyboardType: TextInputType.emailAddress,
                    controller: _userEmailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      fillColor: Colors.grey.withOpacity(0.3),
                      // labelStyle: TextStyle(color: Colors.grey),
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
                    controller: _userPasswordController,
                    obscureText:
                    !_passwordVisible, //This will obscure text dynamically
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.3),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      // filled: true,
                      labelText: 'Password',
                      hintText: 'Enter your password',
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
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor
                            // Color.fromRGBO(10, 96, 195, 1),
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  IndexPage(title: 'BNET')));
                      // email = _userEmailController.text;
                      // pass = _userPasswordController.text;
                      // login(email, pass);
                      // Phoenix.rebirth(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         HomePage()),

                      // );
                     },
                    child: Text('Sign In'),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text('அல்லது', style: TextStyle(fontSize: 14, color: Colors.grey)),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  side: BorderSide(color: Colors.black)),
                              primary: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          onPressed: () {
                            //

                          },
                          icon: Icon(
                            Icons.facebook,
                            size: 28,
                            color: Color.fromRGBO(66, 103, 178, 1),
                          ),
                          label:


                          Text('Sign in')),
                        ),

                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  side: BorderSide(color: Colors.black)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              primary: Colors.black,
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          onPressed: () {
                            _handleSignIn();
                          },
                          icon: Image.asset(
                            'assets/images/google_logo.png',
                            height: 30,
                            width: 30,
                          ),
                          label: InkWell
                            (onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ForgetPassword()),
                                );
                              },
                              child: Text('Sign in')
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      TextButton(

                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUpPage()),
                            );

                        },
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        child: Text('Signup',
                            style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                      )
                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: Size(double.infinity, 30),
                        primary: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                        textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgetPassword()),
                        );
                    },
                    child: Text('Forgot Password?'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 26.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //
                //       Flexible(
                //         flex: 1,
                //         fit: FlexFit.tight,
                //         child: ElevatedButton.icon(
                //           style: ElevatedButton.styleFrom(
                //               primary: Color(0xFF3b5998), //background color of buttondth and color
                //               shape: RoundedRectangleBorder( //to set border radius to button
                //                   borderRadius: BorderRadius.circular(20)
                //               ),
                //               padding: EdgeInsets.all(13) //content padding inside button
                //           ),
                //           onPressed: () {
                //             // Respond to button press
                //           },
                //           icon: Icon(FontAwesomeIcons.facebookF, size: 16,),
                //           label: Text("Facebook", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Flexible(
                //         flex: 1,
                //         fit: FlexFit.tight,
                //         child: ElevatedButton.icon(
                //           style: ElevatedButton.styleFrom(
                //               primary: Color(0xFFDB4437), //background color of buttondth and colorelevation of button
                //               shape: RoundedRectangleBorder( //to set border radius to button
                //                   borderRadius: BorderRadius.circular(20)
                //               ),
                //               padding: EdgeInsets.all(13) //content padding inside button
                //           ),
                //           onPressed: () {
                //             _handleSignIn();
                //           },
                //           icon: Icon(FontAwesomeIcons.google, size: 16,),
                //           label: Text("Google" , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),



                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 26.0),
                //   child: Align(
                //     alignment: Alignment.bottomRight,
                //     child: TextButton(
                //       style:
                //           TextButton.styleFrom(textStyle: TextStyle(fontSize: 18)),
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) =>
                //                 IndexPage(title: 'Pengalin Kural'),
                //           ),
                //         );
                //         // Respond to button press
                //       },
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Text("Skip",
                //               style:
                //                   TextStyle(color: Theme.of(context).primaryColor)),
                //           // SizedBox(
                //           //   width: 5,
                //           // ),
                //           // Icon(Icons.arrow_forward_outlined)
                //         ],
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}

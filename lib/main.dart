import 'package:base_app/app_config.dart';
import 'package:base_app/ui/screens/auth/first_page.dart';
import 'package:base_app/ui/screens/auth/signin_page.dart';
import 'package:base_app/ui/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/production.dart';

void main() {
  //for development
  // Development();
  //for production
  Production();
  Env? env;
  MyApp(env!);
}

class MyApp extends StatefulWidget {
  MyApp(Env env);

  // This widget is the root of your application.

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userLogged = false;
  bool seen = false;

  getLoginData() async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    print('logged status');
    bool? userLogIn = loginData.getBool('userLoggedIn');
    print(userLogIn);
    userLogged = userLogIn!;
    print(userLogged);
    return userLogged;
  }

  @override
  void initState() {
    super.initState();
    getLoginData();
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
      // FirstPage();
    }
    return seen;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
                theme: ThemeData(
                  primaryColor: Color(0xff732c7b),
                  backgroundColor: Colors.white,
                ),
                debugShowCheckedModeBanner: false,
                home: Splash());
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: Color(0xff732c7b),
                primarySwatch: Colors.green,
                primaryColorLight: Color(0xfffee1e3),
                backgroundColor: Colors.white,
              ),
              home: seen
                  ? userLogged
                  ? IndexPage(title: 'BNET')
                  : SignInPage()
                  : FirstPage(),
              // IndexPage(title: 'BNET'),
            );
          }
        });
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bool lightMode =
    //     MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
        backgroundColor: Colors.white,
        // : Color(0x042a49).withOpacity(1.0),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                ),
                SizedBox(
                  height: 40,
                ),
                GFLoader(
                    loaderColorOne: Theme.of(context).primaryColor.withOpacity(0.5),
                    loaderColorTwo: Theme.of(context).primaryColor,
                    loaderColorThree:
                    Theme.of(context).primaryColor.withOpacity(0.5),
                    type: GFLoaderType.circle),
              ],
            )));
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(milliseconds: 1500));
  }
}
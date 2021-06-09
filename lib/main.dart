import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/main_screen.dart';
import './screens/sign_up_screen.dart';
import './screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        MainScreen.routeName: (context) => MainScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
    );
  }
}

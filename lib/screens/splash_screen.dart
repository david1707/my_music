import 'package:flutter/material.dart';

import 'package:avatar_glow/avatar_glow.dart';

import './login_screen.dart';
import '../widgets/start_fade_transition.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AvatarGlow(
                endRadius: 60.0,
                glowColor: Colors.blue,
                child: Material(
                  color: Colors.red,
                  shadowColor: Colors.green,
                  elevation: 8.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                    ),
                    radius: 30.0,
                  ),
                ),
              ),
              StartFadeTransition(
                curves: Curves.easeInOut,
                durationInMilliseconds: 2000,
                delay: 1000,
                child: Text(
                  'Welcome to MyMusic',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              StartFadeTransition(
                curves: Curves.easeInOut,
                durationInMilliseconds: 2000,
                delay: 2000,
                child: Text(
                  'A place where you \n control the music',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              StartFadeTransition(
                curves: Curves.easeInOut,
                durationInMilliseconds: 1000,
                delay: 3500,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Login'),
                  onPressed: () {
                    // TODO Check if the login info is SharedPreferences. If it is, navigate to main page. If not, navigate to login
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

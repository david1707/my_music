import 'package:flutter/material.dart';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:my_music/screens/widgets/start_fade_transition.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            StartFadeTransition(),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Size preferredSize;
  final List<Widget> actions;

  CustomAppBar(
      {this.title,
      this.actions,
      this.preferredSize = const Size.fromHeight(50.0)});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          },
          icon: Icon(Icons.logout),
        )
      ],
      leading: title == 'Login' || title == 'Sign up'
          ? null
          : Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
    );
  }
}

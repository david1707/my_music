import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:my_music/models/user.dart';

import '../constants.dart';
import '../widgets/rounded_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _loginUser({BuildContext context}) async {
    UserAuth user = UserAuth(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
    user.login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: kTitleSizeBig),
                    ),
                    SizedBox(
                      height: kSizedBoxLoginSign,
                    ),
                    Text('Fluff text'),
                    SizedBox(
                      height: kSizedBoxLoginSign,
                    ),
                    RoundedTextField(
                      hintText: 'Email',
                      myController: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      isPassword: false,
                    ),
                    SizedBox(
                      height: kSizedBoxLoginSign,
                    ),
                    RoundedTextField(
                      hintText: 'Password',
                      myController: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _loginUser(context: context);
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

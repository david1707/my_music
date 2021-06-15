import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../widgets/rounded_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context).settings.arguments as Map<String, String>;
    if(args != null && args.containsKey('email') && args.containsKey('password')) {
      _emailController.text = args['email'];
      _passwordController.text = args['password'];
    }

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
                      myController: _emailController ,
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
                    )
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

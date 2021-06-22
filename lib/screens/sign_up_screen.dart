import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/user_auth.dart';
import '../helper/snackbar.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/rounded_text_field.dart';

// TODO: Add validation according to Firebase standards
class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign-up';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();

  void _registerUser({BuildContext context}) async {
    UserAuth user = UserAuth(
        email: _emailController.text,
        name: _nameController.text,
        password: _password1Controller.text,
        context: context);

    user.registration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign up',
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
                      'Sign up',
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
                      hintText: 'Username',
                      myController: _nameController,
                      keyboardType: TextInputType.text,
                      isPassword: false,
                    ),
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
                      myController: _password1Controller,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: kSizedBoxLoginSign,
                    ),
                    RoundedTextField(
                      hintText: 'Repeat Password',
                      myController: _password2Controller,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_password1Controller.text ==
                            _password2Controller.text) {
                          _registerUser(
                            context: context,
                          );
                        } else {
                          showSnackBar(
                            text: 'Both passwords should be the same',
                            color: Colors.red,
                            context: context,
                          );
                        }
                      },
                      child: Text('Sign up'),
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

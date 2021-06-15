import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final TextInputType keyboardType;
  final bool isPassword;

  const RoundedTextField({
    @required this.hintText,
    @required this.myController,
    @required this.keyboardType,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: myController,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: new TextStyle(color: Colors.grey[800]),
        hintText: hintText,
        fillColor: Colors.white70,
      ),
    );
  }
}

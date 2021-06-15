import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;

  const RoundedTextField({
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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

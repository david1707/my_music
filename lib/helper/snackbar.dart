import 'package:flutter/material.dart';

void showSnackBar(String text, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    ),
  );
}

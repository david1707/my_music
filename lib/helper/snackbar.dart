import 'package:flutter/material.dart';

void showSnackBar({String text, Color color, context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: color),
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    ),
  );
}

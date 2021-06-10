import 'package:flutter/material.dart';

// TODO: List all genres. FAB/AppBar button to add a new one, click to edit (Modal), swipe to delete (Modal confirmation)

class GenreListScreen extends StatelessWidget {
  static const  routeName = '/genre-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genre List page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the Genre List page'),
          ],
        ),
      ),
    );
  }
}

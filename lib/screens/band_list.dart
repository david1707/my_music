import 'package:flutter/material.dart';

// TODO: List every band (ListView + link to the band). Add filters (by genre, from, active...)

class BandListScreen extends StatelessWidget {
  static const  routeName = '/band-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Band List page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the Band List page'),
          ],
        ),
      ),
    );
  }
}

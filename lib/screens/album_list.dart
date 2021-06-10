import 'package:flutter/material.dart';

// TODO: List every album (ListView + link to the album). Add filters (by genre, year, band...)

class AlbumListScreen extends StatelessWidget {
  static const  routeName = '/album-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album List page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the Album List page'),
          ],
        ),
      ),
    );
  }
}

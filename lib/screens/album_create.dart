import 'package:flutter/material.dart';

// TODO: Create a new Album (Date Released, Date Recorded, id Genre, Time Length, List<String> tracks, String Title, Band Band, String Photo)

class AlbumCreateScreen extends StatelessWidget {
  static const  routeName = '/album-create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Create page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the Album Create page'),
          ],
        ),
      ),
    );
  }
}

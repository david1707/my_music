import 'package:flutter/material.dart';

// TODO: Edit an Album (Date Released, Date Recorded, id Genre, Time Length, List<String> tracks, String Title, Band Band, String Photo)
// TODO: Delete button with confirmation

class AlbumEditScreen extends StatelessWidget {
  static const  routeName = '/album-edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Edit page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the Album Edit page'),
          ],
        ),
      ),
    );
  }
}

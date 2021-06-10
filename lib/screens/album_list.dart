import 'package:flutter/material.dart';

// TODO: List every album (ListView + link to the album). Add filters (by genre, year, band...)

class AlbumListScreen extends StatelessWidget {
  static const routeName = '/album-list';

  List<Map> albumList = [
    {'band': 'Dead Kennedys', 'title': 'Fresh fruit for rotten vegetables'},
    {'band': 'Minor Threat', 'title': 'Minor Threat'},
    {'band': 'Sex Pistols', 'title': 'Never mind the Bollocks'},
    {'band': 'Britney Spears', 'title': 'Oops!... I Did It Again'},
    {'band': 'Eskorbuto', 'title': 'Anti-Todo'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album List page'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: null,
              child: ListTile(
                leading: SizedBox(
                  child: Image.asset('assets/images/placeholder_album.jpg'),
                ),
                title: Text(albumList[index]['band']),
                subtitle: Text(albumList[index]['title']),
              ),
            );
          },
          itemCount: albumList.length,
        ),
      ),
    );
  }
}

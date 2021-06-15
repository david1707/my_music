import 'package:flutter/material.dart';

import '../widgets/list_of_albums.dart';

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
      body: ListOfAlbums(albumList: albumList),
    );
  }
}

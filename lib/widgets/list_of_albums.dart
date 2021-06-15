import 'package:flutter/material.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({@required this.albumList});

  final List<Map> albumList;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}

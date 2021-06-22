import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/appbar.dart';


// TODO: List every album on the User Collection (List of IDs). The same filters on Album_list

class UserCollectionScreen extends StatelessWidget {
  static const routeName = '/user-collection';

  List<Map> albumList = [
    {'band': 'Dead Kennedys', 'title': 'Fresh fruit for rotten vegetables'},
    {'band': 'Sex Pistols', 'title': 'Never mind the Bollocks'},
    {'band': 'Eskorbuto', 'title': 'Anti-Todo'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'User Collection page',),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            Map<dynamic, dynamic> album = albumList[index];
            return Dismissible(
              key: Key(album['title']),
              background: kDismissibleContainer,
              child: Card(
                elevation: null,
                child: ListTile(
                  leading: SizedBox(
                    child: Image.asset('assets/images/placeholder_album.jpg'),
                  ),
                  title: Text(album['band']),
                  subtitle: Text(album['title']),
                ),
              ),
            );
          },
          itemCount: albumList.length,
        ),
      ),
    );
  }
}

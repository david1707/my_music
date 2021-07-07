import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import '../widgets/list_of_albums.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

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
      appBar: CustomAppBar(title: 'Albums'),
      drawer: Consumer<UserProvider>(
        builder: (context, user, child) {
          if (user?.getRole != null)
            return CustomDrawer(user.getRole);
          else
            return Text('Error: No user detected');
        },
      ),
      body: ListOfAlbums(albumList: albumList),
    );
  }
}

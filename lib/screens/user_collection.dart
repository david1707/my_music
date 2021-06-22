import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

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
      appBar: CustomAppBar(title: 'Collections'),
      drawer: Consumer<UserProvider>(
        builder: (context, user, child) {
          if (user?.getRole != null)
            return CustomDrawer(user.getRole);
          else
            return Text('Error: No user detected');
        },
      ),
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

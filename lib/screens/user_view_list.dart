import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/list_of_albums.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

// TODO: A list of albums created by the user
// TODO: FAB/AppBar Icon to add a new album, swipe to delete it (Modal confirmation)

class UserViewListcreen extends StatelessWidget {
  static const routeName = '/user-view-list';

  List<Map> albumList = [
    {'band': 'Boy Harsher', 'title': 'Yr Body Is Nothing'},
    {'band': 'Aviador Dro', 'title': 'Tesis'},
    {'band': 'Belgrado', 'title': 'Obraz'},
    {'band': 'Lebanon Hanover', 'title': 'Let Them Be Alien'},
    {'band': 'Rendez-Vous', 'title': 'Distance'},
    {'band': 'Rendez-Vous', 'title': 'Boys don\t cry'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'User List page',
      ),
      drawer: Consumer<UserProvider>(
        builder: (context, user, child) {
          if (user?.getRole != null)
            return CustomDrawer(user.getRole);
          else
            return Text('Error: No user detected');
        },
      ),
      // TODO: Pass down a Icon.delete button to delete it from the list
      body: ListOfAlbums(albumList: albumList),
    );
  }
}

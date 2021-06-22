import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/list_of_albums.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

// TODO: Display albums in the wishlist, delete them, add them to the collection (remove from wishlist, add to collection)

class UserWishListScreen extends StatelessWidget {
  static const routeName = '/user-wishlist';

  List<Map> albumList = [
    {'band': 'Amon Amarth', 'title': 'Deceiver of the Gods'},
    {'band': 'Black Sabbath', 'title': 'Heaven and Hell '},
    {'band': 'Los Monjo', 'title': 'Rock Basura'},
    {'band': 'Michael Jackson', 'title': 'Thriller'},
    {'band': 'Iron Maiden', 'title': 'Brave New World'},
    {'band': 'Bauhaus', 'title': 'Burning from the Inside'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      drawer: Consumer<UserProvider>(
        builder: (context, user, child) {
          if (user?.getRole != null)
            return CustomDrawer(user.getRole);
          else
            return Text('Error: No user detected');
        },
      ),
      // TODO: Pass down a Icon.favorite button to delete it from the wishlist
      body: ListOfAlbums(albumList: albumList),
    );
  }
}

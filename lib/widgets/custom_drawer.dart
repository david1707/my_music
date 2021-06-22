import 'package:flutter/material.dart';
import 'package:my_music/screens/album_create.dart';

import 'package:my_music/screens/album_list.dart';
import 'package:my_music/screens/band_create.dart';
import 'package:my_music/screens/band_list.dart';
import 'package:my_music/screens/genre_list.dart';
import 'package:my_music/screens/main_screen.dart';
import 'package:my_music/screens/user_info.dart';
import 'package:my_music/screens/user_whislist.dart';

class CustomDrawer extends StatelessWidget {
  final String userRole;

  CustomDrawer(this.userRole);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/placeholder_collection.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed(MainScreen.routeName);
            },
          ),
          ListTile(
            title: Text('View User Info'),
            onTap: () {
              Navigator.of(context).pushNamed(UserInfoScreen.routeName);
            },
          ),
          ListTile(
            title: Text('Wishlist'),
            onTap: () {
              Navigator.of(context).pushNamed(UserWishListScreen.routeName);
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('View Albums'),
            onTap: () {
              Navigator.of(context).pushNamed(AlbumListScreen.routeName);
            },
          ),
          userRole != 'user'
              ? ListTile(
                  title: Text('Create Albums'),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AlbumCreateScreen.routeName);
                  },
                )
              : Container(),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('View Bands'),
            onTap: () {
              Navigator.of(context).pushNamed(BandListScreen.routeName);
            },
          ),
          userRole != 'user'
              ? ListTile(
                  title: Text('Create Bands'),
                  onTap: () {
                    Navigator.of(context).pushNamed(BandCreateScreen.routeName);
                  },
                )
              : Container(),
          Divider(
            thickness: 1,
          ),
          userRole != 'user'
              ? ListTile(
                  title: Text('View Genres'),
                  onTap: () {
                    Navigator.of(context).pushNamed(GenreListScreen.routeName);
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import './login_screen.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

// TODO: List all genres. FAB/AppBar button to add a new one, click to edit (Modal), swipe to delete (Modal confirmation)

class GenreListScreen extends StatelessWidget {
  static const routeName = '/genre-list';

  List<String> genreList = [
    'Punk',
    'Hardcore',
    'Ska',
    'Reggae',
    'Oi!',
    'Heavy Metal',
    'Rock',
    'Blues',
    'Jazz',
    'Hip Hop',
    'Commercial'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'List of all musical Genres'),
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
            var genre = genreList[index];
            return Dismissible(
              key: Key(genre),
              background: kDismissibleContainer,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(genre),
                    ),
                    IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) =>
                                AlertDialog(title: Text('Editing $genre')),
                          );
                        }),
                  ],
                ),
              ),
            );
          },
          itemCount: genreList.length,
        ),
      ),
    );
  }
}

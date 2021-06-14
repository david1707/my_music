import 'package:flutter/material.dart';

import '../constants.dart';

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
      appBar: AppBar(
        title: Text('Genre List page'),
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

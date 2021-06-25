import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../constants.dart';
import '../helper/snackbar.dart';
import '../provider/genre_provider.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

// TODO: List all genres. FAB/AppBar button to add a new one, click to edit (Modal), swipe to delete (Modal confirmation)

class GenreListScreen extends StatefulWidget {
  static const routeName = '/genre-list';

  @override
  _GenreListScreenState createState() => _GenreListScreenState();
}

class _GenreListScreenState extends State<GenreListScreen> {
  final TextEditingController _titleController = new TextEditingController();
  final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();
  var initialGenreTitle = '';

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
        child: Consumer<GenreProvider>(
          builder: (context, genreProvider, child) {
            List<Map<String, dynamic>> genreList = genreProvider.getGenres;
            return ListView.builder(
              itemBuilder: (context, index) {
                var genre = genreList[index];

                return Dismissible(
                  key: Key(genre['id']),
                  background: kDismissibleContainer,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(genre['title']),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _titleController.text = genre['title'];
                            showEditTitleDialog(context, genre);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: genreList.length,
            );
          },
        ),
      ),
    );
  }

  Future showEditTitleDialog(BuildContext context, Map<String, dynamic> genre) {
    print(genre);
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Form(
          key: _keyDialogForm,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.edit),
                ),
                controller: _titleController,
                maxLength: 20,
                textAlign: TextAlign.center,
                onSaved: (value) {
                  _titleController.text = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter a genre, please.';
                  } else if (value.length < 2) {
                    return 'Too short.';
                  }
                  return null;
                },
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              if (_keyDialogForm.currentState.validate()) {
                _keyDialogForm.currentState.save();
                try {
                  await GenreProvider()
                      .updateGenre(genre['id'], _titleController.text);
                  await GenreProvider().fetchGenres();
                  // TODO: This is a patch, I should use the proper way with Provider
                  setState(() {});
                  Navigator.pop(context);
                } on Exception catch (_) {
                  showSnackBar(
                    text: 'Unknown error updating the genre.',
                    color: Colors.red,
                    context: context,
                  );
                }
              }
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

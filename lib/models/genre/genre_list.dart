import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './genre.dart';
import '../../constants.dart';
import '../../helper/snackbar.dart';

class GenreList extends StatelessWidget {
  final TextEditingController _titleController;
  final GlobalKey<FormState> _keyDialogForm;

  GenreList(this._titleController, this._keyDialogForm);

  @override
  Widget build(BuildContext context) {
    var genres = Provider.of<List<Genre>>(context);

    return ListView.builder(
      itemBuilder: (context, index) {
        Genre genre = genres[index];
        return Dismissible(
          key: Key(genre.id),
          background: kDismissibleContainer,
          confirmDismiss: (DismissDirection direction) async {
            switch (direction) {
              case DismissDirection.endToStart:
                return await showDeleteDialog(context, genre);
              case DismissDirection.startToEnd:
                return await showDeleteDialog(context, genre);
              case DismissDirection.horizontal:
              case DismissDirection.vertical:
              case DismissDirection.up:
              case DismissDirection.none:
              case DismissDirection.down:
                assert(false);
                break;
            }
            return false;
          },
          child: Card(
            child: Row(
              children: [
                Expanded(
                  child: Text(genre.title),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _titleController.text = genre.title;
                    showEditTitleDialog(context, genre);
                  },
                ),
              ],
            ),
          ),
        );
      },
      itemCount: genres.length,
    );
  }

  Future showDeleteDialog(BuildContext context, Genre genre) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Do you want to delete ${genre.title}?'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              try {
                // await GenreProvider().deleteGenre(genre['id']);
              } on Exception catch (_) {
                showSnackBar(
                  text: 'Unknown error updating the genre.',
                  color: Colors.red,
                  context: context,
                );
              } finally {
                Navigator.pop(context);
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

  Future showEditTitleDialog(BuildContext context, Genre genre) {
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
                  await Genre.updateGenre(genre.id, _titleController.text);
                } on Exception catch (_) {
                  showSnackBar(
                    text: 'Unknown error updating the genre.',
                    color: Colors.red,
                    context: context,
                  );
                } finally {
                  Navigator.pop(context);
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

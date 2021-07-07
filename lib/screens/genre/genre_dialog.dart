import 'package:flutter/material.dart';

import '../../models/genre.dart';
import '../../helper/snackbar.dart';

Future showDeleteDialog(BuildContext context, Genre genre) async {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Do you want to delete ${genre.title}?'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            try {
              await Genre.deleteGenre(genre.id);
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
            'Delete',
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

Future showEditTitleDialog(
    BuildContext context,
    Genre genre,
    GlobalKey<FormState> _keyDialogForm,
    TextEditingController _titleController) {
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
                _titleController.text = '';
                Navigator.pop(context);
              }
            }
          },
          child: Text(
            'Update',
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

Future showAddDialog(BuildContext context, GlobalKey<FormState> _keyDialogForm,
    TextEditingController _titleController) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Form(
        key: _keyDialogForm,
        child: Column(
          children: <Widget>[
            TextFormField(
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
                await Genre.addGenre(_titleController.text);
              } on Exception catch (_) {
                showSnackBar(
                  text: 'Unknown error creating the genre.',
                  color: Colors.red,
                  context: context,
                );
              } finally {
                _titleController.text = '';
                Navigator.pop(context);
              }
            }
          },
          child: Text(
            'Create',
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

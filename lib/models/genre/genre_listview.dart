import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'genre.dart';
import 'genre_dialog.dart';
import '../../constants.dart';

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
                    showEditTitleDialog(
                      context,
                      genre,
                      _keyDialogForm,
                      _titleController,
                    );
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
}

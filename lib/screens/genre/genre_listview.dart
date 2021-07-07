import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './genre_dialog.dart';
import '../../models/genre.dart';
import '../../constants.dart';

class GenreListView extends StatelessWidget {
  final TextEditingController _titleController;
  final GlobalKey<FormState> _keyDialogForm;

  GenreListView(this._titleController, this._keyDialogForm);

  @override
  Widget build(BuildContext context) {
    var genres = Provider.of<List<Genre>>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        Genre genre = genres[index];
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(genre.id),
          background: kDismissibleContainer,
          confirmDismiss: (DismissDirection direction) async {
            return await showDeleteDialog(context, genre);
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

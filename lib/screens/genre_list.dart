import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../constants.dart';
import '../helper/snackbar.dart';
import '../models/genre.dart';
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
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference genresCollection = db.collection('genres');

  Stream<List<Genre>> genreStream() {
    return genresCollection.snapshots().map((list) => list.docs
        .map((genreSnapshot) => Genre.fromFireStore(genreSnapshot))
        .toList());
  }

  Future<void> addGenre() async {
    DocumentReference newGenre = genresCollection.doc();

    await newGenre.set({'title': 'Heavy metal'});
  }

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
      bottomNavigationBar: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          addGenre();
        },
      ),
      body: Center(
        child: StreamProvider<List<Genre>>.value(
          value: genreStream(),
          initialData: [],
          child: GenreList(),
        ),

        // child: ListView.builder(
        //   itemBuilder: (context, index) {
        //     Map genre = {'id': 'xD', 'title': 'xD'};
        //     return Dismissible(
        //       key: Key(genre['id']),
        //       background: kDismissibleContainer,
        //       confirmDismiss: (DismissDirection direction) async {
        //         switch (direction) {
        //           case DismissDirection.endToStart:
        //             return await showDeleteDialog(context, genre);
        //           case DismissDirection.startToEnd:
        //             return await showDeleteDialog(context, genre);
        //           case DismissDirection.horizontal:
        //           case DismissDirection.vertical:
        //           case DismissDirection.up:
        //           case DismissDirection.none:
        //           case DismissDirection.down:
        //             assert(false);
        //             break;
        //         }
        //         return false;
        //       },
        //       child: Card(
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: Text(genre['title']),
        //             ),
        //             IconButton(
        //               icon: Icon(Icons.edit),
        //               onPressed: () {
        //                 _titleController.text = genre['title'];
        //                 showEditTitleDialog(context, genre);
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        //   itemCount: 4,
        // ),
      ),
    );
  }

  Future showEditTitleDialog(BuildContext context, Map<String, dynamic> genre) {
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
                  // await GenreProvider()
                  //     .updateGenre(genre['id'], _titleController.text);
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

  Future showDeleteDialog(
      BuildContext context, Map<String, dynamic> genre) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Do you want to delete ${genre['title']}?'),
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
}

class GenreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var genres = Provider.of<List<Genre>>(context);
    return ListView(
        children: genres.map((Genre genre) => GenreItem(genre)).toList());
  }
}

class GenreItem extends StatelessWidget {
  final Genre genre;
  GenreItem(this.genre);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        genre.title,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

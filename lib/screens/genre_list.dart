import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/genre/genre.dart';
import '../models/genre/genre_list.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

final TextEditingController _titleController = new TextEditingController();
final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();

class GenreListScreen extends StatefulWidget {
  static const routeName = '/genre-list';

  @override
  _GenreListScreenState createState() => _GenreListScreenState();
}

class _GenreListScreenState extends State<GenreListScreen> {
  static final CollectionReference genresCollection =
      FirebaseFirestore.instance.collection('genres');

  Stream<List<Genre>> genreStream() {
    return genresCollection.snapshots().map(
          (list) => list.docs
              .map((genreSnapshot) => Genre.fromFireStore(genreSnapshot))
              .toList(),
        );
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
          Genre.addGenre(genresCollection, 'Parapapa');
        },
      ),
      body: Center(
        child: StreamProvider<List<Genre>>.value(
          value: genreStream(),
          initialData: [],
          child: GenreList(_titleController, _keyDialogForm),
        ),
      ),
    );
  }
}

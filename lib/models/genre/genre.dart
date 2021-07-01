import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Genre with ChangeNotifier {
  String id;
  String title;
  static final CollectionReference genresCollection =
      FirebaseFirestore.instance.collection('genres');

  Genre({this.id, this.title});

  factory Genre.fromFireStore(DocumentSnapshot snapshot) {
    Map genreData = snapshot.data();
    return Genre(id: snapshot.id, title: genreData['title']);
  }

  static Future<void> addGenre(
    CollectionReference genresCollection,
    String title,
  ) async {
    await genresCollection.doc().set({'title': title});
  }

  static Future<void> updateGenre(String genreID, String genreNewTitle) async {
    await genresCollection.doc(genreID).update({'title': genreNewTitle});
  }
}

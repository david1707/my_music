import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Genre with ChangeNotifier {
  String title;

  Genre({this.title});

  factory Genre.fromFireStore(DocumentSnapshot snapshot) {
    Map genreData = snapshot.data();
    return Genre(title: genreData['title']);
  }
}

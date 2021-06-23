import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GenreProvider with ChangeNotifier {
  static List<Map<String, dynamic>> _genres = [];

  GenreProvider();

  void fetchGenres() async {
    try {
      QuerySnapshot<Map<String, dynamic>> genres =
          await FirebaseFirestore.instance.collection('genres').get();

      genres.docs.forEach((genre) {
        _genres.add({'id': genre.id, 'title': genre['title']});
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<Map<String, dynamic>> get getGenres {
    return _genres;
  }
}

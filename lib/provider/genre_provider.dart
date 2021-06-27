import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GenreProvider with ChangeNotifier {
  static List<Map<String, dynamic>> _genres = [];

  Future fetchGenres() async {
    try {
      QuerySnapshot<Map<String, dynamic>> genres =
          await FirebaseFirestore.instance.collection('genres').get();

      // Reseting the Genres list (Important!)
      _genres = [];
      genres.docs.forEach((genre) {
        _genres.add({'id': genre.id, 'title': genre['title']});
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future updateGenre(String id, String title) async {
    try {
      await FirebaseFirestore.instance
          .collection('genres')
          .doc(id)
          .update({'title': title});
      var updatedGenre = _genres.firstWhere((element) => element['id'] == id);
      updatedGenre['title'] = title;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future deleteGenre(String id) async {
    try {
      await FirebaseFirestore.instance.collection('genres').doc(id).delete();
      _genres.removeWhere((element) => element['id'] == id);
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  List<Map<String, dynamic>> get getGenres {
    return _genres;
  }
}

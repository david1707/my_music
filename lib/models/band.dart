import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Band with ChangeNotifier {
  String id;
  bool active;
  String description;
  String from;
  String genre;
  String genreId;
  String members;
  String name;

  Band({
    this.id,
    this.active,
    this.description,
    this.from,
    this.genre,
    this.genreId,
    this.members,
    this.name,
  });

  factory Band.fromFireStore(DocumentSnapshot snapshot) {
    Map bandData = snapshot.data();
    return Band(
      id: snapshot.id,
      active: bandData['active'],
      description: bandData['description'],
      from: bandData['from'],
      genre: bandData['genre'],
      genreId: bandData['genreId'],
      members: bandData['members'],
      name: bandData['name'],
    );
  }
}

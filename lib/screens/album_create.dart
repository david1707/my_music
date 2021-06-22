import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/appbar.dart';

// TODO: Create a new Album (Date Released, id Genre, Time Length, List<String> tracks, String Title, Band Band, String Photo)

class AlbumCreateScreen extends StatefulWidget {
  static const routeName = '/album-create';

  @override
  _AlbumCreateScreenState createState() => _AlbumCreateScreenState();
}

class _AlbumCreateScreenState extends State<AlbumCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Create a new Album',),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Add a new album',
                style: TextStyle(fontSize: kTitleSize),
              ),
              // Create own TextFormField Widget to simplify the widget used on AlbumCreate, AlbumEdit, BandCreate, BandEdit, etc
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Band',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Genre',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date Released',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tracks',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Length',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Photo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

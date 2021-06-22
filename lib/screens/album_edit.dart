import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

// TODO: Edit an Album (Date Released, id Genre, Time Length, List<String> tracks, String Title, Band Band, String Photo)
// TODO: Delete button with confirmation

class AlbumEditScreen extends StatefulWidget {
  static const routeName = '/album-edit';

  @override
  _AlbumEditScreenState createState() => _AlbumEditScreenState();
}

class _AlbumEditScreenState extends State<AlbumEditScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Album Edit page',
      ),
           drawer: Consumer<UserProvider>(
        builder: (context, user, child) {
          if (user?.getRole != null)
            return CustomDrawer(user.getRole);
          else
            return Text('Error: No user detected');
        },
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Edit album',
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

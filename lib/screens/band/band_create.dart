import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../provider/user_provider.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';

// TODO: Create a new Band (String name, String Description, String Members, id Genre, String From, bool Active, String Photo)

class BandCreateScreen extends StatefulWidget {
  static const routeName = '/band-create';

  @override
  _BandCreateScreenState createState() => _BandCreateScreenState();
}

class _BandCreateScreenState extends State<BandCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add a new Band'),
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
                'Add a new band',
                style: TextStyle(fontSize: kTitleSize),
              ),
              // Create own TextFormField Widget to simplify the widget used on AlbumCreate, AlbumEdit, BandCreate, BandEdit, etc
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Genre',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'From',
                ),
              ),
              // Change it into a Switch
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Active',
                ),
              ),
              // Show list? Tag-like with textfield tags?
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Members',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
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

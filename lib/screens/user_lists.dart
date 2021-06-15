import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/user_view_list.dart';

// TODO: A list of Lists created by the user with their favourites albums
// TODO: FAB/AppBar Icon to create a new one, swipe to delete (Modal confirmation), click to view/edit

class UserListsScreen extends StatefulWidget {
  static const routeName = '/user-lists';

  @override
  _UserListsScreenState createState() => _UserListsScreenState();
}

class _UserListsScreenState extends State<UserListsScreen> {
  List<String> listList = [
    'Romantic music',
    'Music to tear everything down',
    'PostPunk/Darkwave',
    'HipHop/Rap',
    'Folk music',
    'Jazz'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Lists page'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            String list = listList[index];
            return Dismissible(
              key: Key(list),
              background: kDismissibleContainer,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(UserViewListcreen.routeName),
                child: Card(
                  elevation: null,
                  child: ListTile(
                    leading: SizedBox(
                      child: Image.asset(
                          'assets/images/placeholder_collection.jpg'),
                    ),
                    title: Text(list),
                  ),
                ),
              ),
            );
          },
          itemCount: listList.length,
        ),
      ),
    );
  }
}

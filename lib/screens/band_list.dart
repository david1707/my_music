import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

// TODO: List every band (ListView + link to the band). Add filters (by genre, from, active...)

class BandListScreen extends StatelessWidget {
  static const routeName = '/band-list';

  List<Map> bandList = [
    {'title': 'Dead Kennedys', 'genre': 'Punk'},
    {'title': 'Minor Threat', 'genre': 'Straight Edge'},
    {'title': 'The Specials', 'genre': 'Ska'},
    {'title': 'Sex Pistols', 'genre': 'Punk'},
    {'title': 'Agent Orange', 'genre': 'Surf Punk'},
    {'title': 'Britney Spears', 'genre': 'Pop'},
    {'title': 'Eskorbuto', 'genre': 'Punk'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Band List page',
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
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: null,
              child: ListTile(
                leading: SizedBox(
                  child: Image.asset('assets/images/placeholder_band.png'),
                ),
                title: Text(bandList[index]['title']),
                subtitle: Text(bandList[index]['genre']),
              ),
            );
          },
          itemCount: bandList.length,
        ),
      ),
    );
  }
}

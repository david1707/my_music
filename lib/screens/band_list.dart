import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

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
      appBar: CustomAppBar(title: 'Band List page',),
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

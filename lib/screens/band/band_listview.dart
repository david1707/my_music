import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../models/band.dart';

class BandListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bands = Provider.of<List<Band>>(context);
    print(bands);

    return ListView.builder(
      itemCount: bands.length,
      itemBuilder: (context, index) {
        Band band = bands[index];
        return Text(band.name);
      },
    );
  }
}

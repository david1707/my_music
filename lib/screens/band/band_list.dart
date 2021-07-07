import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './band_listview.dart';
import '../../models/band.dart';
import '../../provider/user_provider.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';

class BandListScreen extends StatefulWidget {
  static const routeName = '/band-list';

  @override
  _BandListScreenState createState() => _BandListScreenState();
}

class _BandListScreenState extends State<BandListScreen> {
  static final CollectionReference bandsCollection =
      FirebaseFirestore.instance.collection('bands');

  Stream<List<Band>> bandStream() {
    return bandsCollection.orderBy('name').snapshots().map((list) => list.docs
        .map((bandSnapshot) => Band.fromFireStore(bandSnapshot))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bands'),
      drawer: Consumer<UserProvider>(
        builder: (context, user, child) {
          if (user?.getRole != null)
            return CustomDrawer(user.getRole);
          else
            return Text('Error: No user detected');
        },
      ),
      body: Center(
        child: StreamProvider<List<Band>>.value(
            value: bandStream(), initialData: [], child: BandListView()),
      ),
    );
  }
}

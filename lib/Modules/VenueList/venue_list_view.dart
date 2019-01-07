import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/VenueList/pages.dart';

class VenueListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: <Widget>[
          Pages(
            viewModel:pages[2],
            percentVisible: 1.0,
          ),
          Pages(
            viewModel: pages[0],
            percentVisible: 1.0,
          )
        ],
      ),
    );
  }
}

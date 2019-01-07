import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/VenueList/pages.dart';

class VenueListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: <Widget>[
          Pages(
            viewModel: PageViewModel(Colors.blue, "assets/phoneMessageIcon.png",
                "Hotels", "This is body", null),
          )
        ],
      ),
    );
  }
}

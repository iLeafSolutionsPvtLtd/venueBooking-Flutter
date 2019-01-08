import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/VenueList/page_dragger.dart';
import 'package:venue_booking/Modules/VenueList/venue_list_bloc.dart';

class VenueListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<SlideUpdate>(
          stream: venueListBloc.venueListStream,
          builder: (context, snapshot) {
            print("no data");
            return Stack(
              children: <Widget>[
                VenueList(),
                VenueListMapView(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class VenueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey,
              child: Container(
                height: 50.0,
              ),
            );
          }),
    );
  }
}

class VenueListMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        ),
        Container(
            color: Colors.white,
            height: 200,
            child: PageView.builder(
                controller: PageController(viewportFraction: 0.50),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                    child: Container(
                      height: 200,
                      width: 200,
                    ),
                    color: Colors.blue,
                  );
                }))
      ],
    );
  }
}

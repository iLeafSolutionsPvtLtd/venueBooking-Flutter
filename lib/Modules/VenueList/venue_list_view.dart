import 'package:flutter/material.dart';
import 'package:slide_container/slide_container.dart';
import 'package:slide_container/slide_container_controller.dart';
import 'package:venue_booking/Modules/VenueList/venue_list_bloc.dart';

class VenueListingView extends StatelessWidget {
  final SlideContainerController controller = SlideContainerController();
  final SlideContainerController listcontroller = SlideContainerController();

  forceMapViewSlideBack() {
    Future.delayed(Duration(milliseconds: 300), () {
      controller.forceSlide(SlideContainerDirection.topToBottom);
    });
  }

  forceListViewSlideBack() {
    Future.delayed(Duration(milliseconds: 300), () {
      listcontroller.forceSlide(SlideContainerDirection.topToBottom);
    });
  }

  Widget get stack1 => Stack(
        children: <Widget>[
          MapView(forceMapViewSlideBack, controller),
          VenueSmallListView(forceListViewSlideBack, listcontroller),
        ],
      );

  Widget get stack2 => Stack(
        children: <Widget>[
          VenueSmallListView(forceListViewSlideBack, listcontroller),
          MapView(forceMapViewSlideBack, controller),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<bool>(
          stream: venueMapviewBloc.listController,
          initialData: false,
          builder: (context, snapshot) {
            return snapshot.data ? stack1 : stack2;
            //stack;
          },
        ),
      ),
    );
  }
}

class MapView extends StatefulWidget {
  VoidCallback mapViewForceSlide;
  final controller;
  MapView(this.mapViewForceSlide, this.controller);
  @override
  MapViewState createState() {
    return new MapViewState();
  }
}

class MapViewState extends State<MapView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SlideContainer(
      slideDirection: SlideContainerDirection.bottomToTop,
      controller: widget.controller,
      onSlideCompleted: () {
        widget.mapViewForceSlide();
        venueMapviewBloc.slideComplete(true);
      },
      onSlide: venueMapviewBloc.opacityChanged,
      child: StreamBuilder<double>(
        initialData: 1.0,
        stream: venueMapviewBloc.opacityStream,
        builder: (context, snapshot) {
          print('rebuilding listview container');
          return Opacity(
            opacity:
                snapshot.data != 1 ? (1 - snapshot.data).clamp(0.0, 1.0) : 1.0,
            child: Transform.scale(
              scale: snapshot.data != 1
                  ? (1 - snapshot.data).clamp(0.0, 1.0)
                  : 1.0,
              child: VenueListMapView(),
            ),
          );
        },
      ),
    ));
  }
}

class VenueSmallListView extends StatefulWidget {
  VoidCallback listViewForceSlide;
  final controller;
  VenueSmallListView(this.listViewForceSlide, this.controller);
  @override
  VenueSmallListViewState createState() {
    return new VenueSmallListViewState();
  }
}

class VenueSmallListViewState extends State<VenueSmallListView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SlideContainer(
      slideDirection: SlideContainerDirection.rightToLeft,
      controller: widget.controller,
      onSlideCompleted: () {
        venueMapviewBloc.slideComplete(false);
        widget.listViewForceSlide();
      },
      onSlide: venueListViewBloc.opacityChanged,
      child: StreamBuilder<double>(
        initialData: 1.0,
        stream: venueListViewBloc.opacityStream,
        builder: (context, snapshot) {
          return Opacity(
            opacity:
                snapshot.data != 1 ? (1 - snapshot.data).clamp(0.0, 1.0) : 1.0,
            child: Transform.scale(
              scale: snapshot.data != 1
                  ? (1 - snapshot.data).clamp(0.0, 1.0)
                  : 1.0,
              child: Container(
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
              ),
            ),
          );
        },
      ),
    ));
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

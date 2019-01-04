import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/SelectLocation/select_location_view.dart';

class SelectLocationView extends StatelessWidget {
  // empty container
  final Widget emptyContainer = Container(
    height: 64.0,
  );

  // title section
  final Widget titleSection = Container(
    padding: EdgeInsets.all(15.0),
    child: Text("Hi there! \nWhere are you from?",
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontFamily: "GoogleSans",
            fontStyle: FontStyle.normal,
            fontSize: 33.0)),
  );

  // subtitle section
  final Widget subTitleSection = Container(
    padding: EdgeInsets.all(15.0),
    child: Text(
        "We need your current location to load near by venues and events. Please give us access to your GPS location or you can enter mannulally below.",
        style: const TextStyle(
            color: const Color(0xffc7c7c7),
            fontWeight: FontWeight.w400,
            fontFamily: "GoogleSans",
            fontStyle: FontStyle.normal,
            fontSize: 16.7)),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: ListView(
          children: <Widget>[
            emptyContainer,
            titleSection,
            subTitleSection,
            GetLocationView()
          ],
        ),
      )),
    );
  }
}

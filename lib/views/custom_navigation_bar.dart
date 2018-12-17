import 'package:flutter/material.dart';

class CustomNavigationBarWithLocation extends StatefulWidget {
  final String _title;
  final String _location;

  CustomNavigationBarWithLocation(this._title, this._location);

  @override
  _CustomNavigationBarWithLocationState createState() =>
      _CustomNavigationBarWithLocationState();
}

class _CustomNavigationBarWithLocationState
    extends State<CustomNavigationBarWithLocation> {
  @override
  Widget build(BuildContext context) {
    Widget navigationBar = Container(
      height: 64.0,
    );

    Widget navigationBarTitle = new Text(widget._title,
        style: const TextStyle(
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
          fontFamily: "GoogleSans",
          fontStyle: FontStyle.normal,
          fontSize: 21.5,
        ));

    Widget locationLabel = new Text(widget._location,
        style: const TextStyle(
            color: const Color(0xff797b87),
            fontWeight: FontWeight.w400,
            fontFamily: "GoogleSans",
            fontStyle: FontStyle.normal,
            fontSize: 11.0));

    Widget locationIcon = new Icon(
      Icons.location_on,
      size: 11.0,
      color: const Color(0xff797b87),
    );

    Widget greenLine = new Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        height: 1.0,
        decoration: BoxDecoration(color: Colors.green));

    return Container(
      height: 85,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 34.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child: navigationBarTitle,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: <Widget>[
                            locationIcon,
                            locationLabel,
                          ],
                        )),
                    Container(
                      height: 4,
                    ),
                  ],
                ),
              )),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 15),
                child: RawMaterialButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context, []);
                    }),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15.0),
            height: 2,
            child: greenLine,
          )
        ],
      ),
    );
  }
}

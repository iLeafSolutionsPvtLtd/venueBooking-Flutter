import 'package:flutter/material.dart';

class SportsSelectionView extends StatefulWidget {
  @override
  _SportsSelectionViewState createState() => _SportsSelectionViewState();
}

class _SportsSelectionViewState extends State<SportsSelectionView> {
  List<String> litems = ['Football', 'Badminton', 'Basketball', 'Tennis'];

  getWidthOfString(string) {
    Widget a = new Text(string,
        textAlign: TextAlign.left,
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontFamily: "GoogleSans",
            fontStyle: FontStyle.normal,
            fontSize: 20.5));
    return (a.toString().length * string.length / 8).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    getWidthOfString('');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5, right: 15, left: 15),
          child: new Text("Select your sport",
              style: const TextStyle(
                  color: const Color(0xffe8e8e8),
                  fontWeight: FontWeight.w700,
                  fontFamily: "GoogleSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 24.0)),
        ),
        Container(
          height: 50.0,
          padding: EdgeInsets.only(top: 5, left: 15, right: 15),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: litems.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: getWidthOfString(litems[index]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/football.png'),
                    Container(
                      width: 8,
                    ),
                    Expanded(
                        child: new Text(litems[index],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                                fontFamily: "GoogleSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.5)))
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
